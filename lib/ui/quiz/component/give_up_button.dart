import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/ui/quiz/component/quit_quiz_dialog.dart';
import 'package:word_quiz/ui/quiz/component/quiz_control_frame.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

/// 「いっぱいやる」を終わりにするボタンです。
class GiveUpButton extends ConsumerWidget {
  const GiveUpButton({
    super.key,
    required this.quizPageInfo,
  });

  /// [QuizPageInfo]
  final ValueNotifier<QuizPageInfo> quizPageInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizType = QuizType.of(context).quizType;
    return QuizControlFrame(
      child: Tooltip(
        message: 'クイズを おわりにします',
        child: Material(
          child: Ink(
            width: 60,
            height: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.redAccent,
            ),
            child: InkWell(
              key: const Key('give_up_button_ink_well'),
              borderRadius: BorderRadius.circular(4),
              onTap: () async {
                final result = await showQuitQuizDialog(
                  context: context,
                  label: 'おわりにしますか？',
                );
                if (result) {
                  await ref
                      .read(quizInfoProvider(quizType).notifier)
                      .quitQuiz();
                  quizPageInfo.value = quizPageInfo.value.copyWith(
                    showResult: true,
                  );
                }
              },
              child: const Center(
                child: Text(
                  'おわる',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
