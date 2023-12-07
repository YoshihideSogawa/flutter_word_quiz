import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/ui/quiz/component/quit_quiz_dialog.dart';
import 'package:word_quiz/ui/quiz/component/quiz_control_frame.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

/// リタイアボタンです。
class RetireButton extends ConsumerWidget {
  const RetireButton({
    super.key,
    this.enabled = true,
    required this.quizPageInfo,
  });

  final bool enabled;

  /// [QuizPageInfo]
  final ValueNotifier<QuizPageInfo> quizPageInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return QuizControlFrame(
      child: Tooltip(
        message: 'あきらめて こたえをみる',
        child: Material(
          child: Ink(
            width: max(48, size.width * 0.1),
            height: max(28, size.height * 0.03),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.redAccent,
            ),
            child: InkWell(
              key: const Key('retire_button'),
              onTap: enabled ? () => _handleRetire(context, ref) : null,
              borderRadius: BorderRadius.circular(4),
              child: Center(
                child: Icon(
                  Icons.flag_outlined,
                  color: Colors.white,
                  size: max(20, size.width * 0.03),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// リタイアダイアログを表示します。
  Future<void> _handleRetire(BuildContext context, WidgetRef ref) async {
    final quizType = QuizType.of(context).quizType;
    final result = await showQuitQuizDialog(
      context: context,
      label: 'あきらめますか？',
    );

    if (result) {
      await ref.read(quizInfoProvider(quizType).notifier).retireQuiz();
      // 回答>2秒待ち>結果を表示
      quizPageInfo.value = quizPageInfo.value.copyWith(
        showAnswer: true,
      );
      await Future<void>.delayed(const Duration(milliseconds: 2000));
      // TODO(sogawa): 恒久的にはquizInfoのinvalidateで自動的に表示するようにする
      // TODO(sogawa): 暫定対応としてここで出し分ける
      // 正解のケース
      switch (quizType) {
        case QuizTypes.daily:
          quizPageInfo.value = quizPageInfo.value.copyWith(
            showStatistics: true,
          );
        case QuizTypes.endless:
          quizPageInfo.value = quizPageInfo.value.copyWith(
            showResult: true,
          );
      }
    }
  }
}
