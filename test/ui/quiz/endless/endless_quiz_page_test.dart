import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/settings_input_type_provider.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/ui/quiz/component/quiz_drawer.dart';
import 'package:word_quiz/ui/quiz/component/refresh_quiz_button.dart';
import 'package:word_quiz/ui/quiz/component/statistics_button.dart';
import 'package:word_quiz/ui/quiz/component/word_quiz_layout.dart';
import 'package:word_quiz/ui/quiz/endless/endless_quiz_page.dart';

import '../../../mock/fake_quiz_info_notifier.dart';
import '../../../mock/fake_settings_input_type_notifier.dart';
import '../../../mock/fake_word_input_notifier.dart';

void main() {
  testWidgets('EndlessQuizPage(読み込み完了)', (tester) async {
    final fakeSettingsInputTypeNotifier =
        FakeSettingsInputTypeNotifier(inputTypeSwitching);
    final fakeWordInputNotifier = FakeWordInputNotifier(const WordInput());

    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(),
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settingsInputTypeProvider
              .overrideWithValue(fakeSettingsInputTypeNotifier),
          quizInfoProvider(QuizTypes.endless)
              .overrideWithValue(fakeQuizInfoNotifier),
          wordInputNotifierProvider(QuizTypes.endless)
              .overrideWithValue(fakeWordInputNotifier),
        ],
        child: const MaterialApp(
          home: EndlessQuizPage(),
        ),
      ),
    );

    expect(find.text('いっぱいやる'), findsOneWidget);
    expect(find.byType(RefreshQuizButton), findsNothing);
    expect(find.byType(StatisticsButton), findsOneWidget);
    expect(find.byType(WordQuizLayout), findsOneWidget);

    // ドロワーオープン
    tester.firstState<ScaffoldState>(find.byType(Scaffold)).openDrawer();
    await tester.pumpAndSettle();
    expect(find.byType(QuizDrawer), findsOneWidget);
  });

  testWidgets('EndlessQuizPage(Loading)', (tester) async {
    final fakeSettingsInputTypeNotifier =
        FakeSettingsInputTypeNotifier(inputTypeSwitching);
    final fakeWordInputNotifier = FakeWordInputNotifier(const WordInput());

    final fakeQuizInfoNotifier =
        FakeQuizInfoNotifier(const AsyncValue.loading());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settingsInputTypeProvider
              .overrideWithValue(fakeSettingsInputTypeNotifier),
          quizInfoProvider(QuizTypes.endless)
              .overrideWithValue(fakeQuizInfoNotifier),
          wordInputNotifierProvider(QuizTypes.endless)
              .overrideWithValue(fakeWordInputNotifier),
        ],
        child: const MaterialApp(
          home: EndlessQuizPage(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('EndlessQuizPage(Error)', (tester) async {
    final fakeSettingsInputTypeNotifier =
        FakeSettingsInputTypeNotifier(inputTypeSwitching);
    final fakeWordInputNotifier = FakeWordInputNotifier(const WordInput());

    final fakeQuizInfoNotifier =
        FakeQuizInfoNotifier(const AsyncValue.error(''));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settingsInputTypeProvider
              .overrideWithValue(fakeSettingsInputTypeNotifier),
          quizInfoProvider(QuizTypes.endless)
              .overrideWithValue(fakeQuizInfoNotifier),
          wordInputNotifierProvider(QuizTypes.endless)
              .overrideWithValue(fakeWordInputNotifier),
        ],
        child: const MaterialApp(
          home: EndlessQuizPage(),
        ),
      ),
    );

    expect(
      find.text('もんだいが おこりました\nアプリを さいきどう してください'),
      findsOneWidget,
    );
  });
}
