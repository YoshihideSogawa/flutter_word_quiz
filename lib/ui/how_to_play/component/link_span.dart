import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:word_quiz/routing/routes.dart';

/// リンク表示を構築します。
TextSpan buildLinkSpan(
  BuildContext context, {
  required String text,
  required String link,
  required bool? isParentalControl,
}) {
  return TextSpan(
    text: text,
    style: const TextStyle(
      color: Colors.blue,
      decoration: TextDecoration.underline,
    ),
    recognizer: TapGestureRecognizer()
      ..onTap = () {
        // ペアレンタルコントロール状態が不明（読み込み中/エラー）なら何もしない
        if (isParentalControl == null) {
          return;
        }

        // ペアレンタルコントロールがオンならペアレンタルゲートに遷移
        if (isParentalControl) {
          context.push(Routes.parentalGate);
        } else {
          // ペアレンタルコントロールがオフならURLに遷移
          launchUrl(Uri.parse(link));
        }
      },
  );
}
