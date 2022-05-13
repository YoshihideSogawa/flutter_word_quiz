import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/word_keyboard_state.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/ui/quiz/app_colors.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

/// 入力テキスト1文字です。
class InputKey extends ConsumerWidget {
  const InputKey({
    super.key,
    required this.width,
    required this.height,
    required this.keyboardState,
    required this.text,
  }); // coverage:ignore-line

  /// 幅
  final double width;

  /// 高さ
  final double height;

  /// キーボードの表示状態
  final WordKeyboardState keyboardState;

  /// 表示テキスト
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (text.isEmpty) {
      return SizedBox(
        key: const Key('empty_input_key'),
        width: width,
        height: height,
      );
    }

    final quizType = QuizType.of(context).quizType;
    return Material(
      child: Ink(
        key: const Key('input_key_color'),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: _boxColor(),
        ),
        child: InkWell(
          key: const Key('input_key_ink_well'),
          onTap: () async {
            // 問題が開始していない場合は無視
            final quizInfo = ref.read(quizInfoProvider(quizType)).value;
            if (quizInfo?.quizProcess != QuizProcessType.started) {
              return;
            }

            ref
                .read(wordInputNotifierProvider(quizType).notifier)
                .inputWord(text);
          },
          borderRadius: BorderRadius.circular(4),
          splashColor: Colors.grey,
          child: Center(
            child: Text(
              text,
              key: const Key('input_character'),
              style: TextStyle(
                color: _textColor(),
                fontWeight: FontWeight.bold,
                fontSize: max(14, width * 0.3),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// テキストの色を取得します。
  Color? _textColor() {
    switch (keyboardState) {
      case WordKeyboardState.none:
        return Colors.black;
      case WordKeyboardState.hit:
        return Colors.white;
      case WordKeyboardState.match:
        return Colors.white;
      case WordKeyboardState.notMatch:
        return Colors.white;
    }
  }

  /// ボックスの色を取得します。
  Color? _boxColor() {
    switch (keyboardState) {
      case WordKeyboardState.none:
        return unusedKeyColor;
      case WordKeyboardState.hit:
        return hitColor;
      case WordKeyboardState.match:
        return matchColor;
      case WordKeyboardState.notMatch:
        return notMatchColor;
    }
  }
}
