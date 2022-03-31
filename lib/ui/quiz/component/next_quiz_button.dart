import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

/// 次の問題に行くボタン(いっぱいやるモードのみ)
class NextQuizButton extends ConsumerWidget {
  const NextQuizButton({
    Key? key,
  }) : super(key: key); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizType = QuizType.of(context).quizType;
    return Material(
      child: Ink(
        width: 60,
        height: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.green,
        ),
        child: InkWell(
          key: const Key('next_quiz_button'),
          onTap: () {
            // つぎのクイズを開始
            ref.read(quizInfoProvider(quizType).notifier).nextQuiz();
          },
          borderRadius: BorderRadius.circular(4),
          child: const Center(
            child: Text(
              'つぎへ',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
