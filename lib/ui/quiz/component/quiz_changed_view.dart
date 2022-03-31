import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/ui/quiz/component/quiz_dialog.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

/// 問題が切り替わったことを表す画面です。
class QuizChangedView extends ConsumerWidget {
  const QuizChangedView({
    Key? key,
  }) : super(key: key); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizType = QuizType.of(context).quizType;
    return QuizDialog(
      onTap: () {
        ref.read(quizPageProvider(quizType).notifier).dismissQuizChanged();
      },
      child: IntrinsicHeight(
        child: Container(
          width: 300,
          decoration: BoxDecoration(
            color: Theme.of(context).dialogBackgroundColor,
            borderRadius: BorderRadius.circular(4),
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(10, 10),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                const SizedBox(height: 18),
                const Text('もんだいが こうしんされました'),
                const SizedBox(height: 18),
                TextButton(
                  onPressed: () {
                    ref
                        .read(quizPageProvider(quizType).notifier)
                        .dismissQuizChanged();
                  },
                  child: const Text('とじる'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
