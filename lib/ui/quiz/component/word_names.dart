import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/word_name_state.dart';
import 'package:word_quiz/provider/word_input_notifier.dart';
import 'package:word_quiz/ui/quiz/component/name_text.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

/// 入力した名前の一覧です。
class WordNames extends StatefulHookConsumerWidget {
  const WordNames({
    super.key,
    required this.onStartWordAnimation,
    required this.onEndWordAnimation,
  });

  /// アニメーション開始時のコールバック
  final VoidCallback onStartWordAnimation;

  /// アニメーション終了時のコールバック
  final VoidCallback onEndWordAnimation;

  @override
  WordNamesState createState() => WordNamesState();
}

class WordNamesState extends ConsumerState<WordNames> {
  /// 文字数
  static const _wordLength = 5;

  /// 列数
  static const rowNum = 5;

  /// 名前の列同士のスペース
  static const double _wordRowSpace = 12;

  /// 文字1文字同士のスペース
  static const double _nameRowSpace = 2;

  /// 文字1文字の最大サイズ
  static const Size _nameTextMaxSize = Size(72, 64);

  /// 1文字のWidgetのサイズ
  late Size _wordNameSize;

  @override
  void didChangeDependencies() {
    _wordNameSize = _calcWordNameSize(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final quizType = QuizType.of(context).quizType;
    final wordAnimation = useState<bool>(false);
    ref.listen(wordInputNotifierProvider(quizType), (previous, next) async {
      if (wordAnimation.value) {
        return;
      }
      // データ取得完了後
      if ((previous?.hasValue ?? false) && next.hasValue) {
        final prevResultListLength = previous!.value!.wordsResultList.length;
        final nextResultListLength = next.value!.wordsResultList.length;
        // 1つ前の状態から、判定結果が増えていた場合
        if (prevResultListLength < nextResultListLength) {
          wordAnimation.value = true;
          widget.onStartWordAnimation();
        }
      }
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildNameColumn(false, quizType, wordAnimation),
        const SizedBox(width: _wordRowSpace),
        _buildNameColumn(true, quizType, wordAnimation),
      ],
    );
  }

  /// 名前を1行構築します。
  Widget _buildNameColumn(
    bool hasOffset,
    QuizTypes quizType,
    ValueNotifier<bool> wordAnimation,
  ) {
    return Column(
      children: [
        for (var i = 0; i < rowNum; i++)
          _buildNameLine(
            i + (hasOffset ? rowNum : 0),
            quizType,
            wordAnimation,
          ),
      ],
    );
  }

  /// 名前を1つ構築します。
  Widget _buildNameLine(
    int rowIndex,
    QuizTypes quizType,
    ValueNotifier<bool> wordAnimation,
  ) {
    final wordInputNotifier = ref.watch(wordInputNotifierProvider(quizType));
    if (!wordInputNotifier.hasValue) {
      return const SizedBox.shrink();
    }

    final nameStatesValue = useState<List<WordNameState>>(<WordNameState>[]);
    final wordInput = wordInputNotifier.value!;
    final inputIndex = wordInput.inputIndex;
    final wordsResultList = wordInput.wordsResultList;

    // 入力最終行はアニメーション対象
    final isLastRow = rowIndex == inputIndex - 1;
    final nameStates = (rowIndex < wordsResultList.length
            ? wordsResultList[rowIndex]
            : <WordNameState>[]) ??
        [];

    // 入力最終行がアニメーション対象となった場合
    if (isLastRow && wordAnimation.value) {
      useEffect(
        () {
          // 1文字目は入れておく
          nameStatesValue.value = nameStates.sublist(0, 1);
          final timer =
              Timer.periodic(const Duration(milliseconds: 300), (timer) {
            // 1文字ずつ増やしていく
            if (nameStatesValue.value.length < nameStates.length) {
              nameStatesValue.value =
                  nameStates.sublist(0, nameStatesValue.value.length + 1);
            }

            // 最後の文字まで到達していたら終了
            if (nameStatesValue.value.length == nameStates.length) {
              timer.cancel();
              widget.onEndWordAnimation();
              wordAnimation.value = false;
            }
          });
          return timer.cancel;
        },
        const [],
      );
    } else {
      nameStatesValue.value = nameStates;
    }

    final wordsList = wordInput.wordsList;
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        children: [
          for (var i = 0; i < _wordLength; i++)
            Padding(
              padding: i == 0
                  ? EdgeInsets.zero
                  : const EdgeInsets.only(left: _nameRowSpace),
              child: NameText(
                text: rowIndex < wordsList.length &&
                        i < wordsList[rowIndex]!.length
                    ? wordsList[rowIndex]![i]
                    : '',
                nameState: i < nameStatesValue.value.length
                    ? nameStatesValue.value[i]
                    : WordNameState.none,
                width: _wordNameSize.width,
                height: _wordNameSize.height,
              ),
            ),
        ],
      ),
    );
  }

  /// 1文字のサイズを計算します。
  static Size _calcWordNameSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // 画面サイズから、左右端から確保したいパディングと列同士のスペースを引く(横並びは10文字)
    final preferredWidth =
        (screenWidth - _wordRowSpace - 16 - _nameRowSpace * 8) / 10;
    // 最大幅・高さを考慮して1文字の幅・高さを確定
    final width = min(_nameTextMaxSize.width, preferredWidth);
    final height = width * _nameTextMaxSize.height / _nameTextMaxSize.width;
    return Size(width, height);
  }
}
