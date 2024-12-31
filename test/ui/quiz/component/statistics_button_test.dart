import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/statistics_button.dart';

void main() {
  testWidgets('StatisticsButton', (tester) async {
    const quizType = QuizTypes.daily;
    final quizPageInfo = ValueNotifier(const QuizPageInfo());
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: StatisticsButton(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.leaderboard_outlined), findsOneWidget);
  });

  testWidgets('StatisticsButton(Tap)', (tester) async {
    const quizType = QuizTypes.daily;
    final quizPageInfo = ValueNotifier(const QuizPageInfo());
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: StatisticsButton(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.leaderboard_outlined));
    expect(quizPageInfo.value.showStatistics, isTrue);
  });
}
