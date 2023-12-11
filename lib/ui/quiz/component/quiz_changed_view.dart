import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/provider/quiz_info_notifier.dart';
import 'package:word_quiz/ui/quiz/component/quiz_dialog.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

/// 問題が切り替わったことを表す画面です。
class QuizChangedView extends ConsumerWidget {
  const QuizChangedView({
    super.key,
    required this.quizPageInfo,
  });

  /// [QuizPageInfo]
  final ValueNotifier<QuizPageInfo> quizPageInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizType = QuizType.of(context).quizType;
    return QuizDialog(
      onTap: () {
        quizPageInfo.value = quizPageInfo.value.copyWith(
          showQuizChanged: false,
        );
      },
      child: IntrinsicHeight(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
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
                  onPressed: () async {
                    await ref
                        .read(quizInfoNotifierProvider(quizType).notifier)
                        .refreshDailyQuiz();
                    quizPageInfo.value = quizPageInfo.value.copyWith(
                      showQuizChanged: false,
                    );
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
