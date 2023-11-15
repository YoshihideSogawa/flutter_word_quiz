import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/repository/app_property/is_parental_control.dart';
import 'package:word_quiz/ui/parental_gate/parental_gate_page.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/tweet_button.dart';

import '../../../mock/url_launcher_tester.dart';

void main() {
  late FakeUrlLauncher urlLauncher;

  setUp(() {
    urlLauncher = setUpUrlLauncher();
  });

  testWidgets('TweetButton', (tester) async {
    const quizType = QuizTypes.daily;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          isParentalControlProvider.overrideWith((ref) => false),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: TweetButton(tweetText: 'https://example.com'),
            ),
          ),
        ),
      ),
    );

    expect(find.text('ツイート'), findsOneWidget);
    expect(find.byIcon(Icons.send), findsOneWidget);
  });

  testWidgets('TweetButton(ペアレンタルコントロール中のタップ)', (tester) async {
    const quizType = QuizTypes.daily;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          isParentalControlProvider.overrideWith((ref) => true),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: TweetButton(tweetText: 'https://example.com'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('ツイート'));
    await tester.pumpAndSettle();

    expect(find.byType(ParentalGatePage), findsOneWidget);
  });

  testWidgets('TweetButton(Tap)', (tester) async {
    const quizType = QuizTypes.daily;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          isParentalControlProvider.overrideWith((ref) => false),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: TweetButton(tweetText: 'https://example.com'),
            ),
          ),
        ),
      ),
    );

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
