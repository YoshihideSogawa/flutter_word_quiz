import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/repository/app_property/is_parental_control.dart';
import 'package:word_quiz/ui/how_to_play/how_to_play_page.dart';

import '../../mock/url_launcher_tester.dart';

void main() {
  late FakeUrlLauncher urlLauncher;

  setUp(() {
    urlLauncher = setUpUrlLauncher();
  });

  testWidgets('HowToPlayPage', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: HowToPlayPage(),
          ),
        ),
      ),
    );

    expect(find.text('あそびかた'), findsOneWidget);
  });

  testWidgets('リンクタップ', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          isParentalControlProvider.overrideWith((ref) => false),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: HowToPlayPage(),
          ),
        ),
      ),
    );

    await tester.ensureVisible(find.byKey(const Key('for_developer')));
    final textRich =
        tester.widget<Text>(find.byKey(const Key('for_developer')));
    textRich.textSpan?.visitChildren(
      (visitor) {
        if (visitor is TextSpan && visitor.text == 'オープンソース') {
          (visitor.recognizer as TapGestureRecognizer?)?.onTap!();
          return false;
        }

        return true;
      },
    );

    await tester.pumpAndSettle();

    expect(urlLauncher.launchCalled, isTrue);
    expect(
      urlLauncher.launchedUrl,
      'https://github.com/YoshihideSogawa/flutter_word_quiz',
    );
  });

  testWidgets('リンクタップ(ペアレンタルコントロール)', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          isParentalControlProvider.overrideWith((ref) => true),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: HowToPlayPage(),
          ),
        ),
      ),
    );

    await tester.ensureVisible(find.byKey(const Key('for_developer')));
    final textRich =
        tester.widget<Text>(find.byKey(const Key('for_developer')));
    textRich.textSpan?.visitChildren(
      (visitor) {
        if (visitor is TextSpan && visitor.text == 'オープンソース') {
          (visitor.recognizer as TapGestureRecognizer?)?.onTap!();
          return false;
        }

        return true;
      },
    );

    await tester.pumpAndSettle();

    expect(urlLauncher.launchCalled, isFalse);
  });
}
