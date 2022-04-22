import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:word_quiz/provider/parental_control_provider.dart';
import 'package:word_quiz/ui/parental_gate/parental_gate_page.dart';

/// ツイートボタンです。
class TweetButton extends ConsumerWidget {
  const TweetButton({
    Key? key,
    required this.tweetText,
  }) : super(key: key);

  /// ツイートするテキスト
  final String tweetText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
      ),
      onPressed: () async {
        if (ref.read(parentalControlProvider).isParentalControl()) {
          unawaited(
            Navigator.of(context).push<void>(
              MaterialPageRoute(
                builder: (context) => const ParentalGatePage(),
                fullscreenDialog: true,
              ),
            ),
          );
        } else {
          await launch(_tweetUri(tweetText));
        }
      },
      label: const Text('ツイート'),
      icon: const Icon(Icons.send),
    );
  }

  /// Tweet用のテキストに変換します。
  String _tweetUri(String tweetText) {
    return Uri.https(
      'twitter.com',
      'intent/tweet',
      <String, dynamic>{
        'text': tweetText,
      },
    ).toString();
  }
}
