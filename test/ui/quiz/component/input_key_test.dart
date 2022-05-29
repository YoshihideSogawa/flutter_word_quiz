import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/word_keyboard_state.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/ui/quiz/app_colors.dart';
import 'package:word_quiz/ui/quiz/component/input_key.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

import '../../../mock/fake_quiz_info_notifier.dart';
import '../../../mock/generate_mocks.mocks.dart';

void main() {
  testWidgets('InputKey(empty)', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: InputKey(
                width: 100,
                height: 100,
                keyboardState: WordKeyboardInfo.none,
                text: '',
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.byKey(const Key('empty_input_key')), findsOneWidget);
  });

  testWidgets('InputKey(none)', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: InputKey(
                width: 100,
                height: 100,
                keyboardState: WordKeyboardInfo.none,
                text: 'ア',
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text('ア'), findsOneWidget);

    // 判定色
    final ink = tester.widget<Ink>(find.byKey(const Key('input_key_color')));
    final inkColor = (ink.decoration as BoxDecoration?)?.color;
    expect(inkColor, unusedKeyColor);

    // 文字色
    final text = tester.widget<Text>(find.byKey(const Key('input_character')));
    final textColor = text.style?.color;
    expect(textColor, Colors.black);

    expect(find.byKey(const Key('input_key_color')), findsOneWidget);
  });

  testWidgets('InputKey(hit)', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: InputKey(
                width: 100,
                height: 100,
                keyboardState: WordKeyboardInfo.hit,
                text: 'ア',
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text('ア'), findsOneWidget);

    // 判定色
    final ink = tester.widget<Ink>(find.byKey(const Key('input_key_color')));
    final inkColor = (ink.decoration as BoxDecoration?)?.color;
    expect(inkColor, hitColor);

    // 文字色
    final text = tester.widget<Text>(find.byKey(const Key('input_character')));
    final textColor = text.style?.color;
    expect(textColor, Colors.white);
  });

  testWidgets('InputKey(match)', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: InputKey(
                width: 100,
                height: 100,
                keyboardState: WordKeyboardInfo.match,
                text: 'ア',
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text('ア'), findsOneWidget);

    // 判定色
    final ink = tester.widget<Ink>(find.byKey(const Key('input_key_color')));
    final inkColor = (ink.decoration as BoxDecoration?)?.color;
    expect(inkColor, matchColor);

    // 文字色
    final text = tester.widget<Text>(find.byKey(const Key('input_character')));
    final textColor = text.style?.color;
    expect(textColor, Colors.white);
  });

  testWidgets('InputKey(notMatch)', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: InputKey(
                width: 100,
                height: 100,
                keyboardState: WordKeyboardInfo.notMatch,
                text: 'ア',
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text('ア'), findsOneWidget);

    // 判定色
    final ink = tester.widget<Ink>(find.byKey(const Key('input_key_color')));
    final inkColor = (ink.decoration as BoxDecoration?)?.color;
    expect(inkColor, notMatchColor);

    // 文字色
    final text = tester.widget<Text>(find.byKey(const Key('input_character')));
    final textColor = text.style?.color;
    expect(textColor, Colors.white);
  });

  testWidgets('InputKeyのタップ', (tester) async {
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          quizProcess: QuizProcessType.started,
        ),
      ),
    );

    final mockWordInputNotifier = MockWordInputNotifier();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(QuizTypes.daily)
              .overrideWithValue(fakeQuizInfoNotifier),
          wordInputNotifierProvider(QuizTypes.daily)
              .overrideWithValue(mockWordInputNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: InputKey(
                width: 100,
                height: 100,
                keyboardState: WordKeyboardInfo.match,
                text: 'ア',
              ),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('input_key_ink_well')));

    verify(mockWordInputNotifier.inputWord(any)).called(1);
  });
}
