import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/model/monster_series.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_statistics.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/parental_control_provider.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/provider/statistics_provider.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/result_view.dart';

import '../../../mock/fake_quiz_info_notifier.dart';
import '../../../mock/fake_statistics_notifier.dart';
import '../../../mock/generate_mocks.mocks.dart';

void main() {
  testWidgets('ResultView(success)', (tester) async {
    const quizType = QuizTypes.daily;
    final mockQuizPageNotifier = MockQuizPageNotifier();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(quizType).overrideWith(
            (ref) => FakeQuizInfoNotifier(
              const AsyncValue.data(
                QuizInfo(
                  quizProcess: QuizProcessType.success,
                  quizRange: diamondPearl,
                  seedText: 'フシギダネ',
                ),
              ),
            ),
          ),
          quizPageProvider(quizType)
              .overrideWith((ref) => mockQuizPageNotifier),
          statisticsProvider(quizType).overrideWith(
            (ref) => FakeStatisticsNotifier(
              const QuizStatistics(
                currentChain: 3,
                lastChain: 2,
              ),
            ),
          ),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: ResultView(),
            ),
          ),
        ),
      ),
    );

    expect(find.text('いっぱいやる'), findsOneWidget);
    expect(find.text('れんさちゅう'), findsOneWidget);
    expect(find.textContaining('3 れんさ'), findsOneWidget);
    expect(find.text('しゅつだいはんい'), findsOneWidget);
    expect(find.text('ダイヤモンド・パール まで'), findsOneWidget);
    expect(find.text('あいことば'), findsOneWidget);
    expect(find.text('フシギダネ'), findsOneWidget);
    expect(find.text('おわる をえらぶと れんさ がとまります'), findsOneWidget);
    expect(find.text('おわる'), findsOneWidget);
    expect(find.text('つぎへ'), findsOneWidget);

    await tester.tapAt(Offset.zero);
    verify(mockQuizPageNotifier.dismissResult()).called(1);
  });

  testWidgets('ResultView(failure)', (tester) async {
    final mockParentalControl = MockParentalControl();
    when(mockParentalControl.isParentalControl()).thenReturn(false);

    const quizType = QuizTypes.daily;
    final mockQuizPageNotifier = MockQuizPageNotifier();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(quizType).overrideWith(
            (ref) => FakeQuizInfoNotifier(
              const AsyncValue.data(
                QuizInfo(
                  quizProcess: QuizProcessType.failure,
                  quizRange: diamondPearl,
                  seedText: 'フシギダネ',
                ),
              ),
            ),
          ),
          quizPageProvider(quizType)
              .overrideWith((ref) => mockQuizPageNotifier),
          statisticsProvider(quizType).overrideWith(
            (ref) => FakeStatisticsNotifier(
              const QuizStatistics(
                currentChain: 3,
                lastChain: 2,
              ),
            ),
          ),
          parentalControlProvider.overrideWithValue(mockParentalControl),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: ResultView(),
            ),
          ),
        ),
      ),
    );

    expect(find.text('いっぱいやる'), findsOneWidget);
    expect(find.text('けっか'), findsOneWidget);
    expect(find.textContaining('2 れんさ'), findsOneWidget);
    expect(find.text('しゅつだいはんい'), findsOneWidget);
    expect(find.text('ダイヤモンド・パール まで'), findsOneWidget);
    expect(find.text('あいことば'), findsOneWidget);
    expect(find.text('フシギダネ'), findsOneWidget);
    expect(find.text('ツイート'), findsOneWidget);
    expect(find.text('シェア'), findsOneWidget);
    expect(find.text('とじる'), findsOneWidget);
  });

  testWidgets('ResultView(quit)', (tester) async {
    final mockParentalControl = MockParentalControl();
    when(mockParentalControl.isParentalControl()).thenReturn(false);

    const quizType = QuizTypes.daily;
    final mockQuizPageNotifier = MockQuizPageNotifier();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(quizType).overrideWith(
            (ref) => FakeQuizInfoNotifier(
              const AsyncValue.data(
                QuizInfo(
                  quizProcess: QuizProcessType.quit,
                  quizRange: diamondPearl,
                  seedText: 'フシギダネ',
                ),
              ),
            ),
          ),
          quizPageProvider(quizType)
              .overrideWith((ref) => mockQuizPageNotifier),
          statisticsProvider(quizType).overrideWith(
            (ref) => FakeStatisticsNotifier(
              const QuizStatistics(
                currentChain: 3,
                lastChain: 2,
              ),
            ),
          ),
          parentalControlProvider.overrideWithValue(mockParentalControl),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: ResultView(),
            ),
          ),
        ),
      ),
    );

    expect(find.text('いっぱいやる'), findsOneWidget);
    expect(find.text('けっか'), findsOneWidget);
    expect(find.textContaining('2 れんさ'), findsOneWidget);
    expect(find.text('しゅつだいはんい'), findsOneWidget);
    expect(find.text('ダイヤモンド・パール まで'), findsOneWidget);
    expect(find.text('あいことば'), findsOneWidget);
    expect(find.text('フシギダネ'), findsOneWidget);
    expect(find.text('ツイート'), findsOneWidget);
    expect(find.text('シェア'), findsOneWidget);
    expect(find.text('とじる'), findsOneWidget);
  });

  testWidgets('おわるのタップ', (tester) async {
    const quizType = QuizTypes.daily;
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          quizProcess: QuizProcessType.success,
          quizRange: diamondPearl,
          seedText: 'フシギダネ',
        ),
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          statisticsProvider(quizType).overrideWith(
            (ref) => FakeStatisticsNotifier(
              const QuizStatistics(
                currentChain: 3,
                lastChain: 2,
              ),
            ),
          )
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: ResultView(),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('おわる'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('はい'));
    await tester.pumpAndSettle();
    expect(fakeQuizInfoNotifier.quitQuizCalled, isTrue);
  });

  testWidgets('おわるのタップ', (tester) async {
    const quizType = QuizTypes.daily;
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          quizProcess: QuizProcessType.success,
          quizRange: diamondPearl,
          seedText: 'フシギダネ',
        ),
      ),
    );

    final mockQuizPageNotifier = MockQuizPageNotifier();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          quizPageProvider(quizType)
              .overrideWith((ref) => mockQuizPageNotifier),
          statisticsProvider(quizType).overrideWith(
            (ref) => FakeStatisticsNotifier(
              const QuizStatistics(
                currentChain: 3,
                lastChain: 2,
              ),
            ),
          )
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: ResultView(),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('つぎへ'));
    await tester.pumpAndSettle();
    verify(mockQuizPageNotifier.dismissResult()).called(1);
    expect(fakeQuizInfoNotifier.nextQuizCalled, isTrue);
  });

  testWidgets('とじるのタップ', (tester) async {
    const quizType = QuizTypes.daily;
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          quizProcess: QuizProcessType.failure,
          quizRange: diamondPearl,
          seedText: 'フシギダネ',
        ),
      ),
    );

    final mockQuizPageNotifier = MockQuizPageNotifier();

    final mockParentalControl = MockParentalControl();
    when(mockParentalControl.isParentalControl()).thenReturn(false);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          quizPageProvider(quizType)
              .overrideWith((ref) => mockQuizPageNotifier),
          statisticsProvider(quizType).overrideWith(
            (ref) => FakeStatisticsNotifier(
              const QuizStatistics(
                currentChain: 3,
                lastChain: 2,
              ),
            ),
          ),
          parentalControlProvider.overrideWithValue(mockParentalControl),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: ResultView(),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('とじる'));
    verify(mockQuizPageNotifier.dismissResult()).called(1);
  });

  test('とじるのタップ', () async {
    final text = shareText(
      const QuizInfo(
        quizRange: diamondPearl,
        seedText: 'フシギダネ',
      ),
      const QuizStatistics(
        lastChain: 2,
      ),
    );

    expect(text.contains('ワードクイズ いっぱいやるモード'), isTrue);
    expect(text.contains('2 れんさ'), isTrue);
    expect(text.contains('もんだいのはんい：ダイヤモンド・パール'), isTrue);
    expect(text.contains('あいことば：フシギダネ'), isTrue);
    expect(text.contains('で おなじもんだいにちょうせんできるよ'), isTrue);
    expect(text.contains('https://fwq.page.link/applink'), isTrue);
    expect(text.contains('#ワードクイズ'), isTrue);
  });
}
