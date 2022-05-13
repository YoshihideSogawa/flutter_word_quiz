import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:word_quiz/provider/parental_control_provider.dart';
import 'package:word_quiz/ui/parental_gate/parental_gate_page.dart';

/// シェアボタンです。
class ShareButton extends ConsumerWidget {
  const ShareButton({
    super.key,
    required this.shareText,
  }); // coverage:ignore-line

  /// テキスト
  final String shareText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      key: const Key('share_button'),
      style: ElevatedButton.styleFrom(
        primary: Colors.grey,
      ),
      onPressed: () {
        // ペアレンタルコントロールがオンの場合
        if (ref.read(parentalControlProvider).isParentalControl()) {
          Navigator.of(context).push<void>(
            MaterialPageRoute(
              builder: (context) => const ParentalGatePage(),
              fullscreenDialog: true,
            ),
          );
        } else {
          Share.share(shareText);
        }
      },
      label: const Text('シェア'),
      icon: const Icon(Icons.share),
    );
  }
}
