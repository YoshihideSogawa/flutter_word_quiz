import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

/// 結果表示ボタンです。
class StatisticsButton extends ConsumerWidget {
  const StatisticsButton({
    super.key,
    required this.quizPageInfo,
  });

  /// [QuizPageInfo]
  final ValueNotifier<QuizPageInfo> quizPageInfo;

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
                quizPageInfo.value = quizPageInfo.value.copyWith(
                  showStatistics: true,
                );
              }
            : null,
      ),
    );
  }
}
