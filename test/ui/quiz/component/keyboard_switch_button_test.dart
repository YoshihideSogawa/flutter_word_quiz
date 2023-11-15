import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/ui/quiz/app_colors.dart';
import 'package:word_quiz/ui/quiz/component/keyboard_switch_button.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

import '../../../mock/fake_quiz_page_notifier.dart';

void main() {
  testWidgets('KeyboardSwitchButton(normalKeyboard)', (tester) async {
    final fakeQuizPageNotifier = FakeQuizPageNotifier(
      const QuizPageInfo(
        normalKeyboard: true,
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizPageProvider(QuizTypes.daily)
              .overrideWith((ref) => fakeQuizPageNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: KeyboardSwitchButton(),
            ),
          ),
        ),
      ),
    );

    final standardKeyInk =
        tester.widget<Ink>(find.byKey(const Key('switch_button_ink_アイウ')));
    final standardKeyColor =
        (standardKeyInk.decoration as BoxDecoration?)?.color;
    expect(standardKeyColor, selectedKeyColor);

    final advKeyInk =
        tester.widget<Ink>(find.byKey(const Key('switch_button_ink_゛゜ァ')));
    final advKeyColor = (advKeyInk.decoration as BoxDecoration?)?.color;
    expect(advKeyColor, unusedKeyColor);
  });

  testWidgets('KeyboardSwitchButton(not normalKeyboard)', (tester) async {
    final fakeQuizPageNotifier = FakeQuizPageNotifier(
      const QuizPageInfo(
        normalKeyboard: false,
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizPageProvider(QuizTypes.daily)
              .overrideWith((ref) => fakeQuizPageNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: KeyboardSwitchButton(),
            ),
          ),
        ),
      ),
    );

    final standardKeyInk =
        tester.widget<Ink>(find.byKey(const Key('switch_button_ink_アイウ')));
    final standardKeyColor =
        (standardKeyInk.decoration as BoxDecoration?)?.color;
    expect(standardKeyColor, unusedKeyColor);

    final advKeyInk =
        tester.widget<Ink>(find.byKey(const Key('switch_button_ink_゛゜ァ')));
    final advKeyColor = (advKeyInk.decoration as BoxDecoration?)?.color;
    expect(advKeyColor, selectedKeyColor);
  });

  testWidgets('KeyboardSwitchButton(normalKeyboardのタップ)', (tester) async {
    final fakeQuizPageNotifier = FakeQuizPageNotifier(
      const QuizPageInfo(
        normalKeyboard: true,
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizPageProvider(QuizTypes.daily)
              .overrideWith((ref) => fakeQuizPageNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: KeyboardSwitchButton(),
            ),
          ),
        ),
      ),
    );

    // 通常キーボードに切り替え
    await tester.tap(find.byKey(const Key('switch_button_ink_アイウ')));
    await tester.pumpAndSettle();

    final standardKeyInk =
        tester.widget<Ink>(find.byKey(const Key('switch_button_ink_アイウ')));
    final standardKeyColor =
        (standardKeyInk.decoration as BoxDecoration?)?.color;
    expect(standardKeyColor, selectedKeyColor);

    final advKeyInk =
        tester.widget<Ink>(find.byKey(const Key('switch_button_ink_゛゜ァ')));
    final advKeyColor = (advKeyInk.decoration as BoxDecoration?)?.color;
    expect(advKeyColor, unusedKeyColor);
  });

  testWidgets('KeyboardSwitchButton(not normalKeyboardのタップ)', (tester) async {
    final fakeQuizPageNotifier = FakeQuizPageNotifier(
      const QuizPageInfo(
        normalKeyboard: false,
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizPageProvider(QuizTypes.daily)
              .overrideWith((ref) => fakeQuizPageNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: KeyboardSwitchButton(),
            ),
          ),
        ),
      ),
    );

    // 通常キーボードに切り替え
    await tester.tap(find.byKey(const Key('switch_button_ink_゛゜ァ')));
    await tester.pumpAndSettle();

    final standardKeyInk =
        tester.widget<Ink>(find.byKey(const Key('switch_button_ink_アイウ')));
    final standardKeyColor =
        (standardKeyInk.decoration as BoxDecoration?)?.color;
    expect(standardKeyColor, unusedKeyColor);

    final advKeyInk =
        tester.widget<Ink>(find.byKey(const Key('switch_button_ink_゛゜ァ')));
    final advKeyColor = (advKeyInk.decoration as BoxDecoration?)?.color;
    expect(advKeyColor, selectedKeyColor);
  });
}
