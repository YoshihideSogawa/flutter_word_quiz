import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/constant/app_platform.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/settings_input_type_provider.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/repository/app_property/app_property_keys.dart';
import 'package:word_quiz/ui/how_to_play/how_to_play_page.dart';
import 'package:word_quiz/ui/quiz/quiz_page.dart';
import 'package:word_quiz/ui/splash/splash_page.dart';

import '../../mock/fake_quiz_info_notifier.dart';
import '../../mock/fake_settings_input_type_notifier.dart';
import '../../mock/fake_word_input_notifier.dart';
import '../../mock/hive_tester.dart';

void main() {
  setUp(() {
    AppPlatform.overridePlatForm = null;
    setUpHive();
  });

  tearDown(tearDownHive);

  testWidgets('SplashPage>QuizPage', (tester) async {
    final fakeSettingsInputTypeNotifier =
        FakeSettingsInputTypeNotifier(inputTypeSwitching);
    final fakeQuizInfoNotifier =
        FakeQuizInfoNotifier(const AsyncValue.data(QuizInfo()));

    final fakeWordInputNotifier = FakeWordInputNotifier(const WordInput());

    await tester.setHiveMockInitialValues(
      appPropertyBoxName,
      {
        parentalControlKey: false,
        alreadyLaunchedKey: true,
      },
    );
    await tester.setHiveMockInitialValues(dailyBoxName);
    await tester.setHiveMockInitialValues(endlessBoxName);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settingsInputTypeProvider
              .overrideWith((ref) => fakeSettingsInputTypeNotifier),
          //daily
          quizInfoProvider(QuizTypes.daily)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          wordInputNotifierProvider(QuizTypes.daily)
              .overrideWith((ref) => fakeWordInputNotifier),
          // endless
          quizInfoProvider(QuizTypes.endless)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          wordInputNotifierProvider(QuizTypes.endless)
              .overrideWith((ref) => fakeWordInputNotifier),
        ],
        child: const MaterialApp(
          home: SplashPage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(QuizPage), findsOneWidget);
  });

  testWidgets('SplashPage>HowToPlayPage', (tester) async {
    final fakeSettingsInputTypeNotifier =
        FakeSettingsInputTypeNotifier(inputTypeSwitching);

    await tester.setHiveMockInitialValues(appPropertyBoxName, {
      parentalControlKey: false,
      alreadyLaunchedKey: true,
    });
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settingsInputTypeProvider
              .overrideWith((ref) => fakeSettingsInputTypeNotifier),
          //daily
          quizInfoProvider(QuizTypes.daily).overrideWith(
              (ref) => FakeQuizInfoNotifier(const AsyncValue.data(QuizInfo()))),
          wordInputNotifierProvider(QuizTypes.daily)
              .overrideWith((ref) => FakeWordInputNotifier(const WordInput())),
          // endless
          quizInfoProvider(QuizTypes.endless).overrideWith(
              (ref) => FakeQuizInfoNotifier(const AsyncValue.data(QuizInfo()))),
          wordInputNotifierProvider(QuizTypes.endless)
              .overrideWith((ref) => FakeWordInputNotifier(const WordInput())),
        ],
        child: const MaterialApp(
          home: SplashPage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(HowToPlayPage), findsOneWidget);
  });

  testWidgets('SplashPage>error', (tester) async {
    final fakeSettingsInputTypeNotifier =
        FakeSettingsInputTypeNotifier(inputTypeSwitching);
    final fakeQuizInfoNotifier =
        FakeQuizInfoNotifier(const AsyncValue.data(QuizInfo()));

    final fakeWordInputNotifier = FakeWordInputNotifier(const WordInput());

    await tester.setHiveMockInitialValues(appPropertyBoxName, {
      parentalControlKey: 'IllegalData',
      alreadyLaunchedKey: true,
    });
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settingsInputTypeProvider
              .overrideWith((ref) => fakeSettingsInputTypeNotifier),
          //daily
          quizInfoProvider(QuizTypes.daily).overrideWith(
            (ref) => FakeQuizInfoNotifier(const AsyncValue.data(QuizInfo())),
          ),
          wordInputNotifierProvider(QuizTypes.daily)
              .overrideWith((ref) => FakeWordInputNotifier(const WordInput())),
          // endless
          quizInfoProvider(QuizTypes.endless).overrideWith(
            (ref) => FakeQuizInfoNotifier(const AsyncValue.data(QuizInfo())),
          ),
          wordInputNotifierProvider(QuizTypes.endless)
              .overrideWith((ref) => FakeWordInputNotifier(const WordInput())),
        ],
        child: const MaterialApp(
          home: SplashPage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(
      find.text('もんだいが おこりました\nアプリを さいきどう してください'),
      findsOneWidget,
    );
  });
}
