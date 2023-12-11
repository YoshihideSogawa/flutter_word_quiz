import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_info_notifier.dart';
import 'package:word_quiz/provider/word_input_notifier.dart';
import 'package:word_quiz/ui/quiz/app_colors.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

/// 入力確定ボタンです。
class EnterButton extends ConsumerWidget {
  const EnterButton({
    super.key,
    required this.enabled,
    required this.quizPageInfo,
  });

  /// 有効かどうか
  final bool enabled;

  /// [QuizPageInfo]
  final ValueNotifier<QuizPageInfo> quizPageInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizType = QuizType.of(context).quizType;
    final size = MediaQuery.of(context).size;
    final wordInputNotifier = ref.watch(wordInputNotifierProvider(quizType));
    final quizInfo = ref.watch(quizInfoNotifierProvider(quizType));
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
            onTap: wordInputNotifier.hasValue && quizInfo.hasValue && enabled
                ? () async => _onTapEnter(context, ref, quizType)
                : null,
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
    final quizInfo = ref.read(quizInfoNotifierProvider(quizType)).value;
    if (quizInfo?.quizProcess != QuizProcessType.started) {
      return;
    }

    final result =
        await ref.read(wordInputNotifierProvider(quizType).notifier).submit();

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
      final result = await ref
          .read(quizInfoNotifierProvider(quizType).notifier)
          .updateQuiz();
      if (result == null) {
        return;
      }

      // 失敗時：回答>2秒待ち>結果を表示
      if (!result) {
        quizPageInfo.value = quizPageInfo.value.copyWith(
          showAnswer: true,
        );
        await Future<void>.delayed(const Duration(milliseconds: 2000));
      }

      // TODO(sogawa): 恒久的にはquizInfoの更新が終わってから表示するようにする
      // TODO(sogawa): 暫定対応としてここで成功・失敗で出し分ける
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
