import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/provider/quiz_info_notifier.dart';
import 'package:word_quiz/ui/quiz/component/quiz_dialog.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

/// 答えの表示です。
class AnswerView extends ConsumerWidget {
  const AnswerView({
    super.key,
    required this.quizPageInfo,
  });

  /// [QuizPageInfo]
  final ValueNotifier<QuizPageInfo> quizPageInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizType = QuizType.of(context).quizType;
    final quizInfoNotifier = ref.watch(quizInfoNotifierProvider(quizType));
    return QuizDialog(
      onTap: () {
        quizPageInfo.value = quizPageInfo.value.copyWith(
          showAnswer: false,
        );
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
            quizInfoNotifier.valueOrNull?.answer?.name ?? '',
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
