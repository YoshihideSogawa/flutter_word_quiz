import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/parental_control_provider.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/tweet_button.dart';

import '../../../mock/generate_mocks.mocks.dart';
import '../../../mock/url_launcher_tester.dart';

void main() {
  late FakeUrlLauncher urlLauncher;

  setUp(() {
    urlLauncher = setUpUrlLauncher();
  });

  testWidgets('TweetButton', (tester) async {
    final mockParentalControl = MockParentalControl();
    when(mockParentalControl.isParentalControl()).thenReturn(false);

    const quizType = QuizTypes.daily;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          parentalControlProvider.overrideWithValue(mockParentalControl),
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

  testWidgets('TweetButton(ペアレンタルコントロール)', (tester) async {
    final mockParentalControl = MockParentalControl();
    when(mockParentalControl.isParentalControl()).thenReturn(true);

    const quizType = QuizTypes.daily;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          parentalControlProvider.overrideWithValue(mockParentalControl),
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

    expect(find.text('ツイート'), findsNothing);
    expect(find.byType(SizedBox), findsOneWidget);
  });

  testWidgets('TweetButton(Tap)', (tester) async {
    final mockParentalControl = MockParentalControl();
    when(mockParentalControl.isParentalControl()).thenReturn(false);

    const quizType = QuizTypes.daily;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          parentalControlProvider.overrideWithValue(mockParentalControl),
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
      urlLauncher.launchUrl,
      'https://twitter.com/intent/tweet?text=https%3A%2F%2Fexample.com',
    );
    expect(urlLauncher.launchCalled, isTrue);
    expect(find.byIcon(Icons.send), findsOneWidget);
  });
}
