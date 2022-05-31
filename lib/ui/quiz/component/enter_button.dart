import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/ui/quiz/app_colors.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

/// 入力確定ボタンです。
class EnterButton extends ConsumerWidget {
  const EnterButton({
    super.key,
  }); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizType = QuizType.of(context).quizType;
    final size = MediaQuery.of(context).size;
    return Material(
      child: IntrinsicWidth(
        child: Ink(
          // width: max(48, size.width * 0.1),
          height: max(28, size.height * 0.04),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: unusedKeyColor,
          ),
          child: InkWell(
            key: const Key('enter_button_ink_well'),
            onTap: () async => _onTapEnter(context, ref, quizType),
            borderRadius: BorderRadius.circular(4),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'かくてい',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: max(10.5, size.width * 0.02),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Enterをタップした時の処理を行います。
  Future<void> _onTapEnter(
    BuildContext context,
    WidgetRef ref,
    QuizTypes quizType,
  ) async {
    final state = ScaffoldMessenger.of(context);
    // 問題が開始していない場合は無視
    final quizInfo = ref.read(quizInfoProvider(quizType)).value;
    if (quizInfo?.quizProcess != QuizProcessType.started) {
      return;
    }

    final result =
        await ref.watch(wordInputNotifierProvider(quizType).notifier).submit();

    if (result == SubmitResult.noInput) {
      _showSnackBar(state, 'ポケモンの なまえをいれてね');
    } else if (result == SubmitResult.unknownMonster) {
      _showSnackBar(state, 'そのポケモンはいません');
    } else if (result == SubmitResult.success) {
      if (!state.mounted) {
        return;
      }

      state.hideCurrentSnackBar();
      // QuizInfoの更新
      await ref.watch(quizInfoProvider(quizType).notifier).updateQuiz();
    }
  }

  /// SnackBarを表示します。
  void _showSnackBar(ScaffoldMessengerState state, String text) {
    if (!state.mounted) {
      return;
    }

    state
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          key: const Key('snack_bar'),
          content: Text(text),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {},
          ),
        ),
      );
  }
}
