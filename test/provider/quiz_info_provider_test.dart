import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/logic/date_utils.dart';
import 'package:word_quiz/model/monster.dart';
import 'package:word_quiz/model/monster_series.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_statistics.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/model/word_name_state.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/provider/statistics_provider.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/repository/monster_list_repository.dart';
import 'package:word_quiz/repository/quiz_repository.dart';

import '../mock/fake_monster_list_repository.dart';
import '../mock/fake_statistics_notifier.dart';
import '../mock/fake_word_input_notifier.dart';
import '../mock/generate_mocks.mocks.dart';

void main() {
  test('初期化(daily)', () async {
    const quizType = QuizTypes.daily;
    final mockQuizRepository = MockQuizRepository();
    when(mockQuizRepository.loadQuizInfo()).thenReturn(null);

    final container = ProviderContainer(
      overrides: [
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
        quizRepositoryProvider(quizType).overrideWithValue(mockQuizRepository),
        statisticsProvider(quizType)
            .overrideWith((ref) => MockStatisticsNotifier()),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    // ignore: invalid_use_of_visible_for_testing_member
    await container.read(quizInfoProvider(quizType).notifier).init();
    final quizInfo = container.read(quizInfoProvider(quizType)).value!;
    expect(quizInfo.quizType, QuizTypes.daily);
    expect(quizInfo.maxAnswer, 10);
    expect(quizInfo.answer, isNotNull);
    expect(quizInfo.quizProcess, QuizProcessType.started);
    expect(quizInfo.quizRange, QuizInfoNotifier.defaultQuizRange);
    expect(quizInfo.playDate, isNot(0));
  });

  test('初期化(endless)', () async {
    const quizType = QuizTypes.endless;
    final mockQuizRepository = MockQuizRepository();
    when(mockQuizRepository.loadQuizInfo()).thenReturn(null);

    final mockQuizPageNotifier = MockQuizPageNotifier();

    final container = ProviderContainer(
      overrides: [
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
        quizRepositoryProvider(quizType).overrideWithValue(mockQuizRepository),
        statisticsProvider(quizType)
            .overrideWith((ref) => MockStatisticsNotifier()),
        quizPageProvider(quizType).overrideWith((ref) => mockQuizPageNotifier),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    // ignore: invalid_use_of_visible_for_testing_member
    await container.read(quizInfoProvider(quizType).notifier).init();
    final quizInfo = container.read(quizInfoProvider(quizType)).value!;
    expect(quizInfo.quizType, QuizTypes.endless);
    expect(quizInfo.maxAnswer, 10);
    expect(quizInfo.answer, isNull);
    expect(quizInfo.quizProcess, QuizProcessType.none);
    expect(quizInfo.quizRange, isNull);
    expect(quizInfo.playDate, 0);

    // Future.microtask() を待つ
    await Future.delayed(const Duration(milliseconds: 1), () {});

    // TODO(sogawa): 一旦コメントアウト
    // verify(mockQuizPageNotifier.showQuizSelection()).called(1);
  });

  test('保存データあり(daily/日付変化なし)', () async {
    const quizType = QuizTypes.daily;
    final initQuizInfo = _quizInfoTest(quizType);

    final mockQuizRepository = MockQuizRepository();
    when(mockQuizRepository.loadQuizInfo()).thenReturn(initQuizInfo);

    final container = ProviderContainer(
      overrides: [
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
        quizRepositoryProvider(quizType).overrideWithValue(mockQuizRepository),
        statisticsProvider(quizType)
            .overrideWith((ref) => MockStatisticsNotifier()),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    // ignore: invalid_use_of_visible_for_testing_member
    await container.read(quizInfoProvider(quizType).notifier).init();
    final quizInfo = container.read(quizInfoProvider(quizType)).value!;
    expect(quizInfo.quizType, initQuizInfo.quizType);
    expect(quizInfo.maxAnswer, initQuizInfo.maxAnswer);
    expect(quizInfo.answer, initQuizInfo.answer);
    expect(quizInfo.quizProcess, initQuizInfo.quizProcess);
    expect(quizInfo.quizRange, initQuizInfo.quizRange);
    expect(quizInfo.playDate, initQuizInfo.playDate);
    expect(quizInfo.seedText, initQuizInfo.seedText);
  });

  test('保存データあり(daily/日付変化あり)', () async {
    const quizType = QuizTypes.daily;
    final initQuizInfo = _quizInfoTest(quizType);

    final mockQuizRepository = MockQuizRepository();
    when(mockQuizRepository.loadQuizInfo()).thenReturn(initQuizInfo);

    final container = ProviderContainer(
      overrides: [
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
        quizRepositoryProvider(quizType).overrideWithValue(mockQuizRepository),
        statisticsProvider(quizType)
            .overrideWith((ref) => MockStatisticsNotifier()),
        wordInputNotifierProvider(quizType)
            .overrideWith((ref) => MockWordInputNotifier()),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    // ignore: invalid_use_of_visible_for_testing_member
    await container.read(quizInfoProvider(quizType).notifier).init();
    final quizInfo = container.read(quizInfoProvider(quizType)).value!;
    expect(quizInfo.quizType, initQuizInfo.quizType);
    expect(quizInfo.maxAnswer, initQuizInfo.maxAnswer);
    expect(quizInfo.answer, isNotNull);
    expect(quizInfo.quizProcess, initQuizInfo.quizProcess);
    expect(quizInfo.quizRange, initQuizInfo.quizRange);
    expect(quizInfo.playDate, generateDate());
    expect(quizInfo.seedText, initQuizInfo.seedText);
  });

  test('保存データあり(daily/success>履歴表示)', () async {
    const quizType = QuizTypes.daily;
    final initQuizInfo = _quizInfoTest3(quizType);

    final mockQuizRepository = MockQuizRepository();
    when(mockQuizRepository.loadQuizInfo()).thenReturn(initQuizInfo);

    final mockQuizPageNotifier = MockQuizPageNotifier();

    final container = ProviderContainer(
      overrides: [
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
        quizRepositoryProvider(quizType).overrideWithValue(mockQuizRepository),
        statisticsProvider(quizType)
            .overrideWith((ref) => MockStatisticsNotifier()),
        wordInputNotifierProvider(quizType)
            .overrideWith((ref) => MockWordInputNotifier()),
        quizPageProvider(quizType).overrideWith((ref) => mockQuizPageNotifier),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    // ignore: invalid_use_of_visible_for_testing_member
    await container.read(quizInfoProvider(quizType).notifier).init();
    final quizInfo = container.read(quizInfoProvider(quizType)).value!;

    // Future.microtask() を待つ
    await Future.delayed(const Duration(milliseconds: 1), () {});

    // TODO(sogawa): 一旦コメントアウト
    // verify(mockQuizPageNotifier.showStatistics()).called(1);
  });

  test('保存データあり(endless)', () async {
    const quizType = QuizTypes.endless;
    final initQuizInfo = _quizInfoTest(quizType);

    final mockQuizRepository = MockQuizRepository();
    when(mockQuizRepository.loadQuizInfo()).thenReturn(initQuizInfo);

    final container = ProviderContainer(
      overrides: [
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
        quizRepositoryProvider(quizType).overrideWithValue(mockQuizRepository),
        statisticsProvider(quizType)
            .overrideWith((ref) => MockStatisticsNotifier()),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    // ignore: invalid_use_of_visible_for_testing_member
    await container.read(quizInfoProvider(quizType).notifier).init();
    final quizInfo = container.read(quizInfoProvider(quizType)).value!;
    expect(quizInfo.quizType, initQuizInfo.quizType);
    expect(quizInfo.maxAnswer, initQuizInfo.maxAnswer);
    expect(quizInfo.answer, initQuizInfo.answer);
    expect(quizInfo.quizProcess, initQuizInfo.quizProcess);
    expect(quizInfo.quizRange, initQuizInfo.quizRange);
    expect(quizInfo.playDate, initQuizInfo.playDate);
    expect(quizInfo.seedText, initQuizInfo.seedText);
  });

  test('refreshDailyQuiz(QuizProcess.started)', () async {
    const quizType = QuizTypes.daily;
    final mockQuizRepository = MockQuizRepository();
    // 初期値を設定
    when(mockQuizRepository.loadQuizInfo()).thenReturn(_quizInfoTest(quizType));

    final mockStatisticsNotifier = MockStatisticsNotifier();

    final container = ProviderContainer(
      overrides: [
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
        quizRepositoryProvider(quizType).overrideWithValue(mockQuizRepository),
        statisticsProvider(quizType)
            .overrideWith((ref) => mockStatisticsNotifier),
        wordInputNotifierProvider(quizType)
            .overrideWith((ref) => MockWordInputNotifier()),
      ],
    );

    // 内部的に書き換え
    final quizInfoTest = _quizInfoTest2(quizType);
    final quizInfoNotifier = container.read(quizInfoProvider(quizType).notifier)
      ..updateQuizInfo(quizInfoTest);

    final result = await quizInfoNotifier.refreshDailyQuiz();
    expect(result, isTrue);
    final quizInfo = container.read(quizInfoProvider(quizType)).value!;

    expect(quizInfo.quizType, quizInfoTest.quizType);
    expect(quizInfo.maxAnswer, quizInfoTest.maxAnswer);
    expect(quizInfo.answer, isNotNull);
    expect(quizInfo.quizProcess, quizInfoTest.quizProcess);
    expect(quizInfo.quizRange, quizInfoTest.quizRange);
    expect(quizInfo.playDate, generateDate());
    expect(quizInfo.seedText, quizInfoTest.seedText);

    // 連鎖数の変動に関連する処理
    verify(mockStatisticsNotifier.startQuiz()).called(1);
    verifyNever(mockStatisticsNotifier.nextQuiz());
  });

  test('refreshDailyQuiz(QuizProcess.success)', () async {
    const quizType = QuizTypes.daily;
    final mockQuizRepository = MockQuizRepository();
    // 初期値を設定
    when(mockQuizRepository.loadQuizInfo()).thenReturn(_quizInfoTest(quizType));

    final mockStatisticsNotifier = MockStatisticsNotifier();

    final container = ProviderContainer(
      overrides: [
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
        quizRepositoryProvider(quizType).overrideWithValue(mockQuizRepository),
        statisticsProvider(quizType)
            .overrideWith((ref) => mockStatisticsNotifier),
        wordInputNotifierProvider(quizType)
            .overrideWith((ref) => MockWordInputNotifier()),
      ],
    );

    // 内部的に書き換え
    final quizInfoTest = _quizInfoTest4(quizType);
    final quizInfoNotifier = container.read(quizInfoProvider(quizType).notifier)
      ..updateQuizInfo(quizInfoTest);

    final result = await quizInfoNotifier.refreshDailyQuiz();
    expect(result, isTrue);
    final quizInfo = container.read(quizInfoProvider(quizType)).value!;

    expect(quizInfo.quizType, quizInfoTest.quizType);
    expect(quizInfo.maxAnswer, quizInfoTest.maxAnswer);
    expect(quizInfo.answer, isNotNull);
    expect(quizInfo.quizProcess, QuizProcessType.started);
    expect(quizInfo.quizRange, quizInfoTest.quizRange);
    expect(quizInfo.playDate, generateDate());
    expect(quizInfo.seedText, quizInfoTest.seedText);

    // 連鎖数の変動に関連する処理
    verifyNever(mockStatisticsNotifier.startQuiz());
    verify(mockStatisticsNotifier.nextQuiz()).called(1);
  });

  test('startQuiz()', () async {
    const quizType = QuizTypes.endless;
    final mockQuizRepository = MockQuizRepository();
    when(mockQuizRepository.loadQuizInfo()).thenReturn(const QuizInfo());

    final mockWordInputNotifier = MockWordInputNotifier();
    final container = ProviderContainer(
      overrides: [
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
        quizRepositoryProvider(quizType).overrideWithValue(mockQuizRepository),
        statisticsProvider(quizType).overrideWith(
          (ref) => FakeStatisticsNotifier(const QuizStatistics()),
        ),
        wordInputNotifierProvider(quizType)
            .overrideWith((ref) => mockWordInputNotifier),
      ],
    );

    final quizInfoNotifier = container.read(quizInfoProvider(quizType).notifier)
      ..updateQuizInfo(_quizInfoTest(quizType));

    await quizInfoNotifier.startQuiz('ヒトカゲ', xy);
    final quizInfo = container.read(quizInfoProvider(quizType)).value!;
    expect(quizInfo.answer, isNotNull);
    expect(quizInfo.quizRange, xy);
    expect(quizInfo.seedText, 'ヒトカゲ');
    expect(quizInfo.quizProcess, QuizProcessType.started);

    verify(mockWordInputNotifier.reset()).called(1);
    verify(mockQuizRepository.saveQuizInfo(any)).called(1);
  });

  test('nextQuiz()', () async {
    const quizType = QuizTypes.endless;
    final mockQuizRepository = MockQuizRepository();
    when(mockQuizRepository.loadQuizInfo()).thenReturn(const QuizInfo());

    final fakeStatisticsNotifier =
        FakeStatisticsNotifier(const QuizStatistics());

    final mockWordInputNotifier = MockWordInputNotifier();
    final container = ProviderContainer(
      overrides: [
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
        quizRepositoryProvider(quizType).overrideWithValue(mockQuizRepository),
        statisticsProvider(quizType)
            .overrideWith((ref) => fakeStatisticsNotifier),
        wordInputNotifierProvider(quizType)
            .overrideWith((ref) => mockWordInputNotifier),
      ],
    );

    final quizInfoNotifier = container.read(quizInfoProvider(quizType).notifier)
      ..updateQuizInfo(_quizInfoTest(quizType));

    await quizInfoNotifier.nextQuiz();

    final quizInfo = container.read(quizInfoProvider(quizType)).value!;
    expect(quizInfo.answer, isNotNull);
    expect(quizInfo.quizRange, blackWhite);
    expect(quizInfo.seedText, 'ヒトカゲ');
    expect(quizInfo.quizProcess, QuizProcessType.started);

    expect(fakeStatisticsNotifier.nextQuizCalled, isTrue);
    verify(mockWordInputNotifier.reset()).called(1);
    verify(mockQuizRepository.saveQuizInfo(any)).called(1);
  });

  test('quitQuiz()', () async {
    const quizType = QuizTypes.endless;
    final mockQuizRepository = MockQuizRepository();
    when(mockQuizRepository.loadQuizInfo()).thenReturn(const QuizInfo());

    final fakeStatisticsNotifier =
        FakeStatisticsNotifier(const QuizStatistics());
    final mockQuizPageNotifier = MockQuizPageNotifier();

    final mockWordInputNotifier = MockWordInputNotifier();
    final container = ProviderContainer(
      overrides: [
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
        quizRepositoryProvider(quizType).overrideWithValue(mockQuizRepository),
        statisticsProvider(quizType)
            .overrideWith((ref) => fakeStatisticsNotifier),
        wordInputNotifierProvider(quizType)
            .overrideWith((ref) => mockWordInputNotifier),
        quizPageProvider(quizType).overrideWith((ref) => mockQuizPageNotifier),
      ],
    );

    final quizInfoNotifier = container.read(quizInfoProvider(quizType).notifier)
      ..updateQuizInfo(_quizInfoTest(quizType));

    await quizInfoNotifier.quitQuiz();

    final quizInfo = container.read(quizInfoProvider(quizType)).value!;
    expect(quizInfo.quizProcess, QuizProcessType.quit);

    expect(fakeStatisticsNotifier.finishQuizCalled, isTrue);
    verify(mockQuizRepository.saveQuizInfo(any)).called(1);
    verify(mockQuizPageNotifier.showResult()).called(1);
  });

  test('retireQuiz(endless)', () async {
    const quizType = QuizTypes.endless;
    final mockQuizRepository = MockQuizRepository();
    when(mockQuizRepository.loadQuizInfo()).thenReturn(const QuizInfo());

    final fakeStatisticsNotifier =
        FakeStatisticsNotifier(const QuizStatistics());
    final mockQuizPageNotifier = MockQuizPageNotifier();

    final mockWordInputNotifier = MockWordInputNotifier();
    final container = ProviderContainer(
      overrides: [
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
        quizRepositoryProvider(quizType).overrideWithValue(mockQuizRepository),
        statisticsProvider(quizType)
            .overrideWith((ref) => fakeStatisticsNotifier),
        wordInputNotifierProvider(quizType)
            .overrideWith((ref) => mockWordInputNotifier),
        quizPageProvider(quizType).overrideWith((ref) => mockQuizPageNotifier),
      ],
    );

    final quizInfoNotifier = container.read(quizInfoProvider(quizType).notifier)
      ..updateQuizInfo(_quizInfoTest(quizType));

    await quizInfoNotifier.retireQuiz();

    final quizInfo = container.read(quizInfoProvider(quizType)).value!;
    expect(quizInfo.quizProcess, QuizProcessType.failure);
  });

  test('retireQuiz(daily)', () async {
    const quizType = QuizTypes.daily;
    final mockQuizRepository = MockQuizRepository();
    when(mockQuizRepository.loadQuizInfo()).thenReturn(const QuizInfo());

    final fakeStatisticsNotifier =
        FakeStatisticsNotifier(const QuizStatistics());
    final mockQuizPageNotifier = MockQuizPageNotifier();

    final mockWordInputNotifier = MockWordInputNotifier();
    final container = ProviderContainer(
      overrides: [
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
        quizRepositoryProvider(quizType).overrideWithValue(mockQuizRepository),
        statisticsProvider(quizType)
            .overrideWith((ref) => fakeStatisticsNotifier),
        wordInputNotifierProvider(quizType)
            .overrideWith((ref) => mockWordInputNotifier),
        quizPageProvider(quizType).overrideWith((ref) => mockQuizPageNotifier),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    // ignore: invalid_use_of_visible_for_testing_member
    await container.read(quizInfoProvider(quizType).notifier).init();
    final quizInfoNotifier = container.read(quizInfoProvider(quizType).notifier)
      ..updateQuizInfo(_quizInfoTest(quizType));

    await quizInfoNotifier.retireQuiz();

    final quizInfo = container.read(quizInfoProvider(quizType)).value!;
    expect(quizInfo.quizProcess, QuizProcessType.failure);
  });

  test('updateQuiz(success/daily)', () async {
    const quizType = QuizTypes.daily;
    final mockQuizRepository = MockQuizRepository();
    when(mockQuizRepository.loadQuizInfo()).thenReturn(const QuizInfo());

    final fakeStatisticsNotifier =
        FakeStatisticsNotifier(const QuizStatistics());
    final mockQuizPageNotifier = MockQuizPageNotifier();

    // 正答状態を作る
    final fakeWordInputNotifier = FakeWordInputNotifier(
      const WordInput(
        inputIndex: 1,
        wordsResultList: [
          [
            WordNameState.match,
            WordNameState.match,
            WordNameState.match,
            WordNameState.match,
            WordNameState.match,
          ],
        ],
      ),
    );
    final container = ProviderContainer(
      overrides: [
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
        quizRepositoryProvider(quizType).overrideWithValue(mockQuizRepository),
        statisticsProvider(quizType)
            .overrideWith((ref) => fakeStatisticsNotifier),
        wordInputNotifierProvider(quizType)
            .overrideWith((ref) => fakeWordInputNotifier),
        quizPageProvider(quizType).overrideWith((ref) => mockQuizPageNotifier),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    // ignore: invalid_use_of_visible_for_testing_member
    await container.read(quizInfoProvider(quizType).notifier).init();
    final quizInfoNotifier = container.read(quizInfoProvider(quizType).notifier)
      ..updateQuizInfo(_quizInfoTest(quizType));

    await quizInfoNotifier.updateQuiz();

    final quizInfo = container.read(quizInfoProvider(quizType)).value!;
    expect(quizInfo.quizProcess, QuizProcessType.success);
  });

  test('updateQuiz(success/endless)', () async {
    const quizType = QuizTypes.endless;
    final mockQuizRepository = MockQuizRepository();
    when(mockQuizRepository.loadQuizInfo()).thenReturn(const QuizInfo());

    final fakeStatisticsNotifier =
        FakeStatisticsNotifier(const QuizStatistics());
    final mockQuizPageNotifier = MockQuizPageNotifier();

    // 正答状態を作る
    final fakeWordInputNotifier = FakeWordInputNotifier(
      const WordInput(
        inputIndex: 1,
        wordsResultList: [
          [
            WordNameState.match,
            WordNameState.match,
            WordNameState.match,
            WordNameState.match,
            WordNameState.match,
          ],
        ],
      ),
    );
    final container = ProviderContainer(
      overrides: [
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
        quizRepositoryProvider(quizType).overrideWithValue(mockQuizRepository),
        statisticsProvider(quizType)
            .overrideWith((ref) => fakeStatisticsNotifier),
        wordInputNotifierProvider(quizType)
            .overrideWith((ref) => fakeWordInputNotifier),
        quizPageProvider(quizType).overrideWith((ref) => mockQuizPageNotifier),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    // ignore: invalid_use_of_visible_for_testing_member
    await container.read(quizInfoProvider(quizType).notifier).init();
    final quizInfoNotifier = container.read(quizInfoProvider(quizType).notifier)
      ..updateQuizInfo(_quizInfoTest(quizType));

    await quizInfoNotifier.updateQuiz();

    final quizInfo = container.read(quizInfoProvider(quizType)).value!;
    expect(quizInfo.quizProcess, QuizProcessType.success);
  });

  test('updateQuiz(回答数オーバー)', () async {
    const quizType = QuizTypes.daily;
    final mockQuizRepository = MockQuizRepository();
    when(mockQuizRepository.loadQuizInfo()).thenReturn(const QuizInfo());

    final fakeStatisticsNotifier =
        FakeStatisticsNotifier(const QuizStatistics());
    final mockQuizPageNotifier = MockQuizPageNotifier();

    final resultList = <List<WordNameState>?>[];
    for (var i = 0; i < 10; i++) {
      resultList.add([]);
      for (var j = 0; j < 5; j++) {
        resultList[i]!.add(WordNameState.notMatch);
      }
    }

    // 失敗状態を作る（回答数オーバー）
    final fakeWordInputNotifier = FakeWordInputNotifier(
      WordInput(
        inputIndex: 10,
        wordsResultList: resultList,
      ),
    );

    final container = ProviderContainer(
      overrides: [
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
        quizRepositoryProvider(quizType).overrideWithValue(mockQuizRepository),
        statisticsProvider(quizType)
            .overrideWith((ref) => fakeStatisticsNotifier),
        wordInputNotifierProvider(quizType)
            .overrideWith((ref) => fakeWordInputNotifier),
        quizPageProvider(quizType).overrideWith((ref) => mockQuizPageNotifier),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    // ignore: invalid_use_of_visible_for_testing_member
    await container.read(quizInfoProvider(quizType).notifier).init();
    final quizInfoNotifier = container.read(quizInfoProvider(quizType).notifier)
      ..updateQuizInfo(_quizInfoTest(quizType));

    await quizInfoNotifier.updateQuiz();

    final quizInfo = container.read(quizInfoProvider(quizType)).value!;
    expect(quizInfo.quizProcess, QuizProcessType.failure);
  });
}

QuizInfo _quizInfoTest(QuizTypes quizType) {
  return QuizInfo(
    answer: const Monster(
      id: 0,
      name: 'フシギダネ',
    ),
    maxAnswer: 10,
    quizType: quizType,
    quizProcess: QuizProcessType.started,
    quizRange: blackWhite,
    playDate: generateDate(),
    seedText: 'ヒトカゲ',
  );
}

// generateDateを1日進めています。
QuizInfo _quizInfoTest2(QuizTypes quizType) {
  return QuizInfo(
    answer: const Monster(
      id: 0,
      name: 'フシギダネ',
    ),
    maxAnswer: 10,
    quizType: quizType,
    quizProcess: QuizProcessType.started,
    quizRange: blackWhite,
    playDate: generateDate() + 1,
    seedText: 'ヒトカゲ',
  );
}

/// quizProcessが成功状態
QuizInfo _quizInfoTest3(QuizTypes quizType) {
  return QuizInfo(
    answer: const Monster(
      id: 0,
      name: 'フシギダネ',
    ),
    maxAnswer: 10,
    quizType: quizType,
    quizProcess: QuizProcessType.success,
    quizRange: blackWhite,
    playDate: generateDate(),
    seedText: 'ヒトカゲ',
  );
}

/// generateDateが1日前、quizProcessが成功状態
QuizInfo _quizInfoTest4(QuizTypes quizType) {
  return QuizInfo(
    answer: const Monster(
      id: 0,
      name: 'フシギダネ',
    ),
    maxAnswer: 10,
    quizType: quizType,
    quizProcess: QuizProcessType.success,
    quizRange: blackWhite,
    playDate: generateDate() - 1,
    seedText: 'ヒトカゲ',
  );
}
