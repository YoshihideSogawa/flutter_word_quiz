import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/ui/quiz/app_colors.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

/// 答えを確認するボタンです。
class AnswerButton extends ConsumerWidget {
  const AnswerButton({
    Key? key,
  }) : super(key: key); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizType = QuizType.of(context).quizType;
    final size = MediaQuery.of(context).size;
    return Tooltip(
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
              ref.read(quizPageProvider(quizType).notifier).showAnswer();
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
    );
  }
}
