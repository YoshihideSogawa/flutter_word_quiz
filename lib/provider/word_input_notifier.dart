import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/logic/keyboard_checker.dart';
import 'package:word_quiz/logic/word_checker.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/provider/quiz_info_notifier.dart';
import 'package:word_quiz/repository/monster_list_repository.dart';
import 'package:word_quiz/repository/quiz/word_input_repository.dart';

part 'word_input_notifier.g.dart';

/// 文字入力に関する処理を行います。
@riverpod
class WordInputNotifier extends _$WordInputNotifier {
  @override
  Future<WordInput> build(QuizTypes quizType) async {
    final wordInput =
        await ref.watch(wordInputRepositoryProvider(quizType).future);

    return wordInput ?? const WordInput(wordsList: [[]]);
  }

  /// 1文字入力します。
  Future<void> inputWord(String text) async {
    // TODO(sogawa): 暫定対応
    await future;

    // 1文字以外は無視する
    if (text.length != 1) {
      return;
    }

    final wordInput = state.value!;
    // すでに5文字の場合は無視する
    final currentInputWords = wordInput.wordsList[wordInput.inputIndex];
    if (currentInputWords!.length >= 5) {
      return;
    }

    // unmodifiableなのでリストを再生成
    final tmpWordsList = [...wordInput.wordsList];
    tmpWordsList[wordInput.inputIndex] = [...currentInputWords, text];

    final newValue = wordInput.copyWith(
      wordsList: tmpWordsList,
    );

    // WorInputの保存
    await ref
        .read(wordInputRepositoryProvider(quizType).notifier)
        .saveWordInput(newValue);
  }

  /// 1文字削除します。
  Future<void> deleteWord() async {
    // TODO(sogawa): 暫定対応
    await future;
    final wordInput = state.value!;

    // 入力がない場合は無視する
    final currentInputWords = wordInput.wordsList[wordInput.inputIndex];
    if (currentInputWords!.isEmpty) {
      return;
    }

    currentInputWords.removeLast();

    final newValue = wordInput.copyWith(
      wordsList: wordInput.wordsList,
    );

    // WorInputの保存
    await ref
        .read(wordInputRepositoryProvider(quizType).notifier)
        .saveWordInput(newValue);
  }

  /// 確定を行います。
  Future<SubmitResult> submit() async {
    final wordInput = state.value!;
    final quizInfo = await ref.read(quizInfoNotifierProvider(quizType).future);

    // 回答が終了している場合
    if (quizInfo.quizProcess != QuizProcessType.started) {
      return SubmitResult.skip;
    }

    final currentInputWords = wordInput.wordsList[wordInput.inputIndex] ?? [];
    // 入力がない場合
    if (currentInputWords.isEmpty) {
      return SubmitResult.noInput;
    }

    final monsterList = await ref.read(monsterListRepositoryProvider.future);
    // 入力のチェック
    final result = checkWord(monsterList, quizInfo, currentInputWords);
    // 存在しない場合
    if (result == null) {
      return SubmitResult.unknownMonster;
    }

    // 最終状態の入力結果リスト
    final nextWordsResultList = [
      ...wordInput.wordsResultList,
      result.sublist(0, currentInputWords.length),
    ];

    // マッチ結果
    final nextState = wordInput.copyWith(
      wordsList: [...wordInput.wordsList, []],
      inputIndex: wordInput.inputIndex + 1,
      wordsResultList: nextWordsResultList,
      keyResultList: checkKeyboard(wordInput.wordsList, nextWordsResultList),
    );
    await ref
        .read(wordInputRepositoryProvider(quizType).notifier)
        .saveWordInput(nextState);

    return SubmitResult.success;
  }
}

/// 確定を行った後の結果
enum SubmitResult {
  success,
  noInput,
  unknownMonster,
  skip,
}
