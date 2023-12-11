import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/logic/date_utils.dart';
import 'package:word_quiz/logic/quiz_info_utils.dart';
import 'package:word_quiz/logic/seed_generator.dart';
import 'package:word_quiz/model/monster_series.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_range.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/word_name_state.dart';
import 'package:word_quiz/provider/statistics_notifier.dart';
import 'package:word_quiz/provider/word_input_notifier.dart';
import 'package:word_quiz/repository/monster_list_repository.dart';
import 'package:word_quiz/repository/quiz/quiz_info_repository.dart';
import 'package:word_quiz/repository/quiz/word_input_repository.dart';

part 'quiz_info_notifier.g.dart';

/// 問題情報に関するNotifierです。
@riverpod
class QuizInfoNotifier extends _$QuizInfoNotifier {
  @override
  Future<QuizInfo> build(QuizTypes quizType) async {
    var quizInfo = await ref.watch(quizInfoRepositoryProvider(quizType).future);
    if (quizInfo != null) {
      return quizInfo;
    }

    // データが保存されていない場合
    switch (quizType) {
      case QuizTypes.daily:
        // きょうのもんだいは自動的に開始する
        final playDate = generateDate();
        quizInfo = QuizInfo(
          quizType: quizType,
          maxAnswer: defaultMaxAnswer,
          answer: await ref
              .read(monsterListRepositoryProvider.notifier)
              .pick(range: defaultQuizRange, seed: playDate),
          quizProcess: QuizProcessType.started,
          quizRange: defaultQuizRange,
          playDate: playDate,
        );
        await ref
            .read(statisticsNotifierProvider(quizType).notifier)
            .startQuiz();
      case QuizTypes.endless:
        // いっぱいやるモードは未開始状態にする
        quizInfo = QuizInfo(
          quizType: quizType,
          maxAnswer: 10,
        );
    }
    await ref
        .read(quizInfoRepositoryProvider(quizType).notifier)
        .saveQuizInfo(quizInfo);
    return quizInfo;
  }

  /// きょうのもんだいを自動的にリフレッシュします。
  Future<bool> refreshDailyQuiz() async {
    if (quizType != QuizTypes.daily) {
      return false;
    }

    if (state.valueOrNull == null) {
      return false;
    }

    // 問題が変わっていない場合はなにもしない
    if (!state.playDateChanged) {
      return false;
    }

    state = AsyncValue.data(await _refreshDailyQuiz(state.value!));

    return true;
  }

  /// 自動的にきょうのもんだいが変わっていれば更新します。
  Future<QuizInfo> _refreshDailyQuiz(QuizInfo quizInfo) async {
    var newQuizInfo = quizInfo;
    final today = generateDate();
    newQuizInfo = quizInfo.copyWith(
      answer: await ref
          .read(monsterListRepositoryProvider.notifier)
          .pick(range: defaultQuizRange, seed: today),
      quizProcess: QuizProcessType.started,
      playDate: today,
    );
    // 入力のリセット・クイズの開始・最新データに保存
    await ref
        .read(wordInputRepositoryProvider(quizType).notifier)
        .clearWordInput();
    // 解答に成功していたら連鎖を維持
    if (quizInfo.quizProcess == QuizProcessType.success) {
      await ref.read(statisticsNotifierProvider(quizType).notifier).nextQuiz();
    } else {
      await ref.read(statisticsNotifierProvider(quizType).notifier).startQuiz();
    }
    await ref
        .read(quizInfoRepositoryProvider(quizType).notifier)
        .saveQuizInfo(newQuizInfo);

    return newQuizInfo;
  }

  /// クイズを開始します。(いっぱいやるモードのみ使用)
  Future<void> startQuiz(String seedText, QuizRange quizRange) async {
    // 履歴情報の設定
    await ref.read(statisticsNotifierProvider(quizType).notifier).startQuiz();
    // 新しい答えを設定
    await _updateAnswer(quizRange, seedText);
    // 入力をリセット
    await ref
        .read(wordInputRepositoryProvider(quizType).notifier)
        .clearWordInput();
  }

  /// つぎのクイズを開始します。(いっぱいやるモードのみ使用)
  Future<void> nextQuiz() async {
    if (state.value?.quizRange == null) {
      return;
    }

    // 次の問題への進行を記録
    await ref.read(statisticsNotifierProvider(quizType).notifier).nextQuiz();

    // 新しい答えを設定
    await _updateAnswer(
      state.value?.quizRange ?? defaultQuizRange,
      state.value?.seedText ?? '',
    );

    // 入力をリセット
    await ref
        .read(wordInputRepositoryProvider(quizType).notifier)
        .clearWordInput();
  }

  /// 答えを設定します。(いっぱいやるモードのみ使用)
  Future<void> _updateAnswer(QuizRange quizRange, String seedText) async {
    // シードを生成
    final statistics =
        await ref.read(statisticsNotifierProvider(quizType).future);
    final seed = generateSeed(seedText, statistics.currentChain);
    state = AsyncValue.data(
      state.value!.copyWith(
        answer: await ref
            .read(monsterListRepositoryProvider.notifier)
            .pick(range: quizRange, seed: seed),
        quizRange: quizRange,
        seedText: seedText,
        quizProcess: QuizProcessType.started,
      ),
    );

    // QuizInfoの保存
    await ref
        .read(quizInfoRepositoryProvider(quizType).notifier)
        .saveQuizInfo(state.value);
  }

  /// 問題を終了します。
  Future<void> quitQuiz() async {
    // 失敗を記録
    await ref.read(statisticsNotifierProvider(quizType).notifier).finishQuiz();

    state = AsyncValue.data(
      state.value!.copyWith(
        quizProcess: QuizProcessType.quit,
      ),
    );

    // QuizInfoの保存
    await ref
        .read(quizInfoRepositoryProvider(quizType).notifier)
        .saveQuizInfo(state.value);
  }

  /// クイズからリタイアします。
  Future<void> retireQuiz() async {
    await _failureProcess();
  }

  /// QuizInfoの更新を行います。
  Future<bool?> updateQuiz() async {
    final wordInput =
        await ref.read(wordInputNotifierProvider(quizType).future);
    final currentIndex = wordInput.inputIndex;
    // 回答が1つでもある場合
    if (currentIndex >= 1) {
      final lastResultList = wordInput.wordsResultList[currentIndex - 1];
      // 正答している場合
      if (lastResultList != null &&
          lastResultList.every((element) => element == WordNameState.match)) {
        await _successProcess();
        return true;
      }
    }

    // 最大回答数を超えている場合
    if (state.value!.maxAnswer <= currentIndex) {
      await _failureProcess();
      return false;
    }

    return null;
  }

  /// 正解時の処理を行います。
  Future<void> _successProcess() async {
    // 成功を記録
    await ref.read(statisticsNotifierProvider(quizType).notifier).successQuiz();

    state = AsyncValue.data(
      state.value!.copyWith(
        quizProcess: QuizProcessType.success,
      ),
    );

    // QuizInfoの保存
    await ref
        .read(quizInfoRepositoryProvider(quizType).notifier)
        .saveQuizInfo(state.value);
  }

  /// 失敗時の処理を行います。
  Future<void> _failureProcess() async {
    // 終了を記録
    await ref.read(statisticsNotifierProvider(quizType).notifier).finishQuiz();

    state = AsyncValue.data(
      state.value!.copyWith(
        quizProcess: QuizProcessType.failure,
      ),
    );

    // QuizInfoの保存
    await ref
        .read(quizInfoRepositoryProvider(quizType).notifier)
        .saveQuizInfo(state.value);
  }
}

/// デフォルトの問題範囲
@visibleForTesting
const defaultQuizRange = diamondPearl;

/// 最大の回答数
const defaultMaxAnswer = 10;
