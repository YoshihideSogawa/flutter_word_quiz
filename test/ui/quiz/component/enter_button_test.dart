import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/logic/date_utils.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/ui/quiz/component/enter_button.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

import '../../../mock/fake_quiz_info_notifier.dart';
import '../../../mock/generate_mocks.mocks.dart';
import '../../../mock/mock_box_data.dart';

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
    const quizType = QuizTypes.daily;
    final quizInfo = QuizInfo(
      quizProcess: QuizProcessType.started,
      playDate: generateDate(),
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進める
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      AsyncValue.data(quizInfo),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(quizType: quizType, quizInfo: quizInfo),
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: QuizType(
              quizType: quizType,
              child: EnterButton(),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('enter_button_ink_well')));
    await tester.pumpAndSettle();

    expect(find.text('ポケモンの なまえをいれてね'), findsOneWidget);
  });

  testWidgets('EnterButtonのタップ(不明なモンスター)', (tester) async {
    const quizType = QuizTypes.daily;
    final quizInfo = QuizInfo(
      quizProcess: QuizProcessType.started,
      playDate: generateDate(),
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進める
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      AsyncValue.data(quizInfo),
    );

    final mockWordInputNotifier = MockWordInputNotifier();
    when(mockWordInputNotifier.submit())
        .thenAnswer((_) async => SubmitResult.unknownMonster);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(
            quizType: quizType,
            quizInfo: quizInfo,
          ),
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          wordInputNotifierProvider(quizType)
              .overrideWith((ref) => mockWordInputNotifier),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: QuizType(
              quizType: quizType,
              child: EnterButton(),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('enter_button_ink_well')));
    await tester.pumpAndSettle();

    expect(find.text('そのポケモンはいません'), findsOneWidget);

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('snack_bar')), findsNothing);
  });

  testWidgets('EnterButtonのタップ(成功)', (tester) async {
    const quizType = QuizTypes.daily;
    final quizInfo = QuizInfo(
      quizProcess: QuizProcessType.started,
      playDate: generateDate(),
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進める
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      AsyncValue.data(quizInfo),
    );

    final mockWordInputNotifier = MockWordInputNotifier();
    when(mockWordInputNotifier.submit())
        .thenAnswer((_) async => SubmitResult.success);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(quizType: quizType, quizInfo: quizInfo),
          wordInputNotifierProvider(quizType)
              .overrideWith((ref) => mockWordInputNotifier),
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: EnterButton(),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('enter_button_ink_well')));
    await tester.pumpAndSettle();

    expect(fakeQuizInfoNotifier.updateQuizCalled, isTrue);
  });
}
