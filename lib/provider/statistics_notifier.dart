import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/model/quiz_statistics.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/repository/quiz/statistics_repository.dart';

part 'statistics_notifier.g.dart';

/// 統計情報の処理を行います。
@riverpod
class StatisticsNotifier extends _$StatisticsNotifier {
  @override
  Future<QuizStatistics> build(QuizTypes quizType) async {
    final quizStatistics =
        await ref.watch(statisticsRepositoryProvider(quizType).future);
    return quizStatistics ?? const QuizStatistics();
  }

  /// クイズ開始の情報を設定します。
  Future<void> startQuiz() async {
    // TODO(sogawa): quizInfoProviderの影響で一旦この処理を行う
    await future;
    final quizStatistics = state.value!.copyWith(
      playCount: state.value!.playCount + 1,
      currentChain: 0,
    );

    // Statisticsの保存
    await ref
        .read(statisticsRepositoryProvider(quizType).notifier)
        .saveStatistics(quizStatistics);
  }

  /// つぎのクイズ開始の情報を設定します。
  Future<void> nextQuiz() async {
    // TODO(sogawa): quizInfoProviderの影響で一旦この処理を行う
    await future;
    final quizStatistics = state.value!.copyWith(
      playCount: state.value!.playCount + 1,
    );

    // Statisticsの保存
    await ref
        .read(statisticsRepositoryProvider(quizType).notifier)
        .saveStatistics(quizStatistics);
  }

  /// クイズの成功を記録します。
  Future<void> successQuiz() async {
    // TODO(sogawa): quizInfoProviderの影響で一旦この処理を行う
    await future;
    final nextChain = state.value!.currentChain + 1;

    final quizStatistics = state.value!.copyWith(
      currentChain: nextChain,
      clearCount: state.value!.clearCount + 1,
      maxChain: max(nextChain, state.value!.maxChain),
    );

    // Statisticsの保存
    await ref
        .read(statisticsRepositoryProvider(quizType).notifier)
        .saveStatistics(quizStatistics);
  }

  /// クイズの終了を記録します。(失敗とおわりにするケース)
  Future<void> finishQuiz() async {
    // TODO(sogawa): quizInfoProviderの影響で一旦この処理を行う
    await future;
    final quizStatistics = state.value!.copyWith(
      currentChain: 0,
      lastChain: state.value!.currentChain,
    );

    // Statisticsの保存
    await ref
        .read(statisticsRepositoryProvider(quizType).notifier)
        .saveStatistics(quizStatistics);
  }
}
