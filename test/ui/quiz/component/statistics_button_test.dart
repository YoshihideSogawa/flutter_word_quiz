import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/statistics_button.dart';

import '../../../mock/fake_quiz_page_notifier.dart';

void main() {
  testWidgets('StatisticsButton', (tester) async {
    const quizType = QuizTypes.daily;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizPageProvider(quizType).overrideWithValue(
            FakeQuizPageNotifier(
              const QuizPageInfo(
                showStatistics: false,
                showQuizSelection: false,
                showResult: false,
                showQuizChanged: false,
              ),
            ),
          ),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: StatisticsButton(),
            ),
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.leaderboard_outlined), findsOneWidget);
  });

  testWidgets('StatisticsButton(Tap)', (tester) async {
    const quizType = QuizTypes.daily;
    final fakeQuizPageNotifier = FakeQuizPageNotifier(
      const QuizPageInfo(
        showStatistics: false,
        showQuizSelection: false,
        showResult: false,
        showQuizChanged: false,
      ),
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizPageProvider(quizType).overrideWithValue(fakeQuizPageNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: StatisticsButton(),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.leaderboard_outlined));
    expect(fakeQuizPageNotifier.showStatisticsCalled, isTrue);
  });
}
