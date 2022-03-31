import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

/// 結果表示ボタンです。
class StatisticsButton extends ConsumerWidget {
  const StatisticsButton({
    Key? key,
  }) : super(key: key); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizType = QuizType.of(context).quizType;
    final quizPage = ref.watch(quizPageProvider(quizType));
    return Tooltip(
      message: 'せいかいすう',
      child: IconButton(
        icon: const Icon(Icons.leaderboard_outlined),
        onPressed: !quizPage.showAnswer &&
                !quizPage.showStatistics &&
                !quizPage.showQuizSelection &&
                !quizPage.showResult &&
                !quizPage.showQuizChanged
            ? () {
                ref.read(quizPageProvider(quizType).notifier).showStatistics();
              }
            : null,
      ),
    );
  }
}
