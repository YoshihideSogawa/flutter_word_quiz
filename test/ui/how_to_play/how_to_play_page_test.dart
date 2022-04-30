import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/provider/parental_control_provider.dart';
import 'package:word_quiz/ui/how_to_play/how_to_play_page.dart';

import '../../mock/generate_mocks.mocks.dart';
import '../../mock/url_launcher_tester.dart';

void main() {
  late FakeUrlLauncher urlLauncher;

  setUp(() {
    urlLauncher = setUpUrlLauncher();
  });

  testWidgets('HowToPlayPage', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        overrides: [],
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
    final mockParentalControl = MockParentalControl();
    when(mockParentalControl.isParentalControl()).thenReturn(false);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          parentalControlProvider.overrideWithValue(mockParentalControl),
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
      urlLauncher.launchUrl,
      'https://github.com/YoshihideSogawa/flutter_word_quiz',
    );
  });

  testWidgets('リンクタップ(ペアレンタルコントロール)', (tester) async {
    final mockParentalControl = MockParentalControl();
    when(mockParentalControl.isParentalControl()).thenReturn(true);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          parentalControlProvider.overrideWithValue(mockParentalControl),
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
