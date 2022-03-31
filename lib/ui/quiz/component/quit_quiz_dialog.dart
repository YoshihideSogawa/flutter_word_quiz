import 'package:flutter/material.dart';

/// クイズ終了ダイアログを表示します。
Future<bool> showQuitQuizDialog({
  required BuildContext context,
  required String label,
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      key: const Key('quit_quiz_dialog'),
      content: Text(label),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('いいえ'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('はい'),
        )
      ],
    ),
  );

  return result ?? false;
}
