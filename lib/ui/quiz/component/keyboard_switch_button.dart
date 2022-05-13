import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/ui/quiz/app_colors.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

/// キーボードの切り替えボタンです。
class KeyboardSwitchButton extends ConsumerWidget {
  const KeyboardSwitchButton({
    super.key,
  }); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizType = QuizType.of(context).quizType;
    final quizPage = ref.watch(quizPageProvider(quizType));
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        _buildSwitchButton(
          label: 'アイウ',
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(4),
            topLeft: Radius.circular(4),
          ),
          selected: quizPage.normalKeyboard,
          onTap: () {
            ref.read(quizPageProvider(quizType).notifier).updateKeyboard(
                  isNormalKeyboard: true,
                );
          },
          size: size,
        ),
        _buildSwitchButton(
          label: '゛゜ァ',
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
          selected: !quizPage.normalKeyboard,
          onTap: () {
            ref.read(quizPageProvider(quizType).notifier).updateKeyboard(
                  isNormalKeyboard: false,
                );
          },
          size: size,
        ),
      ],
    );
  }

  /// 切り替えボタンを構築します。
  Widget _buildSwitchButton({
    required String label,
    required BorderRadius borderRadius,
    required bool selected,
    required void Function() onTap,
    required Size size,
  }) {
    return Material(
      child: Ink(
        key: Key('switch_button_ink_$label'),
        width: max(48, size.width * 0.1),
        height: max(28, size.height * 0.03),
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: selected ? selectedKeyColor : unusedKeyColor,
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: max(12, size.width * 0.02),
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
