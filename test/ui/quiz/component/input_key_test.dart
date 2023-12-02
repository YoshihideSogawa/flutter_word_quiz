import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/word_keyboard_state.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/ui/quiz/app_colors.dart';
import 'package:word_quiz/ui/quiz/component/input_key.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

import '../../../mock/fake_quiz_info_notifier.dart';
import '../../../mock/mock_box_data.dart';

void main() {
  testWidgets('InputKey(empty)', (tester) async {
    const quizType = QuizTypes.daily;
    const quizInfo = QuizInfo(
      quizProcess: QuizProcessType.started,
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(
            quizType: quizType,
            quizInfo: quizInfo,
          ),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: InputKey(
                width: 100,
                height: 100,
                keyboardInfo: WordKeyboardInfo.none,
                text: '',
                enabled: true,
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('empty_input_key')), findsOneWidget);
  });

  testWidgets('InputKey(none)', (tester) async {
    const quizType = QuizTypes.daily;
    const quizInfo = QuizInfo(
      quizProcess: QuizProcessType.started,
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(
            quizType: quizType,
            quizInfo: quizInfo,
          ),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: InputKey(
                width: 100,
                height: 100,
                keyboardInfo: WordKeyboardInfo.none,
                text: 'ア',
                enabled: true,
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

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
    const quizType = QuizTypes.daily;
    const quizInfo = QuizInfo(
      quizProcess: QuizProcessType.started,
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(
            quizType: quizType,
            quizInfo: quizInfo,
          ),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: InputKey(
                width: 100,
                height: 100,
                keyboardInfo: WordKeyboardInfo.hit,
                text: 'ア',
                enabled: true,
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

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
    const quizType = QuizTypes.daily;
    const quizInfo = QuizInfo(
      quizProcess: QuizProcessType.started,
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(
            quizType: quizType,
            quizInfo: quizInfo,
          ),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: InputKey(
                width: 100,
                height: 100,
                keyboardInfo: WordKeyboardInfo.match,
                text: 'ア',
                enabled: true,
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

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
    const quizType = QuizTypes.daily;
    const quizInfo = QuizInfo(
      quizProcess: QuizProcessType.started,
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(
            quizType: quizType,
            quizInfo: quizInfo,
          ),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: InputKey(
                width: 100,
                height: 100,
                keyboardInfo: WordKeyboardInfo.notMatch,
                text: 'ア',
                enabled: true,
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

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
    const quizType = QuizTypes.daily;
    const quizInfo = QuizInfo(
      quizProcess: QuizProcessType.started,
    );
    final quizOverrideBox = quizOverrideAndBox(
      quizType: quizType,
      quizInfo: quizInfo,
    );
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(quizInfo),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverrideBox.override,
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: InputKey(
                width: 100,
                height: 100,
                keyboardInfo: WordKeyboardInfo.match,
                text: 'ア',
                enabled: true,
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('input_key_ink_well')));
    await tester.pumpAndSettle();

    final wordInputData = parseWordInput(quizOverrideBox.box);
    expect(wordInputData?.wordsList.first, ['ア']);
  });
}
