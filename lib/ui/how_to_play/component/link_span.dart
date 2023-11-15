import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:word_quiz/ui/parental_gate/parental_gate_page.dart';

/// リンク表示を構築します。
TextSpan buildLinkSpan(
  BuildContext context, {
  required String text,
  required String link,
  required bool isParentalControl,
}) {
  return TextSpan(
    text: text,
    style: const TextStyle(
      color: Colors.blue,
      decoration: TextDecoration.underline,
    ),
    recognizer: TapGestureRecognizer()
      ..onTap = () {
        if (isParentalControl) {
          // ペアレンタルコントロールがオンならペアレンタルゲートに遷移
          Navigator.of(context).push<void>(
            MaterialPageRoute(
              builder: (context) => const ParentalGatePage(),
              fullscreenDialog: true,
            ),
          );
        } else {
          // ペアレンタルコントロールがオフならURLに遷移
          launchUrl(Uri.parse(link));
        }
      },
  );
}
