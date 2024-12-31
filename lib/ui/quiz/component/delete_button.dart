import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/provider/word_input_notifier.dart';
import 'package:word_quiz/ui/quiz/app_colors.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

/// 削除ボタンです。
class DeleteButton extends ConsumerWidget {
  const DeleteButton({
    super.key,
    required this.enabled,
  });

  /// 有効かどうか
  final bool enabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizType = QuizType.of(context).quizType;
    final size = MediaQuery.of(context).size;
    return Material(
      child: Ink(
        width: max(48, size.width * 0.1),
        height: max(28, size.height * 0.03),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: unusedKeyColor,
        ),
        child: InkWell(
          key: const Key('delete_button_ink_well'),
          onTap: enabled
              ? () {
                  ref
                      .read(wordInputNotifierProvider(quizType).notifier)
                      .deleteWord();
                }
              : null,
          borderRadius: BorderRadius.circular(4),
          child: Icon(
            Icons.backspace_outlined,
            size: max(20, size.width * 0.03),
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
