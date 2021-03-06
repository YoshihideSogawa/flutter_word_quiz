import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/monster_series.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/provider/settings_input_type_provider.dart';
import 'package:word_quiz/provider/settings_quiz_range_provider.dart';
import 'package:word_quiz/ui/how_to_play/how_to_play_page.dart';
import 'package:word_quiz/ui/quiz/component/quiz_drawer.dart';
import 'package:word_quiz/ui/settings/settings_page.dart';

import '../../../mock/fake_settings_input_type_notifier.dart';
import '../../../mock/fake_settings_quiz_range_notifier.dart';

void main() {
  testWidgets('QuizDrawer', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: QuizDrawer(),
        ),
      ),
    );

    expect(find.text('ワードクイズ'), findsOneWidget);
    expect(find.text('あそびかた'), findsOneWidget);
    expect(find.text('せってい'), findsOneWidget);
    expect(find.text('このアプリについて'), findsOneWidget);
  });

  testWidgets('あそびかたのタップ', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: QuizDrawer(),
        ),
      ),
    );

    await tester.tap(find.text('あそびかた'));
    await tester.pumpAndSettle();
    expect(find.byType(HowToPlayPage), findsOneWidget);
  });

  testWidgets('せっていのタップ', (tester) async {
    final fakeSettingsInputTypeNotifier =
        FakeSettingsInputTypeNotifier(inputTypeSwitching);

    final fakeSettingsQuizRangeNotifier =
        FakeSettingsQuizRangeNotifier(diamondPearl);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settingsInputTypeProvider
              .overrideWithValue(fakeSettingsInputTypeNotifier),
          settingsQuizRangeProvider
              .overrideWithValue(fakeSettingsQuizRangeNotifier),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: QuizDrawer(),
          ),
        ),
      ),
    );

    await tester.tap(find.text('せってい'));
    await tester.pumpAndSettle();
    expect(find.byType(SettingsPage), findsOneWidget);
  });

  testWidgets('このアプリについてのタップ', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: QuizDrawer(),
        ),
      ),
    );

    await tester.tap(find.text('このアプリについて'));
    await tester.pumpAndSettle();
    expect(find.byType(AboutDialog), findsOneWidget);
  });
}
