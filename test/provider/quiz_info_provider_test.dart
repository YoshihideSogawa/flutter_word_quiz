import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
import 'package:word_quiz/provider/word_input_notifier.dart';
import 'package:word_quiz/repository/monster_list_repository.dart';

import '../mock/fake_monster_list_repository.dart';
import '../mock/mock_box_data.dart';

void main() {
  test('初期化(daily)', () async {
    const quizType = QuizTypes.daily;
    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType),
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
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
    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType),
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
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

    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType, quizInfo: initQuizInfo),
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
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
    final initQuizInfo = _quizInfoTest2(quizType);

    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType, quizInfo: initQuizInfo),
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
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

  test('保存データあり(endless)', () async {
    const quizType = QuizTypes.endless;
    final initQuizInfo = _quizInfoTest(quizType);

    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType, quizInfo: initQuizInfo),
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
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
    final quizInfoTest = _quizInfoTest2(quizType);
    final quizOverrideBox = quizOverrideAndBox(
      quizType: quizType,
      quizInfo: _quizInfoTest(quizType),
    );

    final container = ProviderContainer(
      overrides: [
        quizOverrideBox.override,
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
      ],
    );

    // TODO(sogawa): init/updateQuizInfoを直接呼び出さないように書き換える
    // 内部的に書き換え
    final notifier = container.read(quizInfoProvider(quizType).notifier);
    await notifier.init();
    notifier.updateQuizInfo(quizInfoTest);
    final result = await notifier.refreshDailyQuiz();
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
    final quizStatistics = parseQuizStatistics(quizOverrideBox.box);
    expect(quizStatistics?.playCount, 1);
  });

  test('refreshDailyQuiz(QuizProcess.success)', () async {
    const quizType = QuizTypes.daily;
    final quizOverrideBox = quizOverrideAndBox(
      quizType: quizType,
      quizInfo: _quizInfoTest(quizType),
    );

    final container = ProviderContainer(
      overrides: [
        quizOverrideBox.override,
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
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
    final quizStatistics = parseQuizStatistics(quizOverrideBox.box);
    expect(quizStatistics?.playCount, 1);
  });

  test('startQuiz()', () async {
    const quizType = QuizTypes.endless;
    final quizOverrideBox = quizOverrideAndBox(
      quizType: quizType,
      quizInfo: _quizInfoTest(quizType),
    );
    final container = ProviderContainer(
      overrides: [
        quizOverrideBox.override,
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
      ],
    );

    // 問題の開始
    // TODO(sogawa): initを呼び出さないようにあとで直す
    await container.read(quizInfoProvider(quizType).notifier).init();
    await container
        .read(quizInfoProvider(quizType).notifier)
        .startQuiz('ヒトカゲ', xy);

    final quizInfo = container.read(quizInfoProvider(quizType)).value!;
    expect(quizInfo.answer, isNotNull);
    expect(quizInfo.quizRange, xy);
    expect(quizInfo.seedText, 'ヒトカゲ');
    expect(quizInfo.quizProcess, QuizProcessType.started);

    final wordInput = parseWordInput(quizOverrideBox.box);
    expect(wordInput, wordInputInitValue);
  });

  test('nextQuiz()', () async {
    const quizType = QuizTypes.endless;
    final quizOverrideBox = quizOverrideAndBox(
      quizType: quizType,
      quizInfo: _quizInfoTest(quizType),
    );
    final container = ProviderContainer(
      overrides: [
        quizOverrideBox.override,
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
      ],
    );

    // 問題の開始
    // TODO(sogawa): initを呼び出さないようにあとで直す
    await container.read(quizInfoProvider(quizType).notifier).init();
    await container.read(quizInfoProvider(quizType).notifier).nextQuiz();

    final quizInfo = container.read(quizInfoProvider(quizType)).value!;
    expect(quizInfo.answer, isNotNull);
    expect(quizInfo.quizRange, blackWhite);
    expect(quizInfo.seedText, 'ヒトカゲ');
    expect(quizInfo.quizProcess, QuizProcessType.started);

    final quizStatistics = parseQuizStatistics(quizOverrideBox.box);
    expect(quizStatistics?.playCount, 1);

    final wordInput = parseWordInput(quizOverrideBox.box);
    expect(wordInput, wordInputInitValue);
  });

  test('quitQuiz()', () async {
    const quizType = QuizTypes.endless;
    final quizOverrideBox = quizOverrideAndBox(
      quizType: quizType,
      quizInfo: _quizInfoTest(quizType),
    );
    final container = ProviderContainer(
      overrides: [
        quizOverrideBox.override,
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
      ],
    );

    // 問題の開始
    // TODO(sogawa): initを呼び出さないようにあとで直す
    await container.read(quizInfoProvider(quizType).notifier).init();
    await container.read(quizInfoProvider(quizType).notifier).quitQuiz();

    final quizInfo = container.read(quizInfoProvider(quizType)).value!;
    expect(quizInfo.quizProcess, QuizProcessType.quit);

    final quizInfoData = parseQuizInfo(quizOverrideBox.box);
    expect(quizInfoData?.quizProcess, QuizProcessType.quit);
  });

  test('retireQuiz(endless)', () async {
    const quizType = QuizTypes.endless;
    final container = ProviderContainer(
      overrides: [
        quizOverride(
          quizType: quizType,
          quizInfo: _quizInfoTest(quizType),
        ),
        quizOverride(quizType: quizType, quizInfo: const QuizInfo()),
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
      ],
    );

    // 問題の開始
    // TODO(sogawa): initを呼び出さないようにあとで直す
    await container.read(quizInfoProvider(quizType).notifier).init();
    await container.read(quizInfoProvider(quizType).notifier).retireQuiz();

    final quizInfo = container.read(quizInfoProvider(quizType)).value!;
    expect(quizInfo.quizProcess, QuizProcessType.failure);
  });

  test('retireQuiz(daily)', () async {
    const quizType = QuizTypes.daily;
    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType, quizInfo: _quizInfoTest(quizType)),
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    await container.read(quizInfoProvider(quizType).notifier).init();
    await container.read(quizInfoProvider(quizType).notifier).retireQuiz();

    final quizInfo = container.read(quizInfoProvider(quizType)).value!;
    expect(quizInfo.quizProcess, QuizProcessType.failure);
  });

  test('updateQuiz(success/daily)', () async {
    const quizType = QuizTypes.daily;
    const wordInput = WordInput(
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
    );

    final container = ProviderContainer(
      overrides: [
        quizOverride(
          quizType: quizType,
          quizInfo: _quizInfoTest(quizType),
          wordInput: wordInput,
          statistics: const QuizStatistics(),
        ),
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    // ignore: invalid_use_of_visible_for_testing_member
    await container.read(quizInfoProvider(quizType).notifier).init();
    await container.read(quizInfoProvider(quizType).notifier).updateQuiz();

    final quizInfo = container.read(quizInfoProvider(quizType)).value!;
    expect(quizInfo.quizProcess, QuizProcessType.success);
  });

  test('updateQuiz(success/endless)', () async {
    const quizType = QuizTypes.endless;
    const wordInput = WordInput(
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
    );

    final container = ProviderContainer(
      overrides: [
        quizOverride(
          quizType: quizType,
          quizInfo: _quizInfoTest(quizType),
          wordInput: wordInput,
          statistics: const QuizStatistics(),
        ),
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    await container.read(quizInfoProvider(quizType).notifier).init();
    await container.read(quizInfoProvider(quizType).notifier).updateQuiz();

    final quizInfo = container.read(quizInfoProvider(quizType)).value!;
    expect(quizInfo.quizProcess, QuizProcessType.success);
  });

  test('updateQuiz(回答数オーバー)', () async {
    const quizType = QuizTypes.daily;
    final resultList = <List<WordNameState>?>[];
    for (var i = 0; i < 10; i++) {
      resultList.add([]);
      for (var j = 0; j < 5; j++) {
        resultList[i]!.add(WordNameState.notMatch);
      }
    }

    // 失敗状態を作る（回答数オーバー）
    final wordInput = WordInput(
      inputIndex: 10,
      wordsResultList: resultList,
    );

    final container = ProviderContainer(
      overrides: [
        quizOverride(
          quizType: quizType,
          quizInfo: _quizInfoTest(quizType),
          wordInput: wordInput,
          statistics: const QuizStatistics(),
        ),
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    // ignore: invalid_use_of_visible_for_testing_member
    await container.read(quizInfoProvider(quizType).notifier).init();
    await container.read(quizInfoProvider(quizType).notifier).updateQuiz();

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
