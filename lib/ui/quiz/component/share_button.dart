import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

/// シェアボタンです。
class ShareButton extends StatelessWidget {
  const ShareButton({
    Key? key,
    required this.shareText,
  }) : super(key: key); // coverage:ignore-line

  /// テキスト
  final String shareText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      key: const Key('share_button'),
      style: ElevatedButton.styleFrom(
        primary: Colors.grey,
      ),
      onPressed: () {
        Share.share(shareText);
      },
      label: const Text('シェア'),
      icon: const Icon(Icons.share),
    );
  }
}
