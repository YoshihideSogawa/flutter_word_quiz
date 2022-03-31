import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_range.freezed.dart';

part 'quiz_range.g.dart';

/// クイズの出題範囲です。
@freezed
class QuizRange with _$QuizRange {
  const factory QuizRange({
    @Default(0) int id,
    @Default(0) int maxNo,
    String? displayName,
  }) = _QuizRange;

  factory QuizRange.fromJson(Map<String, dynamic> json) =>
      _$QuizRangeFromJson(json);
}
