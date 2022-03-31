import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/repository/quiz_repository.dart';
import 'package:word_quiz/ui/quiz/component/enter_button.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

import '../../../mock/fake_quiz_info_notifier.dart';
import '../../../mock/generate_mocks.mocks.dart';

void main() {
  testWidgets('EnterButton', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: EnterButton(),
          ),
        ),
      ),
    );

    expect(find.text('かくてい'), findsOneWidget);
  });

  testWidgets('EnterButtonのタップ(入力なし)', (tester) async {
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          quizProcess: QuizProcessType.started,
        ),
      ),
    );

    final mockWordInputNotifier = MockWordInputNotifier();
    when(mockWordInputNotifier.submit())
        .thenAnswer((_) async => SubmitResult.noInput);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(QuizTypes.daily)
              .overrideWithValue(fakeQuizInfoNotifier),
          quizRepositoryProvider(QuizTypes.daily)
              .overrideWithValue(MockQuizRepository()),
          wordInputNotifierProvider(QuizTypes.daily)
              .overrideWithValue(mockWordInputNotifier)
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: QuizType(
              quizType: QuizTypes.daily,
              child: EnterButton(),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('enter_button_ink_well')));
    await tester.pumpAndSettle();

    expect(find.text('ポケモンの なまえをいれてね'), findsOneWidget);
  });

  testWidgets('EnterButtonのタップ(不明なモンスター)', (tester) async {
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          quizProcess: QuizProcessType.started,
        ),
      ),
    );

    final mockWordInputNotifier = MockWordInputNotifier();
    when(mockWordInputNotifier.submit())
        .thenAnswer((_) async => SubmitResult.unknownMonster);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(QuizTypes.daily)
              .overrideWithValue(fakeQuizInfoNotifier),
          quizRepositoryProvider(QuizTypes.daily)
              .overrideWithValue(MockQuizRepository()),
          wordInputNotifierProvider(QuizTypes.daily)
              .overrideWithValue(mockWordInputNotifier)
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: QuizType(
              quizType: QuizTypes.daily,
              child: EnterButton(),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('enter_button_ink_well')));
    await tester.pumpAndSettle();

    expect(find.text('そのポケモンはいません'), findsOneWidget);

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('snack_bar')), findsNothing);
  });

  testWidgets('EnterButtonのタップ(成功)', (tester) async {
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          quizProcess: QuizProcessType.started,
        ),
      ),
    );

    final mockWordInputNotifier = MockWordInputNotifier();
    when(mockWordInputNotifier.submit())
        .thenAnswer((_) async => SubmitResult.success);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(QuizTypes.daily)
              .overrideWithValue(fakeQuizInfoNotifier),
          quizRepositoryProvider(QuizTypes.daily)
              .overrideWithValue(MockQuizRepository()),
          wordInputNotifierProvider(QuizTypes.daily)
              .overrideWithValue(mockWordInputNotifier)
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: EnterButton(),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('enter_button_ink_well')));
    await tester.pumpAndSettle();

    expect(fakeQuizInfoNotifier.updateQuizCalled, isTrue);
  });
}
