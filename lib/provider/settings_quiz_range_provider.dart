import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/monster_series.dart';
import 'package:word_quiz/model/quiz_range.dart';
import 'package:word_quiz/repository/settings_repository.dart';

/// クイズの出題範囲のProviderです。
final settingsQuizRangeProvider =
    StateNotifierProvider<SettingsQuizRangeNotifier, QuizRange>(
  SettingsQuizRangeNotifier.new,
);

class SettingsQuizRangeNotifier extends StateNotifier<QuizRange> {
  SettingsQuizRangeNotifier(
    this._ref,
  ) : super(diamondPearl) {
    init();
  }

  /// [Ref]
  final Ref _ref;

  /// 初期化を行います。
  @visibleForTesting
  void init() {
    final id = _ref.read(settingsRepositoryProvider).quizRangeId();
    final quizRange =
        quizRangeList.firstWhereOrNull((element) => element.id == id);
    state = quizRange ?? diamondPearl;
  }

  /// 出題範囲を更新します。
  void updateQuizRange(QuizRange quizRange) {
    _ref.read(settingsRepositoryProvider).saveQuizRangeId(quizRange.id);
    state = quizRange;
  }
}
