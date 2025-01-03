import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:word_quiz/repository/app_property/parental_control_repository.dart';
import 'package:word_quiz/routing/routes.dart';

/// ツイートボタンです。
class TweetButton extends ConsumerWidget {
  const TweetButton({
    super.key,
    required this.tweetText,
  });

  /// ツイートするテキスト
  final String tweetText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isParentalControl =
        ref.watch(parentalControlRepositoryProvider).valueOrNull;
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
      ),
      onPressed: () async {
        if (isParentalControl == null) {
          return;
        }

        if (isParentalControl) {
          unawaited(context.push(Routes.parentalGate));
        } else {
          await launchUrl(_tweetUri(tweetText));
        }
      },
      label: const Text('ツイート'),
      icon: const Icon(Icons.send),
    );
  }

  /// Tweet用のテキストに変換します。
  Uri _tweetUri(String tweetText) {
    return Uri.https(
      'twitter.com',
      'intent/tweet',
      <String, dynamic>{
        'text': tweetText,
      },
    );
  }
}
