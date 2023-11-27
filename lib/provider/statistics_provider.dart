import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_statistics.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/repository/quiz/statistics_repository.dart';

/// クイズの成績などを扱います。
final statisticsProvider =
    StateNotifierProvider.family<StatisticsNotifier, QuizStatistics, QuizTypes>(
  StatisticsNotifier.new,
);

class StatisticsNotifier extends StateNotifier<QuizStatistics> {
  StatisticsNotifier(
    this._ref,
    this._quizType,
  ) : super(const QuizStatistics()) {
    init();
  }

  /// [Ref]
  final Ref _ref;

  /// [QuizTypes]
  final QuizTypes _quizType;

  /// 初期化を行います。
  @visibleForTesting
  Future<void> init() async {
    final wordInput =
        await _ref.read(statisticsRepositoryProvider(_quizType).future) ??
            const QuizStatistics();
    state = wordInput;
  }

  /// クイズ開始の情報を設定します。
  Future<void> startQuiz() async {
    state = state.copyWith(
      playCount: state.playCount + 1,
      currentChain: 0,
    );

    // Statisticsの保存
    await _ref
        .read(statisticsRepositoryProvider(_quizType).notifier)
        .saveStatistics(state);
  }

  /// つぎのクイズ開始の情報を設定します。
  Future<void> nextQuiz() async {
    state = state.copyWith(
      playCount: state.playCount + 1,
    );

    // Statisticsの保存
    await _ref
        .read(statisticsRepositoryProvider(_quizType).notifier)
        .saveStatistics(state);
  }

  /// クイズの成功を記録します。
  Future<void> successQuiz() async {
    final nextChain = state.currentChain + 1;
    state = state.copyWith(
      currentChain: nextChain,
      clearCount: state.clearCount + 1,
      maxChain: max(nextChain, state.maxChain),
    );

    // Statisticsの保存
    await _ref
        .read(statisticsRepositoryProvider(_quizType).notifier)
        .saveStatistics(state);
  }

  /// クイズの終了を記録します。(失敗とおわりにするケース)
  Future<void> finishQuiz() async {
    state = state.copyWith(
      currentChain: 0,
      lastChain: state.currentChain,
    );

    // Statisticsの保存
    await _ref
        .read(statisticsRepositoryProvider(_quizType).notifier)
        .saveStatistics(state);
  }
}
