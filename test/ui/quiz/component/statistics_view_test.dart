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
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/provider/statistics_provider.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/repository/app_property/is_parental_control.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/statistics_view.dart';

import '../../../mock/fake_quiz_info_notifier.dart';
import '../../../mock/fake_quiz_page_notifier.dart';
import '../../../mock/fake_statistics_notifier.dart';
import '../../../mock/fake_word_input_notifier.dart';

void main() {
  testWidgets('StatisticsView(Daily)', (tester) async {
    const quizType = QuizTypes.daily;
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          quizProcess: QuizProcessType.started,
        ),
      ),
    );

    final fakeQuizPageNotifier = FakeQuizPageNotifier(const QuizPageInfo());

    final fakeStatisticsNotifier = FakeStatisticsNotifier(
      const QuizStatistics(
        playCount: 5,
        clearCount: 4,
        currentChain: 2,
        maxChain: 3,
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          quizPageProvider(quizType)
              .overrideWith((ref) => fakeQuizPageNotifier),
          wordInputNotifierProvider(quizType).overrideWith(
            (ref) => FakeWordInputNotifier(const WordInput()),
          ),
          statisticsProvider(quizType)
              .overrideWith((ref) => fakeStatisticsNotifier),
          isParentalControlProvider.overrideWith((ref) => false),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: StatisticsView(),
            ),
          ),
        ),
      ),
    );

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
    expect(fakeQuizInfoNotifier.refreshDailyQuizCalled, isTrue);
    expect(fakeQuizPageNotifier.dismissStatisticsCalled, isTrue);
  });

  testWidgets('StatisticsView(Endless)', (tester) async {
    const quizType = QuizTypes.endless;
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          quizProcess: QuizProcessType.started,
          seedText: 'フシギダネ',
        ),
      ),
    );

    final fakeQuizPageNotifier = FakeQuizPageNotifier(const QuizPageInfo());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          quizPageProvider(quizType)
              .overrideWith((ref) => fakeQuizPageNotifier),
          wordInputNotifierProvider(quizType).overrideWith(
            (ref) => FakeWordInputNotifier(const WordInput()),
          ),
          statisticsProvider(quizType).overrideWith(
            (ref) => FakeStatisticsNotifier(
              const QuizStatistics(
                playCount: 5,
                clearCount: 4,
                currentChain: 2,
                maxChain: 3,
              ),
            ),
          ),
          isParentalControlProvider.overrideWith((ref) => false),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: StatisticsView(),
            ),
          ),
        ),
      ),
    );

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
    expect(fakeQuizPageNotifier.dismissStatisticsCalled, isTrue);
  });

  testWidgets('StatisticsView(Tap QuizDialog)', (tester) async {
    const quizType = QuizTypes.daily;
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          quizProcess: QuizProcessType.started,
        ),
      ),
    );

    final fakeQuizPageNotifier = FakeQuizPageNotifier(const QuizPageInfo());

    final fakeStatisticsNotifier = FakeStatisticsNotifier(
      const QuizStatistics(
        playCount: 5,
        clearCount: 4,
        currentChain: 2,
        maxChain: 3,
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          quizPageProvider(quizType)
              .overrideWith((ref) => fakeQuizPageNotifier),
          wordInputNotifierProvider(quizType).overrideWith(
            (ref) => FakeWordInputNotifier(const WordInput()),
          ),
          statisticsProvider(quizType)
              .overrideWith((ref) => fakeStatisticsNotifier),
          isParentalControlProvider.overrideWith((ref) => false),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: StatisticsView(),
            ),
          ),
        ),
      ),
    );

    // とじるをタップ
    await tester.tapAt(Offset.zero);
    expect(fakeQuizInfoNotifier.refreshDailyQuizCalled, isTrue);
    expect(fakeQuizPageNotifier.dismissStatisticsCalled, isTrue);
  });

  testWidgets('StatisticsView(Daily success)', (tester) async {
    const quizType = QuizTypes.daily;
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          quizProcess: QuizProcessType.success,
        ),
      ),
    );

    final fakeQuizPageNotifier = FakeQuizPageNotifier(const QuizPageInfo());

    final fakeStatisticsNotifier = FakeStatisticsNotifier(
      const QuizStatistics(
        playCount: 5,
        clearCount: 4,
        currentChain: 2,
        maxChain: 3,
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          quizPageProvider(quizType)
              .overrideWith((ref) => fakeQuizPageNotifier),
          wordInputNotifierProvider(quizType).overrideWith(
            (ref) => FakeWordInputNotifier(const WordInput()),
          ),
          statisticsProvider(quizType)
              .overrideWith((ref) => fakeStatisticsNotifier),
          isParentalControlProvider.overrideWith((ref) => false),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: StatisticsView(),
            ),
          ),
        ),
      ),
    );

    expect(find.textContaining('クリア！'), findsOneWidget);
  });

  testWidgets('StatisticsView(Daily failure)', (tester) async {
    const quizType = QuizTypes.daily;
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          quizProcess: QuizProcessType.failure,
        ),
      ),
    );

    final fakeQuizPageNotifier = FakeQuizPageNotifier(const QuizPageInfo());

    final fakeStatisticsNotifier = FakeStatisticsNotifier(
      const QuizStatistics(
        playCount: 5,
        clearCount: 4,
        currentChain: 2,
        maxChain: 3,
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          quizPageProvider(quizType)
              .overrideWith((ref) => fakeQuizPageNotifier),
          wordInputNotifierProvider(quizType).overrideWith(
            (ref) => FakeWordInputNotifier(const WordInput()),
          ),
          statisticsProvider(quizType)
              .overrideWith((ref) => fakeStatisticsNotifier),
          isParentalControlProvider.overrideWith((ref) => false),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: StatisticsView(),
            ),
          ),
        ),
      ),
    );

    expect(find.text('しっぱい...'), findsOneWidget);
  });

  testWidgets('StatisticsView(Daily none)', (tester) async {
    // 通常は発生しないフロー
    const quizType = QuizTypes.daily;
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(

        ),
      ),
    );

    final fakeQuizPageNotifier = FakeQuizPageNotifier(const QuizPageInfo());

    final fakeStatisticsNotifier = FakeStatisticsNotifier(
      const QuizStatistics(
        playCount: 5,
        clearCount: 4,
        currentChain: 2,
        maxChain: 3,
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          quizPageProvider(quizType)
              .overrideWith((ref) => fakeQuizPageNotifier),
          wordInputNotifierProvider(quizType).overrideWith(
            (ref) => FakeWordInputNotifier(const WordInput()),
          ),
          statisticsProvider(quizType)
              .overrideWith((ref) => fakeStatisticsNotifier),
          isParentalControlProvider.overrideWith((ref) => false),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: StatisticsView(),
            ),
          ),
        ),
      ),
    );

    expect(find.text('[はじめから] をおしてね'), findsOneWidget);
  });

  testWidgets('StatisticsView(Daily quit)', (tester) async {
    // 通常は発生しないフロー
    const quizType = QuizTypes.daily;
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          quizProcess: QuizProcessType.quit,
        ),
      ),
    );

    final fakeQuizPageNotifier = FakeQuizPageNotifier(const QuizPageInfo());

    final fakeStatisticsNotifier = FakeStatisticsNotifier(
      const QuizStatistics(
        playCount: 5,
        clearCount: 4,
        currentChain: 2,
        maxChain: 3,
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          quizPageProvider(quizType)
              .overrideWith((ref) => fakeQuizPageNotifier),
          wordInputNotifierProvider(quizType).overrideWith(
            (ref) => FakeWordInputNotifier(const WordInput()),
          ),
          statisticsProvider(quizType)
              .overrideWith((ref) => fakeStatisticsNotifier),
          isParentalControlProvider.overrideWith((ref) => false),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: StatisticsView(),
            ),
          ),
        ),
      ),
    );

    final widget =
        tester.widget<Text>(find.byKey(const Key('statistics_label')));

    expect(widget.data, '');
  });

  testWidgets('StatisticsView(Daily null)', (tester) async {
    // 通常は発生しないフロー
    const quizType = QuizTypes.daily;
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.loading(),
    );

    final fakeQuizPageNotifier = FakeQuizPageNotifier(const QuizPageInfo());

    final fakeStatisticsNotifier = FakeStatisticsNotifier(
      const QuizStatistics(
        playCount: 5,
        clearCount: 4,
        currentChain: 2,
        maxChain: 3,
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          quizPageProvider(quizType)
              .overrideWith((ref) => fakeQuizPageNotifier),
          wordInputNotifierProvider(quizType).overrideWith(
            (ref) => FakeWordInputNotifier(const WordInput()),
          ),
          statisticsProvider(quizType)
              .overrideWith((ref) => fakeStatisticsNotifier),
          isParentalControlProvider.overrideWith((ref) => false),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: StatisticsView(),
            ),
          ),
        ),
      ),
    );

    final widget =
        tester.widget<Text>(find.byKey(const Key('statistics_label')));

    expect(widget.data, '');
  });

  test('shareText(Daily success)', () async {
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

  test('shareText(Daily success)', () async {
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

  test('shareText(Daily started)', () async {
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

  test('shareText(Daily none)', () async {
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

  test('shareText(Daily null)', () async {
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

  test('shareText(Endless none)', () async {
    final text = shareText(
      const QuizInfo(
        quizType: QuizTypes.endless,
        maxAnswer: 10,
        playDate: 20220202,
      ),
      const WordInput(
        inputIndex: 3,
      ),
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
