import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/model/quiz_statistics.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';
import 'package:word_quiz/repository/quiz/quiz_keys.dart';

part 'statistics_repository.g.dart';

/// 問題の成績などを扱います。
@riverpod
class StatisticsRepository extends _$StatisticsRepository {
  @override
  Future<QuizStatistics?> build(QuizTypes quizType) async {
    final quizBox = await ref.watch(hiveBoxProvider(quizType.boxName).future);
    final statisticsJson = quizBox.get(statisticsKey) as String?;
    if (statisticsJson == null) {
      return null;
    }

    return QuizStatistics.fromJson(
      jsonDecode(statisticsJson) as Map<String, dynamic>,
    );
  }

  /// [QuizStatistics]を保存します。
  Future<void> saveStatistics(QuizStatistics? statistics) async {
    if (statistics == null) {
      return;
    }

    final quizBox = await ref.watch(hiveBoxProvider(quizType.boxName).future);
    await quizBox.put(statisticsKey, jsonEncode(statistics));
    ref.invalidateSelf();
  }
}

@visibleForTesting
class MockStatisticsRepository extends _$StatisticsRepository
    with Mock
    implements StatisticsRepository {}
