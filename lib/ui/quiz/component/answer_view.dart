import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/ui/quiz/component/quiz_dialog.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

/// 答えの表示です。
class AnswerView extends ConsumerWidget {
  const AnswerView({
    Key? key,
  }) : super(key: key); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizType = QuizType.of(context).quizType;
    return QuizDialog(
      onTap: () {
        ref.read(quizPageProvider(quizType).notifier).dismissAnswer();
      },
      child: Container(
        width: 160,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.black,
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
        child: Center(
          child: Text(
            ref.read(quizInfoProvider(quizType)).value?.answer?.name ?? '',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
