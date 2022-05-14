import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/ui/quiz/component/quit_quiz_dialog.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

/// リタイアボタンです。
class RetireButton extends ConsumerWidget {
  const RetireButton({
    super.key,
  }); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Tooltip(
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
            onTap: () => _handleRetire(context, ref),
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
    );
  }

  /// リタイアダイアログを表示します。
  Future<void> _handleRetire(BuildContext context, WidgetRef ref) async {
    final quizType = QuizType.of(context).quizType;
    // 問題チェック中は何もしない
    if (ref.watch(wordInputNotifierProvider(quizType)).isWordChecking) {
      return;
    }

    final result = await showQuitQuizDialog(
      context: context,
      label: 'あきらめますか？',
    );

    if (result) {
      await ref.read(quizInfoProvider(quizType).notifier).retireQuiz();
    }
  }
}
