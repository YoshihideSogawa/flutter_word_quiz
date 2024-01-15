import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/word_keyboard_state.dart';
import 'package:word_quiz/provider/quiz_info_notifier.dart';
import 'package:word_quiz/provider/word_input_notifier.dart';
import 'package:word_quiz/ui/quiz/app_colors.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

/// 入力テキスト1文字です。
class InputKey extends ConsumerWidget {
  const InputKey({
    super.key,
    required this.width,
    required this.height,
    required this.keyboardInfo,
    required this.enabled,
    required this.text,
  }); // coverage:ignore-line

  /// 幅
  final double width;

  /// 高さ
  final double height;

  /// キーボードの表示状態
  final WordKeyboardInfo keyboardInfo;

  /// 有効かどうか
  final bool enabled;

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
          onTap: enabled
              ? () async {
                  // 問題が開始していない場合は無視
                  final quizInfo =
                      await ref.read(quizInfoNotifierProvider(quizType).future);
                  if (quizInfo.quizProcess != QuizProcessType.started) {
                    return;
                  }

                  await ref
                      .read(wordInputNotifierProvider(quizType).notifier)
                      .inputWord(text);
                }
              : null,
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
    switch (keyboardInfo) {
      case WordKeyboardInfo.none:
        return Colors.black;
      case WordKeyboardInfo.hit:
        return Colors.white;
      case WordKeyboardInfo.match:
        return Colors.white;
      case WordKeyboardInfo.notMatch:
        return Colors.white;
    }
  }

  /// ボックスの色を取得します。
  Color? _boxColor() {
    switch (keyboardInfo) {
      case WordKeyboardInfo.none:
        return unusedKeyColor;
      case WordKeyboardInfo.hit:
        return hitColor;
      case WordKeyboardInfo.match:
        return matchColor;
      case WordKeyboardInfo.notMatch:
        return notMatchColor;
    }
  }
}
