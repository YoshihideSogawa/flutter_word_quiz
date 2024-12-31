import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:word_quiz/repository/app_property/parental_control_repository.dart';
import 'package:word_quiz/routing/routes.dart';

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
    final isParentalControl =
        ref.watch(parentalControlRepositoryProvider).valueOrNull;

    return ElevatedButton.icon(
      key: const Key('share_button'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
      ),
      onPressed: () {
        if (isParentalControl == null) {
          return;
        }

        // ペアレンタルコントロールがオンの場合
        if (isParentalControl) {
          context.push(Routes.parentalGate);
        } else {
          Share.share(shareText);
        }
      },
      label: const Text('シェア'),
      icon: const Icon(Icons.share),
    );
  }
}
