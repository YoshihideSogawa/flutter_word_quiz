import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/logic/date_utils.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/model/word_keyboard_state.dart';
import 'package:word_quiz/model/word_name_state.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/repository/monster_list_repository.dart';

import '../mock/fake_monster_list_repository.dart';
import '../mock/mock_box_data.dart';
import '../mock/monster_test_list.dart';

void main() {
  test('初期値が保存されていない場合', () {
    const quizType = QuizTypes.daily;
    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType),
      ],
    );

    final wordInput = container.read(wordInputNotifierProvider(quizType));
    expect(wordInput.wordsList, <List<String?>>[[]]);
    expect(wordInput.wordsResultList, <List<WordNameState>?>[]);
    expect(wordInput.keyResultList, <String, WordKeyboardInfo>{});
    expect(wordInput.inputIndex, 0);
    expect(wordInput.isWordChecking, isFalse);
  });

  test('初期値が保存されている場合', () async {
    const quizType = QuizTypes.daily;

    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType, wordInput: _wordInputTest),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    await container.read(wordInputNotifierProvider(quizType).notifier).init();
    final wordInput = container.read(wordInputNotifierProvider(quizType));
    expect(wordInput, _wordInputTest);
  });

  test('inputWord(文字入力チェック中)', () async {
    const quizType = QuizTypes.daily;

    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType, wordInput: _wordInputTest),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    await container.read(wordInputNotifierProvider(quizType).notifier).init();
    await container
        .read(wordInputNotifierProvider(quizType).notifier)
        .inputWord('ア');
    final wordInput = container.read(wordInputNotifierProvider(quizType));

    // 変わらない
    expect(wordInput, _wordInputTest);
  });

  test('inputWord(複数文字入力)', () async {
    const quizType = QuizTypes.daily;
    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType, wordInput: _wordInputTest),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    await container.read(wordInputNotifierProvider(quizType).notifier).init();
    await container
        .read(wordInputNotifierProvider(quizType).notifier)
        .inputWord('アイ');
    final wordInput = container.read(wordInputNotifierProvider(quizType));

    // 変わらない
    expect(wordInput, _wordInputTest);
  });

  test('inputWord(すでに5文字入力)', () async {
    const quizType = QuizTypes.daily;
    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType, wordInput: _wordInputTest2),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    await container.read(wordInputNotifierProvider(quizType).notifier).init();
    await container
        .read(wordInputNotifierProvider(quizType).notifier)
        .inputWord('ア');
    final wordInput = container.read(wordInputNotifierProvider(quizType));

    // 変わらない
    expect(wordInput, _wordInputTest2);
  });

  test('inputWord(入力可能状態)', () async {
    const quizType = QuizTypes.daily;
    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType, wordInput: _wordInputTest3),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    await container.read(wordInputNotifierProvider(quizType).notifier).init();
    await container
        .read(wordInputNotifierProvider(quizType).notifier)
        .inputWord('ア');
    final wordInput = container.read(wordInputNotifierProvider(quizType));
    expect(wordInput.wordsList.last, ['テ', 'ス', 'ア']);
    expect(wordInput.wordsResultList, _wordInputTest3.wordsResultList);
    expect(wordInput.keyResultList, _wordInputTest3.keyResultList);
    expect(wordInput.inputIndex, _wordInputTest3.inputIndex);
    expect(wordInput.isWordChecking, _wordInputTest3.isWordChecking);
  });

  test('deleteWord(isWordChecking)', () async {
    const quizType = QuizTypes.daily;
    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType, wordInput: _wordInputTest),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    await container.read(wordInputNotifierProvider(quizType).notifier).init();
    await container
        .read(wordInputNotifierProvider(quizType).notifier)
        .deleteWord();
    final wordInput = container.read(wordInputNotifierProvider(quizType));
    expect(wordInput, _wordInputTest);
  });

  test('deleteWord(文字入力なし)', () async {
    const quizType = QuizTypes.daily;
    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType, wordInput: _wordInputTest4),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    await container.read(wordInputNotifierProvider(quizType).notifier).init();
    await container
        .read(wordInputNotifierProvider(quizType).notifier)
        .deleteWord();
    final wordInput = container.read(wordInputNotifierProvider(quizType));
    expect(wordInput, _wordInputTest4);
  });

  test('deleteWord(文字入力なし)', () async {
    const quizType = QuizTypes.daily;
    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType, wordInput: _wordInputTest3),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    await container.read(wordInputNotifierProvider(quizType).notifier).init();
    await container
        .read(wordInputNotifierProvider(quizType).notifier)
        .deleteWord();
    final wordInput = container.read(wordInputNotifierProvider(quizType));
    expect(wordInput.wordsList.last, ['テ']);
    expect(wordInput.wordsResultList, _wordInputTest3.wordsResultList);
    expect(wordInput.keyResultList, _wordInputTest3.keyResultList);
    expect(wordInput.inputIndex, _wordInputTest3.inputIndex);
    expect(wordInput.isWordChecking, _wordInputTest3.isWordChecking);
  });

  test('submit(isWordChecking)', () async {
    const quizType = QuizTypes.daily;
    final quizInfo = QuizInfo(
      answer: monsterTestList[0],
      quizProcess: QuizProcessType.started,
    );

    final container = ProviderContainer(
      overrides: [
        quizOverride(
          quizType: quizType,
          wordInput: _wordInputTest,
          quizInfo: quizInfo,
        ),
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    await container.read(wordInputNotifierProvider(quizType).notifier).init();
    final result = await container
        .read(wordInputNotifierProvider(quizType).notifier)
        .submit();
    expect(result, SubmitResult.skip);

    final wordInput = container.read(wordInputNotifierProvider(quizType));
    expect(wordInput, _wordInputTest);
  });

  test('submit(終了している)', () async {
    const quizType = QuizTypes.daily;
    final quizInfo = QuizInfo(
      answer: monsterTestList[0],
      quizProcess: QuizProcessType.failure,
      playDate: generateDate(),
    );

    final container = ProviderContainer(
      overrides: [
        quizOverride(
          quizType: quizType,
          wordInput: _wordInputTest5,
          quizInfo: quizInfo,
        ),
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    await container.read(wordInputNotifierProvider(quizType).notifier).init();
    final result = await container
        .read(wordInputNotifierProvider(quizType).notifier)
        .submit();
    expect(result, SubmitResult.skip);

    final wordInput = container.read(wordInputNotifierProvider(quizType));
    expect(wordInput, _wordInputTest5);
  });

  test('submit(入力なし)', () async {
    const quizType = QuizTypes.daily;
    final quizInfo = QuizInfo(
      answer: monsterTestList[0],
      quizProcess: QuizProcessType.started,
      playDate: generateDate(),
    );

    final container = ProviderContainer(
      overrides: [
        quizOverride(
          quizType: quizType,
          quizInfo: quizInfo,
          wordInput: _wordInputTest4,
        ),
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    await container.read(wordInputNotifierProvider(quizType).notifier).init();
    final result = await container
        .read(wordInputNotifierProvider(quizType).notifier)
        .submit();
    expect(result, SubmitResult.noInput);

    final wordInput = container.read(wordInputNotifierProvider(quizType));
    expect(wordInput.isWordChecking, isFalse);
    expect(wordInput, _wordInputTest4);
  });

  test('submit(存在しない)', () async {
    const quizType = QuizTypes.daily;
    final quizInfo = QuizInfo(
      answer: monsterTestList[0],
      quizProcess: QuizProcessType.started,
      playDate: generateDate(),
    );

    final container = ProviderContainer(
      overrides: [
        quizOverride(
          quizType: quizType,
          quizInfo: quizInfo,
          wordInput: _wordInputTest3,
        ),
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    await container.read(wordInputNotifierProvider(quizType).notifier).init();
    final result = await container
        .read(wordInputNotifierProvider(quizType).notifier)
        .submit();
    expect(result, SubmitResult.unknownMonster);

    final wordInput = container.read(wordInputNotifierProvider(quizType));
    expect(wordInput.isWordChecking, isFalse);
    expect(wordInput, _wordInputTest3);
  });

  test('submit(成功)', () async {
    const quizType = QuizTypes.daily;
    final quizInfo = QuizInfo(
      answer: monsterTestList[0],
      quizProcess: QuizProcessType.started,
      playDate: generateDate(),
    );

    final container = ProviderContainer(
      overrides: [
        quizOverride(
          quizType: quizType,
          quizInfo: quizInfo,
          wordInput: _wordInputTest5,
        ),
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    await container.read(wordInputNotifierProvider(quizType).notifier).init();
    final result = await container
        .read(wordInputNotifierProvider(quizType).notifier)
        .submit();
    expect(result, SubmitResult.success);

    final wordInput = container.read(wordInputNotifierProvider(quizType));
    expect(wordInput.wordsList.last, <String>[]);
    expect(wordInput.wordsResultList.last?.length, 5);
    expect(wordInput.keyResultList.length, 7);
    expect(wordInput.inputIndex, _wordInputTest5.inputIndex + 1);
    expect(wordInput.isWordChecking, isFalse);
  });

  test('reset()', () async {
    const quizType = QuizTypes.daily;
    final container = ProviderContainer(
      overrides: [
        quizOverride(
          quizType: quizType,
          wordInput: _wordInputTest5,
        ),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    await container.read(wordInputNotifierProvider(quizType).notifier).init();
    await container.read(wordInputNotifierProvider(quizType).notifier).reset();

    final wordInput = container.read(wordInputNotifierProvider(quizType));
    expect(wordInput.wordsList, <List<String?>>[[]]);
    expect(wordInput.wordsResultList, <List<WordNameState>?>[]);
    expect(wordInput.keyResultList, <String, WordKeyboardInfo>{});
    expect(wordInput.inputIndex, 0);
    expect(wordInput.isWordChecking, isFalse);
  });
}

/// isWordChecking true /文字入力あり
const _wordInputTest = WordInput(
  wordsList: <InputWords>[
    ['テ', 'ス', 'ト'],
    ['テ'],
  ],
  wordsResultList: <WordResults>[
    [WordNameState.notMatch, WordNameState.notMatch, WordNameState.match],
  ],
  keyResultList: <String, WordKeyboardInfo>{
    'テ': WordKeyboardInfo.notMatch,
    'ス': WordKeyboardInfo.notMatch,
    'ト': WordKeyboardInfo.match,
  },
  inputIndex: 1,
  isWordChecking: true,
);

// すでに5文字に入力
const _wordInputTest2 = WordInput(
  wordsList: <InputWords>[
    ['テ', 'ス', 'ト'],
    ['テ', 'ス', 'ト', 'で', 'す'],
  ],
  wordsResultList: <WordResults>[
    [WordNameState.notMatch, WordNameState.notMatch, WordNameState.match],
  ],
  keyResultList: <String, WordKeyboardInfo>{
    'テ': WordKeyboardInfo.notMatch,
    'ス': WordKeyboardInfo.notMatch,
    'ト': WordKeyboardInfo.match,
  },
  inputIndex: 1,
);

// 2文字入力
final _wordInputTest3 = WordInput(
  wordsList: <InputWords>[
    ['テ', 'ス', 'ト'],
    ['テ', 'ス'],
  ].toList(growable: true),
  wordsResultList: <WordResults>[
    [WordNameState.notMatch, WordNameState.notMatch, WordNameState.match],
  ],
  keyResultList: <String, WordKeyboardInfo>{
    'テ': WordKeyboardInfo.notMatch,
    'ス': WordKeyboardInfo.notMatch,
    'ト': WordKeyboardInfo.match,
  },
  inputIndex: 1,
);

// 入力なし
const _wordInputTest4 = WordInput(
  wordsList: <InputWords>[
    ['テ', 'ス', 'ト'],
    [],
  ],
  wordsResultList: <WordResults>[
    [WordNameState.notMatch, WordNameState.notMatch, WordNameState.match],
  ],
  keyResultList: <String, WordKeyboardInfo>{
    'テ': WordKeyboardInfo.notMatch,
    'ス': WordKeyboardInfo.notMatch,
    'ト': WordKeyboardInfo.match,
  },
  inputIndex: 1,
);

// submitが成功するパターン
final _wordInputTest5 = WordInput(
  wordsList: <InputWords>[
    ['ル', 'リ', 'リ'],
    ['フ', 'シ', 'ギ', 'ダ', 'ネ'],
  ].toList(growable: true),
  wordsResultList: <WordResults>[
    [WordNameState.notMatch, WordNameState.notMatch, WordNameState.match],
  ],
  keyResultList: <String, WordKeyboardInfo>{
    'ル': WordKeyboardInfo.notMatch,
    'リ': WordKeyboardInfo.notMatch,
  },
  inputIndex: 1,
);
