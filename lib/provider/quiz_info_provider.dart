import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/logic/date_utils.dart';
import 'package:word_quiz/logic/seed_generator.dart';
import 'package:word_quiz/model/monster_series.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_range.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/word_name_state.dart';
import 'package:word_quiz/provider/monster_picker_provider.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/provider/statistics_provider.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/repository/quiz_repository.dart';

/// クイズ情報のProvider
final quizInfoProvider = StateNotifierProvider.family<QuizInfoNotifier,
    AsyncValue<QuizInfo>, QuizTypes>(QuizInfoNotifier.new);

/// クイズ情報に関するStateNotifierです。
class QuizInfoNotifier extends StateNotifier<AsyncValue<QuizInfo>> {
  QuizInfoNotifier(
    this._ref,
    this._quizType,
  ) : super(const AsyncValue.loading()) {
    init();
  }

  /// [Ref]
  final Ref _ref;

  /// [QuizTypes]
  final QuizTypes _quizType;

  /// デフォルトの問題範囲
  @visibleForTesting
  static const defaultQuizRange = diamondPearl;

  /// 初期化を行います。
  @visibleForTesting
  Future<void> init() async {
    final quizRepository = _ref.read(quizRepositoryProvider(_quizType));
    var quizInfo = quizRepository.loadQuizInfo();

    // データが保存されていない場合
    if (quizInfo == null) {
      switch (_quizType) {
        case QuizTypes.daily:
          // きょうのもんだいは自動的に開始する
          final playDate = generateDate();
          quizInfo = QuizInfo(
            quizType: _quizType,
            maxAnswer: 10,
            answer: await _ref
                .read(monsterPickerProvider)
                .pick(range: defaultQuizRange, seed: playDate),
            quizProcess: QuizProcessType.started,
            quizRange: defaultQuizRange,
            playDate: playDate,
          );
          _ref.watch(statisticsProvider(_quizType).notifier).startQuiz();
        case QuizTypes.endless:
          // いっぱいやるモードは未開始状態にする
          quizInfo = QuizInfo(
            quizType: _quizType,
            maxAnswer: 10,
          );
          // ignore: unnecessary_breaks
          break;
      }
      await quizRepository.saveQuizInfo(quizInfo);
    } else {
      // データが保存されている場合
      switch (_quizType) {
        case QuizTypes.daily:
          // 日付が変わっていたら今日の問題を自動的に更新する
          if (_playDateChanged(quizInfo)) {
            quizInfo = await _refreshDailyQuiz(quizInfo);
          }
        case QuizTypes.endless:
          // 特に何もしない
          break;
      }
    }

    state = AsyncValue.data(
      quizInfo,
    );

    // 答えが決まっていない場合(仕様上endlessのみ)
    if (state.value!.answer == null) {
      // 即時実行するとエラーが表示される場合があるため対応
      await Future.microtask(
        () => _ref
            .watch(quizPageProvider(_quizType).notifier)
            .showQuizSelection(),
      );
    }

    // きょうのもんだいが成功か失敗していたら統計画面を表示
    if (_quizType == QuizTypes.daily &&
        (state.value!.quizProcess == QuizProcessType.success ||
            state.value!.quizProcess == QuizProcessType.failure)) {
      await Future.microtask(
        () => _ref.watch(quizPageProvider(_quizType).notifier).showStatistics(),
      );
    }
  }

  /// きょうのもんだいを自動的にリフレッシュします。
  Future<bool> refreshDailyQuiz() async {
    if (_quizType != QuizTypes.daily) {
      return false;
    }

    if (state.value == null) {
      return false;
    }

    // 問題が変わっていない場合はなにもしない
    if (!_playDateChanged(state.value!)) {
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
      answer: await _ref
          .read(monsterPickerProvider)
          .pick(range: defaultQuizRange, seed: today),
      quizProcess: QuizProcessType.started,
      playDate: today,
    );
    // 入力のリセット・クイズの開始・最新データに保存
    _ref.watch(wordInputNotifierProvider(_quizType).notifier).reset();
    // 解答に成功していたら連鎖を維持
    if (quizInfo.quizProcess == QuizProcessType.success) {
      _ref.watch(statisticsProvider(_quizType).notifier).nextQuiz();
    } else {
      _ref.watch(statisticsProvider(_quizType).notifier).startQuiz();
    }
    await _ref
        .watch(quizRepositoryProvider(_quizType))
        .saveQuizInfo(newQuizInfo);
    // 新着問題への切り替え通知
    _ref.watch(quizPageProvider(_quizType).notifier).showQuizChanged();

    return newQuizInfo;
  }

  /// 問題が変わっているかをチェックします。
  bool _playDateChanged(QuizInfo quizInfo) {
    return quizInfo.playDate != generateDate();
  }

  /// クイズを開始します。(いっぱいやるモードのみ使用)
  Future<void> startQuiz(String seedText, QuizRange quizRange) async {
    // 履歴情報の設定
    _ref.watch(statisticsProvider(_quizType).notifier).startQuiz();
    // 新しい答えを設定
    await _updateAnswer(quizRange, seedText);
    // 入力をリセット
    _ref.watch(wordInputNotifierProvider(_quizType).notifier).reset();
  }

  /// つぎのクイズを開始します。(いっぱいやるモードのみ使用)
  Future<void> nextQuiz() async {
    if (state.value?.quizRange == null) {
      return;
    }

    // 次の問題への進行を記録
    _ref.watch(statisticsProvider(_quizType).notifier).nextQuiz();

    // 新しい答えを設定
    await _updateAnswer(
      state.value?.quizRange ?? defaultQuizRange,
      state.value?.seedText ?? '',
    );

    // 入力をリセット
    _ref.watch(wordInputNotifierProvider(_quizType).notifier).reset();
  }

  /// 答えを設定します。(いっぱいやるモードのみ使用)
  Future<void> _updateAnswer(QuizRange quizRange, String seedText) async {
    // シードを生成
    final statistics = _ref.read(statisticsProvider(_quizType));
    final seed = generateSeed(seedText, statistics.currentChain);
    state = AsyncValue.data(
      state.value!.copyWith(
        answer: await _ref
            .read(monsterPickerProvider)
            .pick(range: quizRange, seed: seed),
        quizRange: quizRange,
        seedText: seedText,
        quizProcess: QuizProcessType.started,
      ),
    );

    // QuizInfoの保存
    await _ref
        .watch(quizRepositoryProvider(_quizType))
        .saveQuizInfo(state.value);
  }

  /// 問題を終了します。
  Future<void> quitQuiz() async {
    // 失敗を記録
    _ref.watch(statisticsProvider(_quizType).notifier).finishQuiz();

    state = AsyncValue.data(
      state.value!.copyWith(
        quizProcess: QuizProcessType.quit,
      ),
    );

    // QuizInfoの保存
    await _ref
        .watch(quizRepositoryProvider(_quizType))
        .saveQuizInfo(state.value);

    // 結果を表示
    _ref.watch(quizPageProvider(_quizType).notifier).showResult();
  }

  /// クイズからリタイアします。
  Future<void> retireQuiz() async {
    await _failureProcess();
  }

  /// QuizInfoの更新を行います。
  Future<void> updateQuiz() async {
    final wordInput = _ref.read(wordInputNotifierProvider(_quizType));
    final currentIndex = wordInput.inputIndex;
    // 回答が1つでもある場合
    if (currentIndex >= 1) {
      final lastResultList = wordInput.wordsResultList[currentIndex - 1];
      // 正答している場合
      if (lastResultList != null &&
          lastResultList.every((element) => element == WordNameState.match)) {
        await _successProcess();
        return;
      }
    }

    // 最大回答数を超えている場合
    if (state.value!.maxAnswer <= currentIndex) {
      await _failureProcess();
    }
  }

  /// 正解時の処理を行います。
  Future<void> _successProcess() async {
    // 成功を記録
    _ref.watch(statisticsProvider(_quizType).notifier).successQuiz();

    state = AsyncValue.data(
      state.value!.copyWith(
        quizProcess: QuizProcessType.success,
      ),
    );

    // QuizInfoの保存
    await _ref
        .watch(quizRepositoryProvider(_quizType))
        .saveQuizInfo(state.value);

    // 正解のケース
    switch (_quizType) {
      case QuizTypes.daily:
        _ref.watch(quizPageProvider(_quizType).notifier).showStatistics();
      case QuizTypes.endless:
        _ref.watch(quizPageProvider(_quizType).notifier).showResult();
    }
  }

  /// 失敗時の処理を行います。
  Future<void> _failureProcess() async {
    // 終了を記録
    _ref.watch(statisticsProvider(_quizType).notifier).finishQuiz();

    state = AsyncValue.data(
      state.value!.copyWith(
        quizProcess: QuizProcessType.failure,
      ),
    );

    // QuizInfoの保存
    await _ref
        .watch(quizRepositoryProvider(_quizType))
        .saveQuizInfo(state.value);

    // 回答>2秒待ち>結果を表示
    _ref.watch(quizPageProvider(_quizType).notifier).showAnswer();
    await Future<void>.delayed(const Duration(milliseconds: 2000));

    // 事後処理
    switch (_quizType) {
      case QuizTypes.daily:
        // 統計を表示
        _ref.watch(quizPageProvider(_quizType).notifier).showStatistics();
      case QuizTypes.endless:
        // 結果を表示
        _ref.watch(quizPageProvider(_quizType).notifier).showResult();
    }
  }

  /// テスト用の[QuizInfo]を設定します。
  @visibleForTesting
  void updateQuizInfo(QuizInfo quizInfo) {
    state = AsyncValue.data(quizInfo);
  }
}
