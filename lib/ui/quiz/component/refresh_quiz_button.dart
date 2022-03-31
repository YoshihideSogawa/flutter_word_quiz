import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

/// 問題を更新するボタンです。
class RefreshQuizButton extends ConsumerWidget {
  const RefreshQuizButton({
    Key? key,
  }) : super(key: key); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizType = QuizType.of(context).quizType;
    final quizPage = ref.watch(quizPageProvider(quizType));
    return Tooltip(
      message: 'きょうのもんだいを こうしんします',
      child: IconButton(
        key: const Key('refresh_button_icon'),
        icon: const Icon(Icons.refresh),
        onPressed: !quizPage.showAnswer &&
                !quizPage.showStatistics &&
                !quizPage.showQuizSelection &&
                !quizPage.showResult &&
                !quizPage.showQuizChanged
            ? () async => _onTapRefreshQuiz(
                  context,
                  ref,
                  quizType,
                )
            : null,
      ),
    );
  }

  /// 問題を更新をタップした時の処理です。
  Future<void> _onTapRefreshQuiz(
    BuildContext context,
    WidgetRef ref,
    QuizTypes quizType,
  ) async {
    final result =
        await ref.read(quizInfoProvider(quizType).notifier).refreshDailyQuiz();

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    if (!result) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('こうしんは ありません'),
        ),
      );
    }
  }
}
