import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/settings_input_type_provider.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/ui/quiz/app_colors.dart';
import 'package:word_quiz/ui/quiz/quiz_page.dart';

import '../../mock/fake_quiz_info_notifier.dart';
import '../../mock/fake_settings_input_type_notifier.dart';
import '../../mock/fake_word_input_notifier.dart';

void main() {
  testWidgets('QuizPage', (tester) async {
    final fakeSettingsInputTypeNotifier =
        FakeSettingsInputTypeNotifier(inputTypeSwitching);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settingsInputTypeProvider
              .overrideWith((ref) => fakeSettingsInputTypeNotifier),
          //daily
          quizInfoProvider(QuizTypes.daily).overrideWith(
            (ref) => FakeQuizInfoNotifier(const AsyncValue.data(QuizInfo())),
          ),
          wordInputNotifierProvider(QuizTypes.daily)
              .overrideWith((ref) => FakeWordInputNotifier(const WordInput())),
          // endless
          quizInfoProvider(QuizTypes.endless).overrideWith(
            (ref) => FakeQuizInfoNotifier(const AsyncValue.data(QuizInfo())),
          ),
          wordInputNotifierProvider(QuizTypes.endless)
              .overrideWith((ref) => FakeWordInputNotifier(const WordInput())),
        ],
        child: const MaterialApp(
          home: QuizPage(),
        ),
      ),
    );

    expect(find.text('きょうのもんだい'), findsWidgets);
    expect(find.byIcon(Icons.catching_pokemon_outlined), findsOneWidget);
    expect(find.text('いっぱいやる'), findsWidgets);
    expect(find.byIcon(Icons.sentiment_very_satisfied), findsOneWidget);
  });

  testWidgets('いっぱいやるのタップ', (tester) async {
    final fakeSettingsInputTypeNotifier =
        FakeSettingsInputTypeNotifier(inputTypeSwitching);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settingsInputTypeProvider
              .overrideWith((ref) => fakeSettingsInputTypeNotifier),
          //daily
          quizInfoProvider(QuizTypes.daily).overrideWith(
            (ref) => FakeQuizInfoNotifier(const AsyncValue.data(QuizInfo())),
          ),
          wordInputNotifierProvider(QuizTypes.daily)
              .overrideWith((ref) => FakeWordInputNotifier(const WordInput())),
          // endless
          quizInfoProvider(QuizTypes.endless).overrideWith(
            (ref) => FakeQuizInfoNotifier(const AsyncValue.data(QuizInfo())),
          ),
          wordInputNotifierProvider(QuizTypes.endless)
              .overrideWith((ref) => FakeWordInputNotifier(const WordInput())),
        ],
        child: const MaterialApp(
          home: QuizPage(),
        ),
      ),
    );

    final navBar =
        tester.widget<BottomNavigationBar>(find.byType(BottomNavigationBar));
    expect(navBar.selectedItemColor, dailyQuizColor);

    // タップ
    await tester.tap(find.byIcon(Icons.sentiment_very_satisfied));
    await tester.pumpAndSettle();

    final navBar2 =
        tester.widget<BottomNavigationBar>(find.byType(BottomNavigationBar));
    expect(navBar2.selectedItemColor, endlessQuizColor);
  });
}
