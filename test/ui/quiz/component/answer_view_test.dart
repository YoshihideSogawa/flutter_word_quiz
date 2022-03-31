import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/model/monster.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/ui/quiz/component/answer_view.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

import '../../../mock/fake_quiz_info_notifier.dart';
import '../../../mock/generate_mocks.mocks.dart';

void main() {
  testWidgets('AnswerView', (tester) async {
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          answer: Monster(
            id: 1,
            name: 'フシギダネ',
          ),
        ),
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(QuizTypes.daily)
              .overrideWithValue(fakeQuizInfoNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: AnswerView(),
          ),
        ),
      ),
    );

    expect(find.text('フシギダネ'), findsOneWidget);
  });

  testWidgets('AnswerViewを閉じる', (tester) async {
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          answer: Monster(
            id: 1,
            name: 'フシギダネ',
          ),
        ),
      ),
    );

    final mockQuizPageNotifier = MockQuizPageNotifier();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(QuizTypes.daily)
              .overrideWithValue(fakeQuizInfoNotifier),
          quizPageProvider(QuizTypes.daily)
              .overrideWithValue(mockQuizPageNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: AnswerView(),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tapAt(Offset.zero);
    await tester.pumpAndSettle();

    verify(mockQuizPageNotifier.dismissAnswer()).called(1);
  });
}
