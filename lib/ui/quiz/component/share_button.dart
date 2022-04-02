import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:word_quiz/provider/parental_control_provider.dart';

/// シェアボタンです。
class ShareButton extends ConsumerWidget {
  const ShareButton({
    Key? key,
    required this.shareText,
  }) : super(key: key); // coverage:ignore-line

  /// テキスト
  final String shareText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ペアレンタルコントロールがオンなら表示しない
    if (ref.read(parentalControlProvider).isParentalControl()) {
      return const SizedBox.shrink();
    }

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
