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
import 'package:word_quiz/provider/splash_page_notifier.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';
import 'package:word_quiz/ui/how_to_play/how_to_play_page.dart';
import 'package:word_quiz/ui/quiz/quiz_page.dart';
import 'package:word_quiz/ui/splash/splash_page.dart';

import '../../mock/fake_quiz_info_notifier.dart';
import '../../mock/fake_splash_page_notifier.dart';
import '../../mock/fake_word_input_notifier.dart';
import '../../mock/mock_box_data.dart';
import '../../mock/mock_hive_box.dart';

void main() {
  setUp(() {
    AppPlatform.overridePlatForm = null;
  });

  testWidgets('SplashPage>QuizPage', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appPropertyOverride(
            parentalControl: false,
            alreadyLaunched: true,
          ),
          settingsOverride(inputType: InputTypes.switching),
          hiveBoxProvider(dailyBoxName).overrideWith((ref) => MockHiveBox()),
          hiveBoxProvider(endlessBoxName).overrideWith((ref) => MockHiveBox()),
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

    expect(find.byType(QuizPage), findsOneWidget);
  });

  testWidgets('SplashPage>HowToPlayPage', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settingsOverride(inputType: InputTypes.switching),
          appPropertyOverride(
            parentalControl: false,
            alreadyLaunched: false,
          ),
          hiveBoxProvider(dailyBoxName).overrideWith((ref) => MockHiveBox()),
          hiveBoxProvider(endlessBoxName).overrideWith((ref) => MockHiveBox()),
          //daily
          quizInfoProvider(QuizTypes.daily).overrideWith(
            (ref) => FakeQuizInfoNotifier(const AsyncValue.data(QuizInfo())),
          ),
          wordInputNotifierProvider(QuizTypes.daily).overrideWith(
            (ref) => FakeWordInputNotifier(const WordInput()),
          ),
          // endless
          quizInfoProvider(QuizTypes.endless).overrideWith(
            (ref) => FakeQuizInfoNotifier(const AsyncValue.data(QuizInfo())),
          ),
          wordInputNotifierProvider(QuizTypes.endless).overrideWith(
            (ref) => FakeWordInputNotifier(const WordInput()),
          ),
        ],
        child: const MaterialApp(
          home: SplashPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.pump();
    expect(find.byType(HowToPlayPage), findsOneWidget);
  });

  testWidgets('SplashPage>error', (tester) async {
    final errorNotifier = FakeSplashPageNotifier(exception: Exception());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          splashPageNotifierProvider.overrideWith(() => errorNotifier),
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
