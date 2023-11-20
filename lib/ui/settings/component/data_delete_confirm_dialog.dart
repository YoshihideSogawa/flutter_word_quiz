import 'package:flutter/material.dart';

/// データ削除確認ダイアログです。
Future<bool?> showDataDeleteDialog(
  BuildContext context,
  String contentText,
) async {
  return showDialog<bool?>(
    context: context,
    builder: (context) => AlertDialog(
      content: Text(contentText),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('とじる'),
        ),
        TextButton(
          onPressed: () async => Navigator.pop(context, true),
          child: const Text(
            'データをけす',
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
