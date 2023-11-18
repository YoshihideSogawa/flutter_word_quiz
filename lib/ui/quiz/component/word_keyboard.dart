import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/model/word_keyboard_state.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/repository/settings/input_type_repository.dart';
import 'package:word_quiz/ui/quiz/component/input_key.dart';
import 'package:word_quiz/ui/quiz/component/keyboard_map.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

/// キーボードです。
class WordKeyboard extends ConsumerStatefulWidget {
  const WordKeyboard({super.key}); // coverage:ignore-line

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

    // キーボードタイプ取得を待つ
    if (!inputType.hasValue) {
      return const SizedBox.shrink();
    }

    if (inputType.valueOrNull == InputTypes.switching) {
      return Stack(
        children: [
          if (quizPage.normalKeyboard)
            _buildKeyboard(standardKeyboardMap, quizType),
          if (!quizPage.normalKeyboard)
            _buildKeyboard(advancedKeyboardMap, quizType),
        ],
      );
    }

    return Column(
      children: [
        _buildKeyboard(standardKeyboardMap, quizType),
        const SizedBox(height: 12),
        _buildKeyboard(advancedKeyboardMap, quizType),
      ],
    );
  }

  Widget _buildKeyboard(List<String> keyMap, QuizTypes quizType) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < keyMap.length / 5; i++)
          Padding(
            padding: i == 0
                ? EdgeInsets.zero
                : const EdgeInsets.only(left: _keySpace),
            child: _buildKeyColumn(keyMap, i, quizType),
          ),
      ],
    );
  }

  /// キーの1行を構築します。
  Widget _buildKeyColumn(List<String> keyMap, int index, QuizTypes quizType) {
    final resultList =
        ref.watch(wordInputNotifierProvider(quizType)).keyResultList;
    return Column(
      children: [
        for (var i = 0; i < 5; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: _keySpace),
            child: InputKey(
              text: keyMap[index * 5 + i],
              width: _keySize.width,
              height: _keySize.height,
              keyboardInfo: resultList.containsKey(keyMap[index * 5 + i])
                  ? resultList[keyMap[index * 5 + i]] ?? WordKeyboardInfo.none
                  : WordKeyboardInfo.none,
            ),
          ),
      ],
    );
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
