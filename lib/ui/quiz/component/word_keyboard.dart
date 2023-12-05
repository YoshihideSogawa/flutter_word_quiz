import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/logic/keyboard_checker.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/model/word_keyboard_state.dart';
import 'package:word_quiz/model/word_name_state.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/provider/word_input_notifier.dart';
import 'package:word_quiz/repository/settings/input_type_repository.dart';
import 'package:word_quiz/ui/quiz/component/input_key.dart';
import 'package:word_quiz/ui/quiz/component/keyboard_map.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

/// キーボードです。
class WordKeyboard extends StatefulHookConsumerWidget {
  const WordKeyboard({
    super.key,
    required this.wordAnimation,
  });

  /// 入力文字のアニメーション中かどうか
  final ValueNotifier<bool> wordAnimation;

  @override
  WordKeyboardState createState() => WordKeyboardState();
}

class WordKeyboardState extends ConsumerState<WordKeyboard> {
  /// キー同士のスペース
  static const double _keySpace = 4;

  /// 文字1文字の最大サイズ
  static const Size _nameInputMaxSize = Size(72, 64);

  /// キー1文字のサイズ
  late Size _keySize;

  /// [Timer]
  Timer? _timer;

  @override
  void didChangeDependencies() {
    _keySize = _calcWordKeySize(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final quizType = QuizType.of(context).quizType;
    final inputType = ref.watch(inputTypeRepositoryProvider);
    final quizPage = ref.watch(quizPageProvider(quizType));

    // 入力タイプの取得を待つ
    if (!inputType.hasValue) {
      return const SizedBox.shrink();
    }

    final wordInputNotifier = ref.watch(wordInputNotifierProvider(quizType));
    if (!wordInputNotifier.hasValue) {
      return const SizedBox.shrink();
    }

    final nameStatesValue = useRef(<WordNameState>[]);
    final resultList =
        useState<Map<String, WordKeyboardInfo>>(<String, WordKeyboardInfo>{});
    final wordInput = wordInputNotifier.value!;
    final wordsResultList = wordInput.wordsResultList;

    // 入力最終行はアニメーション対象
    final nameStates = wordsResultList.isNotEmpty
        ? wordsResultList.last ?? <WordNameState>[]
        : <WordNameState>[];
    // アニメーションを行う場合
    if (widget.wordAnimation.value) {
      // タイマーが実行中でない場合
      if (!(_timer?.isActive ?? false)) {
        nameStatesValue.value = <WordNameState>[];
        void timerCallback(Timer timer) {
          // 最後の文字まで到達していたら終了
          // 1周待ってwait時間に充てる
          if (nameStatesValue.value.length == nameStates.length) {
            timer.cancel();
            return;
          }

          // 1文字ずつ増やしていく
          nameStatesValue.value =
              nameStates.sublist(0, nameStatesValue.value.length + 1);

          final currentWordsResultList = [...wordsResultList]
            ..removeLast()
            ..add(nameStatesValue.value);

          resultList.value =
              checkKeyboard(wordInput.wordsList, currentWordsResultList);
        }

        // タイマーの初期化
        _timer?.cancel();
        _timer =
            Timer.periodic(const Duration(milliseconds: 300), timerCallback);
        // 初回はノータイムでコール
        timerCallback.call(_timer!);
      }
    } else {
      nameStatesValue.value = nameStates;
      resultList.value = wordInput.keyResultList;
    }

    final keyResultList = resultList.value;
    if (inputType.valueOrNull == InputTypes.switching) {
      return Stack(
        children: [
          if (quizPage.normalKeyboard)
            _buildKeyboard(standardKeyboardMap, keyResultList),
          if (!quizPage.normalKeyboard)
            _buildKeyboard(advancedKeyboardMap, keyResultList),
        ],
      );
    }

    return Column(
      children: [
        _buildKeyboard(standardKeyboardMap, keyResultList),
        const SizedBox(height: 12),
        _buildKeyboard(advancedKeyboardMap, keyResultList),
      ],
    );
  }

  Widget _buildKeyboard(
    List<String> keyMap,
    Map<String, WordKeyboardInfo>? resultList,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < keyMap.length / 5; i++)
          Padding(
            padding: i == 0
                ? EdgeInsets.zero
                : const EdgeInsets.only(left: _keySpace),
            child: _buildKeyColumn(keyMap, i, resultList),
          ),
      ],
    );
  }

  /// キーの1行を構築します。
  Widget _buildKeyColumn(
    List<String> keyMap,
    int index,
    Map<String, WordKeyboardInfo>? resultList,
  ) {
    return Column(
      children: [
        for (var i = 0; i < 5; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: _keySpace),
            child: InputKey(
              enabled: !widget.wordAnimation.value,
              text: keyMap[index * 5 + i],
              width: _keySize.width,
              height: _keySize.height,
              keyboardInfo:
                  (resultList?.containsKey(keyMap[index * 5 + i]) ?? false)
                      ? (resultList?[keyMap[index * 5 + i]] ??
                          WordKeyboardInfo.none)
                      : WordKeyboardInfo.none,
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  /// キー1文字のサイズを計算します。
  static Size _calcWordKeySize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // 画面サイズから、左右端から確保したいパディングとキー同士のスペースを引く(横並びは10文字)
    final preferredWidth = (screenWidth - _keySpace * 9 - 16) / 10;
    // 最大幅・高さを考慮して1文字の幅・高さを確定
    final width = min(_nameInputMaxSize.width, preferredWidth);
    final height = width * _nameInputMaxSize.height / _nameInputMaxSize.width;
    return Size(width, height);
  }
}
