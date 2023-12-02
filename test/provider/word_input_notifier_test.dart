import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/logic/date_utils.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/model/word_keyboard_state.dart';
import 'package:word_quiz/model/word_name_state.dart';
import 'package:word_quiz/provider/word_input_notifier.dart';
import 'package:word_quiz/repository/monster_list_repository.dart';

import '../mock/fake_monster_list_repository.dart';
import '../mock/mock_box_data.dart';
import '../mock/monster_test_list.dart';

void main() {
  test('初期値が保存されていない場合', () async {
    const quizType = QuizTypes.daily;
    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType),
      ],
    );

    final wordInput =
        await container.read(wordInputNotifierProvider(quizType).future);
    expect(wordInput.wordsList, <List<String?>>[[]]);
    expect(wordInput.wordsResultList, <List<WordNameState>?>[]);
    expect(wordInput.keyResultList, <String, WordKeyboardInfo>{});
    expect(wordInput.inputIndex, 0);
  });

  test('初期値が保存されている場合', () async {
    const quizType = QuizTypes.daily;

    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType, wordInput: _wordInputTest),
      ],
    );

    final wordInput =
        await container.read(wordInputNotifierProvider(quizType).future);
    expect(wordInput, _wordInputTest);
  });

  test('inputWord(複数文字入力)', () async {
    const quizType = QuizTypes.daily;
    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType, wordInput: _wordInputTest),
      ],
    );

    await container
        .read(wordInputNotifierProvider(quizType).notifier)
        .inputWord('アイ');

    // 変わらない
    final wordInput =
        await container.read(wordInputNotifierProvider(quizType).future);
    expect(wordInput, _wordInputTest);
  });

  test('inputWord(すでに5文字入力)', () async {
    const quizType = QuizTypes.daily;
    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType, wordInput: _wordInputTest2),
      ],
    );

    await container
        .read(wordInputNotifierProvider(quizType).notifier)
        .inputWord('ア');

    // 変わらない
    final wordInput =
        await container.read(wordInputNotifierProvider(quizType).future);
    expect(wordInput, _wordInputTest2);
  });

  test('inputWord(入力可能状態)', () async {
    const quizType = QuizTypes.daily;
    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType, wordInput: _wordInputTest3),
      ],
    );

    await container
        .read(wordInputNotifierProvider(quizType).notifier)
        .inputWord('ア');
    final wordInput =
        await container.read(wordInputNotifierProvider(quizType).future);
    expect(wordInput.wordsList.last, ['テ', 'ス', 'ア']);
    expect(wordInput.wordsResultList, _wordInputTest3.wordsResultList);
    expect(wordInput.keyResultList, _wordInputTest3.keyResultList);
    expect(wordInput.inputIndex, _wordInputTest3.inputIndex);
  });

  test('deleteWord(文字入力なし)', () async {
    const quizType = QuizTypes.daily;
    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType, wordInput: _wordInputTest4),
      ],
    );

    await container
        .read(wordInputNotifierProvider(quizType).notifier)
        .deleteWord();
    final wordInput =
        await container.read(wordInputNotifierProvider(quizType).future);
    expect(wordInput, _wordInputTest4);
  });

  test('deleteWord(文字入力なし)', () async {
    const quizType = QuizTypes.daily;
    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType, wordInput: _wordInputTest3),
      ],
    );

    await container
        .read(wordInputNotifierProvider(quizType).notifier)
        .deleteWord();
    final wordInput =
        await container.read(wordInputNotifierProvider(quizType).future);
    expect(wordInput.wordsList.last, ['テ']);
    expect(wordInput.wordsResultList, _wordInputTest3.wordsResultList);
    expect(wordInput.keyResultList, _wordInputTest3.keyResultList);
    expect(wordInput.inputIndex, _wordInputTest3.inputIndex);
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

    // 初期化
    await container.read(wordInputNotifierProvider(quizType).future);

    final result = await container
        .read(wordInputNotifierProvider(quizType).notifier)
        .submit();
    expect(result, SubmitResult.skip);

    final wordInput =
        await container.read(wordInputNotifierProvider(quizType).future);
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

    // 初期化
    await container.read(wordInputNotifierProvider(quizType).future);

    final result = await container
        .read(wordInputNotifierProvider(quizType).notifier)
        .submit();
    expect(result, SubmitResult.noInput);

    final wordInput =
        await container.read(wordInputNotifierProvider(quizType).future);
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

    // 初期化
    await container.read(wordInputNotifierProvider(quizType).future);

    final result = await container
        .read(wordInputNotifierProvider(quizType).notifier)
        .submit();
    expect(result, SubmitResult.unknownMonster);

    final wordInput =
        await container.read(wordInputNotifierProvider(quizType).future);
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

    // 初期化
    await container.read(wordInputNotifierProvider(quizType).future);

    final result = await container
        .read(wordInputNotifierProvider(quizType).notifier)
        .submit();
    expect(result, SubmitResult.success);

    final wordInput =
        await container.read(wordInputNotifierProvider(quizType).future);
    expect(wordInput.wordsList.last, <String>[]);
    expect(wordInput.wordsResultList.last?.length, 5);
    expect(wordInput.keyResultList.length, 7);
    expect(wordInput.inputIndex, _wordInputTest5.inputIndex + 1);
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

    await container.read(wordInputNotifierProvider(quizType).notifier).reset();

    final wordInput =
        await container.read(wordInputNotifierProvider(quizType).future);
    expect(wordInput.wordsList, <List<String?>>[[]]);
    expect(wordInput.wordsResultList, <List<WordNameState>?>[]);
    expect(wordInput.keyResultList, <String, WordKeyboardInfo>{});
    expect(wordInput.inputIndex, 0);
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
