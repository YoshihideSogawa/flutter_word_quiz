import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/logic/date_utils.dart';
import 'package:word_quiz/model/monster_series.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_statistics.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/result_view.dart';

import '../../../mock/mock_box_data.dart';

void main() {
  testWidgets('ResultView(success)', (tester) async {
    const quizType = QuizTypes.daily;
    final quizPageInfo = ValueNotifier(const QuizPageInfo());
    final quizInfo = QuizInfo(
      quizProcess: QuizProcessType.success,
      quizRange: diamondPearl,
      seedText: 'フシギダネ',
      playDate: generateDate(),
    );
    const quizStatistics = QuizStatistics(
      currentChain: 3,
      lastChain: 2,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(
            quizType: quizType,
            quizInfo: quizInfo,
            statistics: quizStatistics,
          ),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: ResultView(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

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

    await tester.pumpAndSettle();

    expect(quizPageInfo.value.showResult, isFalse);
  });

  testWidgets('ResultView(failure)', (tester) async {
    const quizType = QuizTypes.daily;
    final quizPageInfo = ValueNotifier(const QuizPageInfo());
    const quizInfo = QuizInfo(
      quizProcess: QuizProcessType.failure,
      quizRange: diamondPearl,
      seedText: 'フシギダネ',
    );
    const quizStatistics = QuizStatistics(
      currentChain: 3,
      lastChain: 2,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appPropertyOverride(parentalControl: false),
          quizOverride(
            quizType: quizType,
            statistics: quizStatistics,
            quizInfo: quizInfo,
          ),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: ResultView(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

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
    const quizType = QuizTypes.daily;
    final quizPageInfo = ValueNotifier(const QuizPageInfo());
    const quizInfo = QuizInfo(
      quizProcess: QuizProcessType.quit,
      quizRange: diamondPearl,
      seedText: 'フシギダネ',
    );
    const quizStatistics = QuizStatistics(
      currentChain: 3,
      lastChain: 2,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(
            quizType: quizType,
            statistics: quizStatistics,
            quizInfo: quizInfo,
          ),
          appPropertyOverride(parentalControl: false),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: ResultView(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

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
    final quizPageInfo = ValueNotifier(const QuizPageInfo());
    const quizInfo = QuizInfo(
      quizProcess: QuizProcessType.success,
      quizRange: diamondPearl,
      seedText: 'フシギダネ',
    );
    const quizStatistics = QuizStatistics(
      currentChain: 3,
      lastChain: 2,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(
            quizType: quizType,
            statistics: quizStatistics,
            quizInfo: quizInfo,
          ),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: ResultView(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.text('おわる'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('はい'));
    await tester.pumpAndSettle();
    expect(quizPageInfo.value.showResult, isTrue);
  });

  testWidgets('おわるのタップ', (tester) async {
    const quizType = QuizTypes.daily;
    const quizInfo = QuizInfo(
      quizProcess: QuizProcessType.success,
      quizRange: diamondPearl,
      seedText: 'フシギダネ',
    );
    final quizPageInfo = ValueNotifier(const QuizPageInfo());
    const quizStatistics = QuizStatistics(
      currentChain: 3,
      lastChain: 2,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(
            quizType: quizType,
            statistics: quizStatistics,
            quizInfo: quizInfo,
          ),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: ResultView(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.text('つぎへ'));
    await tester.pumpAndSettle();
    expect(quizPageInfo.value.showResult, isFalse);
  });

  testWidgets('とじるのタップ', (tester) async {
    const quizType = QuizTypes.daily;
    const quizInfo = QuizInfo(
      quizProcess: QuizProcessType.failure,
      quizRange: diamondPearl,
      seedText: 'フシギダネ',
    );
    final quizPageInfo = ValueNotifier(const QuizPageInfo());

    const quizStatistics = QuizStatistics(
      currentChain: 3,
      lastChain: 2,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(
            quizType: quizType,
            statistics: quizStatistics,
            quizInfo: quizInfo,
          ),
          appPropertyOverride(parentalControl: false),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: ResultView(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.text('とじる'));
    expect(quizPageInfo.value.showResult, isFalse);
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
