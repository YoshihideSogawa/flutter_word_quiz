import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/ui/quiz/app_colors.dart';
import 'package:word_quiz/ui/quiz/quiz_page.dart';

import '../../mock/legacy_fake_quiz_info_notifier.dart';
import '../../mock/mock_box_data.dart';

void main() {
  testWidgets('QuizPage', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settingsOverride(inputType: InputTypes.switching),
          quizOverride(quizType: QuizTypes.daily),
          quizOverride(quizType: QuizTypes.endless),
          quizInfoProvider(QuizTypes.daily).overrideWith(
            (ref) =>
                LegacyFakeQuizInfoNotifier(const AsyncValue.data(QuizInfo())),
          ),
          quizInfoProvider(QuizTypes.endless).overrideWith(
            (ref) =>
                LegacyFakeQuizInfoNotifier(const AsyncValue.data(QuizInfo())),
          ),
        ],
        child: const MaterialApp(
          home: QuizPage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('きょうのもんだい'), findsWidgets);
    expect(find.byIcon(Icons.catching_pokemon_outlined), findsOneWidget);
    expect(find.text('いっぱいやる'), findsWidgets);
    expect(find.byIcon(Icons.sentiment_very_satisfied), findsOneWidget);
  });

  testWidgets('いっぱいやるのタップ', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settingsOverride(inputType: InputTypes.switching),
          quizOverride(quizType: QuizTypes.daily),
          quizOverride(quizType: QuizTypes.endless),
          quizInfoProvider(QuizTypes.daily).overrideWith(
            (ref) =>
                LegacyFakeQuizInfoNotifier(const AsyncValue.data(QuizInfo())),
          ),
          quizInfoProvider(QuizTypes.endless).overrideWith(
            (ref) =>
                LegacyFakeQuizInfoNotifier(const AsyncValue.data(QuizInfo())),
          ),
        ],
        child: const MaterialApp(
          home: QuizPage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

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
