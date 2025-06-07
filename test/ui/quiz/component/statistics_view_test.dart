import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_statistics.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/model/word_name_state.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/statistics_view.dart';

import '../../../mock/mock_box_data.dart';

void main() {
  testWidgets('StatisticsView(Daily)', (tester) async {
    const quizType = QuizTypes.daily;
    const quizInfo = QuizInfo(quizProcess: QuizProcessType.started);

    const quizStatistics = QuizStatistics(
      playCount: 5,
      clearCount: 4,
      currentChain: 2,
      maxChain: 3,
    );

    final quizPageInfo = ValueNotifier(const QuizPageInfo());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(
            quizType: quizType,
            quizInfo: quizInfo,
            statistics: quizStatistics,
          ),
          appPropertyOverride(parentalControl: false),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(body: StatisticsView(quizPageInfo: quizPageInfo)),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('きょうの もんだい'), findsOneWidget);
    expect(find.text('ちょうせんちゅう'), findsOneWidget);
    expect(find.text('もんだいが かわるまで'), findsOneWidget);
    expect(find.text('ツイート'), findsOneWidget);
    expect(find.text('5'), findsOneWidget);
    expect(find.text('プレイ\nかいすう'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
    expect(find.text('クリア\nかいすう'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('れんさ\nかいすう'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(find.text('さいだい\nれんさ'), findsOneWidget);
    expect(find.text('ツイート'), findsOneWidget);
    expect(find.text('シェア'), findsOneWidget);
    expect(find.text('とじる'), findsOneWidget);

    // とじるをタップ
    await tester.tap(find.text('とじる'));
    await tester.pumpAndSettle();

    expect(quizPageInfo.value.showStatistics, isFalse);
  });

  testWidgets('StatisticsView(Endless)', (tester) async {
    const quizType = QuizTypes.endless;
    const quizInfo = QuizInfo(
      quizProcess: QuizProcessType.started,
      seedText: 'フシギダネ',
    );

    const quizStatistics = QuizStatistics(
      playCount: 5,
      clearCount: 4,
      currentChain: 2,
      maxChain: 3,
    );

    final quizPageInfo = ValueNotifier(const QuizPageInfo());

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
            child: Scaffold(body: StatisticsView(quizPageInfo: quizPageInfo)),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('いっぱいやる モード'), findsOneWidget);
    expect(find.text('さいごにあそんだ あいことば'), findsOneWidget);
    expect(find.text('フシギダネ'), findsOneWidget);
    expect(find.text('5'), findsOneWidget);
    expect(find.text('プレイ\nかいすう'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
    expect(find.text('クリア\nかいすう'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('れんさ\nかいすう'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(find.text('さいだい\nれんさ'), findsOneWidget);
    expect(find.text('ツイート'), findsOneWidget);
    expect(find.text('シェア'), findsOneWidget);
    expect(find.text('とじる'), findsOneWidget);

    // とじるをタップ
    await tester.tap(find.text('とじる'));

    expect(quizPageInfo.value.showStatistics, isFalse);
  });

  testWidgets('StatisticsView(Tap QuizDialog)', (tester) async {
    const quizType = QuizTypes.daily;
    const quizInfo = QuizInfo(quizProcess: QuizProcessType.started);
    final quizPageInfo = ValueNotifier(const QuizPageInfo());

    const quizStatistics = QuizStatistics(
      playCount: 5,
      clearCount: 4,
      currentChain: 2,
      maxChain: 3,
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
            child: Scaffold(body: StatisticsView(quizPageInfo: quizPageInfo)),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // とじるをタップ
    await tester.tapAt(Offset.zero);
    await tester.pumpAndSettle();

    expect(quizPageInfo.value.showStatistics, isFalse);
  });

  testWidgets('StatisticsView(Daily success)', (tester) async {
    const quizType = QuizTypes.daily;
    const quizInfo = QuizInfo(quizProcess: QuizProcessType.success);
    final quizPageInfo = ValueNotifier(const QuizPageInfo());

    const quizStatistics = QuizStatistics(
      playCount: 5,
      clearCount: 4,
      currentChain: 2,
      maxChain: 3,
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
            child: Scaffold(body: StatisticsView(quizPageInfo: quizPageInfo)),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.textContaining('クリア！'), findsOneWidget);
  });

  testWidgets('StatisticsView(Daily failure)', (tester) async {
    const quizType = QuizTypes.daily;
    const quizInfo = QuizInfo(quizProcess: QuizProcessType.failure);
    final quizPageInfo = ValueNotifier(const QuizPageInfo());

    const quizStatistics = QuizStatistics(
      playCount: 5,
      clearCount: 4,
      currentChain: 2,
      maxChain: 3,
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
            child: Scaffold(body: StatisticsView(quizPageInfo: quizPageInfo)),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('しっぱい...'), findsOneWidget);
  });

  testWidgets('StatisticsView(Daily none)', (tester) async {
    // 通常は発生しないフロー
    const quizType = QuizTypes.daily;
    const quizInfo = QuizInfo();
    final quizPageInfo = ValueNotifier(const QuizPageInfo());

    const quizStatistics = QuizStatistics(
      playCount: 5,
      clearCount: 4,
      currentChain: 2,
      maxChain: 3,
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
            child: Scaffold(body: StatisticsView(quizPageInfo: quizPageInfo)),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('[はじめから] をおしてね'), findsOneWidget);
  });

  testWidgets('StatisticsView(Daily quit)', (tester) async {
    // 通常は発生しないフロー
    const quizType = QuizTypes.daily;
    const quizInfo = QuizInfo(quizProcess: QuizProcessType.quit);
    final quizPageInfo = ValueNotifier(const QuizPageInfo());

    const quizStatistics = QuizStatistics(
      playCount: 5,
      clearCount: 4,
      currentChain: 2,
      maxChain: 3,
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
            child: Scaffold(body: StatisticsView(quizPageInfo: quizPageInfo)),
          ),
        ),
      ),
    );

    final widget = tester.widget<Text>(
      find.byKey(const Key('statistics_label')),
    );

    expect(widget.data, '');
  });

  testWidgets('StatisticsView(Daily null)', (tester) async {
    // 通常は発生しないフロー
    const quizType = QuizTypes.daily;
    final quizPageInfo = ValueNotifier(const QuizPageInfo());

    const quizStatistics = QuizStatistics(
      playCount: 5,
      clearCount: 4,
      currentChain: 2,
      maxChain: 3,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appPropertyOverride(parentalControl: false),
          quizOverride(quizType: quizType, statistics: quizStatistics),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(body: StatisticsView(quizPageInfo: quizPageInfo)),
          ),
        ),
      ),
    );

    final widget = tester.widget<Text>(
      find.byKey(const Key('statistics_label')),
    );

    expect(widget.data, '');
  });

  test('shareText(Daily success)', () {
    final text = shareText(
      const QuizInfo(
        quizType: QuizTypes.daily,
        quizProcess: QuizProcessType.success,
        maxAnswer: 10,
        playDate: 20220202,
      ),
      const WordInput(
        inputIndex: 3,
        wordsResultList: [
          [
            WordNameState.notMatch,
            WordNameState.notMatch,
            WordNameState.notMatch,
            WordNameState.notMatch,
            WordNameState.notMatch,
          ],
          [
            WordNameState.hit,
            WordNameState.hit,
            WordNameState.hit,
            WordNameState.hit,
            WordNameState.none,
          ],
          [
            WordNameState.match,
            WordNameState.match,
            WordNameState.match,
            WordNameState.match,
            WordNameState.match,
          ],
        ],
      ),
      const QuizStatistics(
        playCount: 5,
        clearCount: 4,
        currentChain: 2,
        maxChain: 3,
      ),
    );

    expect(text.contains('ワードクイズ 3/10 (02/02)'), isTrue);
    expect(text.contains('⬛⬛⬛⬛⬛'), isTrue);
    expect(text.contains('🟨🟨🟨🟨⬜'), isTrue);
    expect(text.contains('🟩🟩🟩🟩🟩'), isTrue);
    expect(text.contains('https://fwq.page.link/applink'), isTrue);
    expect(text.contains('#ワードクイズ'), isTrue);
  });

  test('shareText(Daily success)', () {
    final text = shareText(
      const QuizInfo(
        quizType: QuizTypes.daily,
        quizProcess: QuizProcessType.failure,
        maxAnswer: 10,
        playDate: 20220202,
      ),
      const WordInput(
        inputIndex: 3,
        wordsResultList: [
          [
            WordNameState.notMatch,
            WordNameState.notMatch,
            WordNameState.notMatch,
          ],
          [
            WordNameState.notMatch,
            WordNameState.notMatch,
            WordNameState.notMatch,
            WordNameState.notMatch,
            WordNameState.hit,
          ],
          [
            WordNameState.notMatch,
            WordNameState.hit,
            WordNameState.notMatch,
            WordNameState.notMatch,
            WordNameState.hit,
          ],
          [
            WordNameState.notMatch,
            WordNameState.notMatch,
            WordNameState.notMatch,
            WordNameState.notMatch,
            WordNameState.match,
          ],
          [
            WordNameState.hit,
            WordNameState.hit,
            WordNameState.hit,
            WordNameState.hit,
            WordNameState.none,
          ],
          [
            WordNameState.match,
            WordNameState.match,
            WordNameState.match,
            WordNameState.match,
            WordNameState.notMatch,
          ],
        ],
      ),
      const QuizStatistics(
        playCount: 5,
        clearCount: 4,
        currentChain: 2,
        maxChain: 3,
      ),
    );

    expect(text.contains('ワードクイズ X/10 (02/02)'), isTrue);
    expect(text.contains('⬛⬛⬛⬜⬜  🟩🟩🟩🟩⬛'), isTrue);
    expect(text.contains('⬛⬛⬛⬛🟨'), isTrue);
    expect(text.contains('⬛🟨⬛⬛🟨'), isTrue);
    expect(text.contains('⬛⬛⬛⬛🟩'), isTrue);
    expect(text.contains('🟨🟨🟨🟨⬜'), isTrue);
    expect(text.contains('https://fwq.page.link/applink'), isTrue);
    expect(text.contains('#ワードクイズ'), isTrue);
  });

  test('shareText(Daily started)', () {
    final text = shareText(
      const QuizInfo(
        quizType: QuizTypes.daily,
        quizProcess: QuizProcessType.started,
        maxAnswer: 10,
        playDate: 20220202,
      ),
      const WordInput(
        inputIndex: 3,
        wordsResultList: [
          [
            WordNameState.notMatch,
            WordNameState.notMatch,
            WordNameState.notMatch,
            WordNameState.notMatch,
            WordNameState.notMatch,
          ],
          [
            WordNameState.hit,
            WordNameState.hit,
            WordNameState.hit,
            WordNameState.hit,
            WordNameState.none,
          ],
          [
            WordNameState.match,
            WordNameState.match,
            WordNameState.match,
            WordNameState.match,
            WordNameState.match,
          ],
        ],
      ),
      const QuizStatistics(
        playCount: 5,
        clearCount: 4,
        currentChain: 2,
        maxChain: 3,
      ),
    );

    expect(text.contains('モンスターの なまえあてゲーム であそぼう！'), isTrue);
    expect(text.contains('⬛⬛⬛⬛⬛'), isFalse);
    expect(text.contains('🟨🟨🟨🟨⬜'), isFalse);
    expect(text.contains('🟩🟩🟩🟩🟩'), isFalse);
    expect(text.contains('https://fwq.page.link/applink'), isTrue);
    expect(text.contains('#ワードクイズ'), isTrue);
  });

  test('shareText(Daily none)', () {
    final text = shareText(
      const QuizInfo(
        quizType: QuizTypes.daily,
        maxAnswer: 10,
        playDate: 20220202,
      ),
      const WordInput(
        inputIndex: 3,
        wordsResultList: [
          [
            WordNameState.notMatch,
            WordNameState.notMatch,
            WordNameState.notMatch,
            WordNameState.notMatch,
            WordNameState.notMatch,
          ],
          [
            WordNameState.hit,
            WordNameState.hit,
            WordNameState.hit,
            WordNameState.hit,
            WordNameState.none,
          ],
          [
            WordNameState.match,
            WordNameState.match,
            WordNameState.match,
            WordNameState.match,
            WordNameState.match,
          ],
        ],
      ),
      const QuizStatistics(
        playCount: 5,
        clearCount: 4,
        currentChain: 2,
        maxChain: 3,
      ),
    );

    expect(text.contains('モンスターの なまえあてゲーム であそぼう！'), isTrue);
    expect(text.contains('⬛⬛⬛⬛⬛'), isFalse);
    expect(text.contains('🟨🟨🟨🟨⬜'), isFalse);
    expect(text.contains('🟩🟩🟩🟩🟩'), isFalse);
    expect(text.contains('https://fwq.page.link/applink'), isTrue);
    expect(text.contains('#ワードクイズ'), isTrue);
  });

  test('shareText(Daily null)', () {
    final text = shareText(
      null,
      const WordInput(
        inputIndex: 3,
        wordsResultList: [
          [
            WordNameState.notMatch,
            WordNameState.notMatch,
            WordNameState.notMatch,
            WordNameState.notMatch,
            WordNameState.notMatch,
          ],
          [
            WordNameState.hit,
            WordNameState.hit,
            WordNameState.hit,
            WordNameState.hit,
            WordNameState.none,
          ],
          [
            WordNameState.match,
            WordNameState.match,
            WordNameState.match,
            WordNameState.match,
            WordNameState.match,
          ],
        ],
      ),
      const QuizStatistics(
        playCount: 5,
        clearCount: 4,
        currentChain: 2,
        maxChain: 3,
      ),
    );

    expect(text.contains('モンスターの なまえあてゲーム であそぼう！'), isTrue);
    expect(text.contains('⬛⬛⬛⬛⬛'), isFalse);
    expect(text.contains('🟨🟨🟨🟨⬜'), isFalse);
    expect(text.contains('🟩🟩🟩🟩🟩'), isFalse);
    expect(text.contains('https://fwq.page.link/applink'), isTrue);
    expect(text.contains('#ワードクイズ'), isTrue);
  });

  test('shareText(Endless none)', () {
    final text = shareText(
      const QuizInfo(
        quizType: QuizTypes.endless,
        maxAnswer: 10,
        playDate: 20220202,
      ),
      const WordInput(inputIndex: 3),
      const QuizStatistics(
        playCount: 5,
        clearCount: 4,
        currentChain: 2,
        maxChain: 3,
      ),
    );

    expect(text.contains('ワードクイズ いっぱいやるモード'), isTrue);
    expect(text.contains('プレイかいすう：5'), isTrue);
    expect(text.contains('クリアかいすう：4'), isTrue);
    expect(text.contains('いまのれんさ　：2'), isTrue);
    expect(text.contains('さいだいれんさ：3'), isTrue);
    expect(text.contains('https://fwq.page.link/applink'), isTrue);
    expect(text.contains('#ワードクイズ'), isTrue);
  });
}
