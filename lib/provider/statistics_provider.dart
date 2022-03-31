import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_statistics.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/repository/quiz_repository.dart';

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
  void init() {
    final quizRepository = _ref.read(quizRepositoryProvider(_quizType));
    final wordInput = quizRepository.loadStatistics() ?? const QuizStatistics();
    state = wordInput;
  }

  /// クイズ開始の情報を設定します。
  void startQuiz() {
    state = state.copyWith(
      playCount: state.playCount + 1,
      currentChain: 0,
    );

    // Statisticsの保存
    _ref.watch(quizRepositoryProvider(_quizType)).saveStatistics(state);
  }

  /// つぎのクイズ開始の情報を設定します。
  void nextQuiz() {
    state = state.copyWith(
      playCount: state.playCount + 1,
    );

    // Statisticsの保存
    _ref.watch(quizRepositoryProvider(_quizType)).saveStatistics(state);
  }

  /// クイズの成功を記録します。
  void successQuiz() {
    final nextChain = state.currentChain + 1;
    state = state.copyWith(
      currentChain: nextChain,
      clearCount: state.clearCount + 1,
      maxChain: max(nextChain, state.maxChain),
    );

    // Statisticsの保存
    _ref.watch(quizRepositoryProvider(_quizType)).saveStatistics(state);
  }

  /// クイズの終了を記録します。(失敗とおわりにするケース)
  void finishQuiz() {
    state = state.copyWith(
      currentChain: 0,
      lastChain: state.currentChain,
    );

    // Statisticsの保存
    _ref.watch(quizRepositoryProvider(_quizType)).saveStatistics(state);
  }
}
