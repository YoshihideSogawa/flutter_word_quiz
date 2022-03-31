import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/refresh_quiz_button.dart';

import '../../../mock/fake_quiz_page_notifier.dart';
import '../../../mock/generate_mocks.mocks.dart';

void main() {
  testWidgets('RefreshQuizButton', (tester) async {
    final fakeQuizPageNotifier = FakeQuizPageNotifier(
      const QuizPageInfo(
        showQuizChanged: false,
        showResult: false,
        showQuizSelection: false,
        showAnswer: false,
        showStatistics: false,
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizPageProvider(QuizTypes.daily)
              .overrideWithValue(fakeQuizPageNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: RefreshQuizButton(),
            ),
          ),
        ),
      ),
    );

    expect(find.byType(Icon), findsOneWidget);
  });

  testWidgets('RefreshQuizButtonのタップ', (tester) async {
    final fakeQuizPageNotifier = FakeQuizPageNotifier(
      const QuizPageInfo(
        showQuizChanged: false,
        showResult: false,
        showQuizSelection: false,
        showAnswer: false,
        showStatistics: false,
      ),
    );

    final mockQuizInfoNotifier = MockQuizInfoNotifier();
    when(mockQuizInfoNotifier.refreshDailyQuiz())
        .thenAnswer((_) async => false);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizPageProvider(QuizTypes.daily)
              .overrideWithValue(fakeQuizPageNotifier),
          quizInfoProvider(QuizTypes.daily)
              .overrideWithValue(mockQuizInfoNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: RefreshQuizButton(),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('refresh_button_icon')));
    await tester.pumpAndSettle();

    verify(mockQuizInfoNotifier.refreshDailyQuiz()).called(1);
    await tester.pumpAndSettle();
    expect(find.byType(SnackBar), findsOneWidget);
  });
}
