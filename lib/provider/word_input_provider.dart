import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/logic/keyboard_checker.dart';
import 'package:word_quiz/logic/word_checker.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/model/word_name_state.dart';
import 'package:word_quiz/provider/monster_list_provider.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/repository/quiz_repository.dart';

/// 文字入力のProvider
final wordInputNotifierProvider =
    StateNotifierProvider.family<WordInputNotifier, WordInput, QuizTypes>(
  WordInputNotifier.new,
);

/// 文字入力に関するStateNotifierです。
class WordInputNotifier extends StateNotifier<WordInput> {
  WordInputNotifier(
    this._ref,
    this._quizType,
  ) : super(
          const WordInput(
            wordsList: [[]],
            wordsResultList: [],
          ),
        ) {
    _init();
  }

  /// [Ref]
  final Ref _ref;

  /// [QuizTypes]
  final QuizTypes _quizType;

  /// 初期化を行います。
  void _init() {
    final quizRepository = _ref.read(quizRepositoryProvider(_quizType));
    final wordInput = quizRepository.loadWordInput() ??
        const WordInput(
          wordsList: [[]],
          wordsResultList: [],
        );

    state = wordInput;
  }

  /// 1文字入力します。
  void inputWord(String text) {
    if (state.isWordChecking) {
      return;
    }

    // 1文字以外は無視する
    if (text.length != 1) {
      return;
    }

    // すでに5文字の場合は無視する
    final currentInputWords = state.wordsList[state.inputIndex];
    if (currentInputWords!.length >= 5) {
      return;
    }

    // unmodifiableなのでリストを再生成
    final tmpWordsList = [...state.wordsList];
    tmpWordsList[state.inputIndex] = [...currentInputWords, text];

    state = state.copyWith(
      wordsList: tmpWordsList,
    );

    // WorInputの保存
    _ref.watch(quizRepositoryProvider(_quizType)).saveWordInput(state);
  }

  /// 1文字削除します。
  void deleteWord() {
    if (state.isWordChecking) {
      return;
    }

    // 入力がない場合は無視する
    final currentInputWords = state.wordsList[state.inputIndex];
    if (currentInputWords!.isEmpty) {
      return;
    }

    currentInputWords.removeLast();

    state = state.copyWith(
      wordsList: state.wordsList,
    );

    // WorInputの保存
    _ref.watch(quizRepositoryProvider(_quizType)).saveWordInput(state);
  }

  /// 確定を行います。
  Future<SubmitResult> submit() async {
    // 更新中は無視する
    if (state.isWordChecking) {
      return SubmitResult.skip;
    }

    final quizInfo = await _ref.read(quizInfoProvider(_quizType).future);

    // 回答が終了している場合
    if (quizInfo.quizProcess != QuizProcessType.started) {
      return SubmitResult.skip;
    }

    // チェック状態に変更
    state = state.copyWith(
      isWordChecking: true,
    );

    final currentInputWords = state.wordsList[state.inputIndex] ?? [];
    // 入力がない場合
    if (currentInputWords.isEmpty) {
      state = state.copyWith(
        isWordChecking: false,
      );
      return SubmitResult.noInput;
    }

    final monsterList = await _ref.read(monsterListProvider.future);
    // 入力のチェック
    final result = checkWord(monsterList, quizInfo, currentInputWords);
    // 存在しない場合
    if (result == null) {
      state = state.copyWith(
        isWordChecking: false,
      );
      return SubmitResult.unknownMonster;
    }

    // アニメーション用の入力結果リスト
    final animationWordResultList = [
      ...state.wordsResultList,
      <WordNameState>[]
    ];

    // 最終状態の入力結果リスト
    final nextWordsResultList = [
      ...state.wordsResultList,
      result.sublist(0, currentInputWords.length)
    ];

    // アニメーションよりも前に結果を保存する
    final nextState = state.copyWith(
      wordsList: [...state.wordsList, []],
      inputIndex: state.inputIndex + 1,
      wordsResultList: nextWordsResultList,
      isWordChecking: false,
      keyResultList: checkKeyboard(state.wordsList, nextWordsResultList),
    );
    await _ref
        .watch(quizRepositoryProvider(_quizType))
        .saveWordInput(nextState);

    // アニメーション用に徐々に更新する
    for (var i = 0; i < currentInputWords.length; i++) {
      animationWordResultList[state.inputIndex] = result.sublist(0, i + 1);

      state = state.copyWith(
        wordsResultList: animationWordResultList,
        keyResultList: checkKeyboard(state.wordsList, animationWordResultList),
      );
      await Future<void>.delayed(const Duration(milliseconds: 300));
    }

    state = nextState;

    return SubmitResult.success;
  }

  /// 入力のリセットを行います。
  void reset() {
    state = const WordInput(
      wordsList: [[]],
      wordsResultList: [],
    );
    // WorInputの保存
    _ref.watch(quizRepositoryProvider(_quizType)).saveWordInput(state);
  }
}

/// 確定を行った後の結果
enum SubmitResult {
  success,
  noInput,
  unknownMonster,
  skip,
}
