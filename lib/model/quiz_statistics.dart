import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_statistics.freezed.dart';

part 'quiz_statistics.g.dart';

/// クイズの成績データです。
@freezed
class QuizStatistics with _$QuizStatistics {
  const factory QuizStatistics({
    @Default(0) int clearCount,
    @Default(0) int currentChain,
    @Default(0) int lastChain,
    @Default(0) int maxChain,
    @Default(0) int playCount,
  }) = _QuizStatistics;

  factory QuizStatistics.fromJson(Map<String, dynamic> json) =>
      _$QuizStatisticsFromJson(json);
}
