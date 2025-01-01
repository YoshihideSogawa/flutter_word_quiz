import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/constant/app_platform.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/repository/app_property/app_property_keys.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';
import 'package:word_quiz/routing/routes.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/tweet_button.dart';

import '../../../mock/go_router_tester.dart';
import '../../../mock/mock_box_data.dart';
import '../../../mock/mock_hive_box.dart';
import '../../../mock/url_launcher_tester.dart';

void main() {
  late FakeUrlLauncher urlLauncher;
  late FakeGoRouter router;

  setUp(() {
    AppPlatform.overridePlatForm = Platforms.iOS;
    urlLauncher = setUpUrlLauncher();
    router = FakeGoRouter();
  });

  tearDown(() {
    AppPlatform.overridePlatForm = null;
  });

  testWidgets('TweetButton', (tester) async {
    const quizType = QuizTypes.daily;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appPropertyOverride(parentalControl: false),
        ],
        child: InheritedGoRouter(
          goRouter: router,
          child: const MaterialApp(
            home: QuizType(
              quizType: quizType,
              child: Scaffold(
                body: TweetButton(tweetText: 'https://example.com'),
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('ツイート'), findsOneWidget);
    expect(find.byIcon(Icons.send), findsOneWidget);
  });

  testWidgets('TweetButton(ペアレンタルコントロール中のタップ)', (tester) async {
    const quizType = QuizTypes.daily;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appPropertyOverrideAndBox(parentalControl: true).override,
        ],
        child: InheritedGoRouter(
          goRouter: router,
          child: const MaterialApp(
            home: QuizType(
              quizType: quizType,
              child: Scaffold(
                body: TweetButton(tweetText: 'https://example.com'),
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.text('ツイート'));
    await tester.pumpAndSettle();

    expect(router.lastLocation, Routes.parentalGate);
  });

  testWidgets('TweetButton(Tap)', (tester) async {
    const quizType = QuizTypes.daily;
    final box = MockHiveBox<dynamic>(
      initData: {
        parentalControlKey: false,
      },
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          hiveBoxProvider(appPropertyBoxName).overrideWith((ref) => box),
        ],
        child: InheritedGoRouter(
          goRouter: router,
          child: const MaterialApp(
            home: QuizType(
              quizType: quizType,
              child: Scaffold(
                body: TweetButton(tweetText: 'https://example.com'),
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.text('ツイート'));
    await tester.pumpAndSettle();
    expect(
      urlLauncher.launchedUrl,
      'https://twitter.com/intent/tweet?text=https%3A%2F%2Fexample.com',
    );
    expect(urlLauncher.launchCalled, isTrue);
    expect(find.byIcon(Icons.send), findsOneWidget);
  });
}
