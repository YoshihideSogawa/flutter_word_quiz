import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

/// 最初から始めるボタンです。
class RestartButton extends ConsumerWidget {
  const RestartButton({
    super.key,
  }); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizType = QuizType.of(context).quizType;
    final size = MediaQuery.of(context).size;
    return Material(
      child: Ink(
        width: max(60, size.width * 0.1),
        height: max(28, size.height * 0.03),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.green,
        ),
        child: InkWell(
          key: const Key('restart_button_ink_well'),
          onTap: () {
            ref.read(quizPageProvider(quizType).notifier).showQuizSelection();
          },
          borderRadius: BorderRadius.circular(4),
          child: Center(
            child: Text(
              'はじめる',
              style: TextStyle(
                fontSize: max(10.5, size.width * 0.02),
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
