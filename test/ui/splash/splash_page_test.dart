import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/constant/app_platform.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/settings_input_type_provider.dart';
import 'package:word_quiz/provider/splash_page_provider.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/repository/app_property_repository.dart';
import 'package:word_quiz/ui/how_to_play/how_to_play_page.dart';
import 'package:word_quiz/ui/parental_gate/parental_gate_page.dart';
import 'package:word_quiz/ui/quiz/quiz_page.dart';
import 'package:word_quiz/ui/splash/splash_page.dart';

import '../../mock/fake_quiz_info_notifier.dart';
import '../../mock/fake_settings_input_type_notifier.dart';
import '../../mock/fake_splash_page_notifier.dart';
import '../../mock/fake_word_input_notifier.dart';
import '../../mock/generate_mocks.mocks.dart';

void main() {
  setUp(() {
    AppPlatform.overridePlatForm = null;
  });

  testWidgets('SplashPage>QuizPage', (tester) async {
    final mockAppPropertyRepository = MockAppPropertyRepository();
    when(mockAppPropertyRepository.alreadyLaunched()).thenReturn(true);
    when(mockAppPropertyRepository.parentalControl()).thenReturn(false);

    final fakeSettingsInputTypeNotifier =
        FakeSettingsInputTypeNotifier(inputTypeSwitching);
    final fakeQuizInfoNotifier =
        FakeQuizInfoNotifier(const AsyncValue.data(QuizInfo()));

    final fakeWordInputNotifier = FakeWordInputNotifier(const WordInput());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appPropertyRepositoryProvider
              .overrideWithValue(mockAppPropertyRepository),
          settingsInputTypeProvider
              .overrideWithValue(fakeSettingsInputTypeNotifier),
          //daily
          quizInfoProvider(QuizTypes.daily)
              .overrideWithValue(fakeQuizInfoNotifier),
          wordInputNotifierProvider(QuizTypes.daily)
              .overrideWithValue(fakeWordInputNotifier),
          // endless
          quizInfoProvider(QuizTypes.endless)
              .overrideWithValue(fakeQuizInfoNotifier),
          wordInputNotifierProvider(QuizTypes.endless)
              .overrideWithValue(fakeWordInputNotifier),
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
    final mockAppPropertyRepository = MockAppPropertyRepository();
    when(mockAppPropertyRepository.alreadyLaunched()).thenReturn(false);
    when(mockAppPropertyRepository.parentalControl()).thenReturn(false);

    final fakeSettingsInputTypeNotifier =
        FakeSettingsInputTypeNotifier(inputTypeSwitching);
    final fakeQuizInfoNotifier =
        FakeQuizInfoNotifier(const AsyncValue.data(QuizInfo()));

    final fakeWordInputNotifier = FakeWordInputNotifier(const WordInput());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appPropertyRepositoryProvider
              .overrideWithValue(mockAppPropertyRepository),
          settingsInputTypeProvider
              .overrideWithValue(fakeSettingsInputTypeNotifier),
          //daily
          quizInfoProvider(QuizTypes.daily)
              .overrideWithValue(fakeQuizInfoNotifier),
          wordInputNotifierProvider(QuizTypes.daily)
              .overrideWithValue(fakeWordInputNotifier),
          // endless
          quizInfoProvider(QuizTypes.endless)
              .overrideWithValue(fakeQuizInfoNotifier),
          wordInputNotifierProvider(QuizTypes.endless)
              .overrideWithValue(fakeWordInputNotifier),
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
    final fakeSplashPageNotifier =
        FakeSplashPageNotifier(const AsyncValue.error(''));
    final fakeSettingsInputTypeNotifier =
        FakeSettingsInputTypeNotifier(inputTypeSwitching);
    final fakeQuizInfoNotifier =
        FakeQuizInfoNotifier(const AsyncValue.data(QuizInfo()));

    final fakeWordInputNotifier = FakeWordInputNotifier(const WordInput());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          splashPageProvider.overrideWithValue(fakeSplashPageNotifier),
          settingsInputTypeProvider
              .overrideWithValue(fakeSettingsInputTypeNotifier),
          //daily
          quizInfoProvider(QuizTypes.daily)
              .overrideWithValue(fakeQuizInfoNotifier),
          wordInputNotifierProvider(QuizTypes.daily)
              .overrideWithValue(fakeWordInputNotifier),
          // endless
          quizInfoProvider(QuizTypes.endless)
              .overrideWithValue(fakeQuizInfoNotifier),
          wordInputNotifierProvider(QuizTypes.endless)
              .overrideWithValue(fakeWordInputNotifier),
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
