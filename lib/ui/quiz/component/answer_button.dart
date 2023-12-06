import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/ui/quiz/app_colors.dart';
import 'package:word_quiz/ui/quiz/component/quiz_control_frame.dart';

/// 答えを確認するボタンです。
class AnswerButton extends ConsumerWidget {
  const AnswerButton({
    super.key,
    required this.quizPageInfo,
  });

  /// [QuizPageInfo]
  final ValueNotifier<QuizPageInfo> quizPageInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return QuizControlFrame(
      child: Tooltip(
        message: 'こたえをみる',
        child: Material(
          child: Ink(
            width: max(48, size.width * 0.1),
            height: max(28, size.height * 0.03),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: unusedKeyColor,
            ),
            child: InkWell(
              key: const Key('answer_button_ink_well'),
              onTap: () {
                quizPageInfo.value = quizPageInfo.value.copyWith(
                  showAnswer: true,
                );
              },
              borderRadius: BorderRadius.circular(4),
              child: Center(
                child: Text(
                  'こたえ',
                  style: TextStyle(
                    fontSize: max(10.5, size.width * 0.02),
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
