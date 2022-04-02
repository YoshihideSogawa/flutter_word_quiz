import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:word_quiz/provider/parental_control_provider.dart';

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
    // ペアレンタルコントロールがオンなら表示しない
    if (ref.read(parentalControlProvider).isParentalControl()) {
      return const SizedBox.shrink();
    }

    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
      ),
      onPressed: () async {
        await launch(_tweetUri(tweetText));
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
