import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:word_quiz/model/parental_gate_data.dart';

part 'parental_gate_page_info.freezed.dart';

part 'parental_gate_page_info.g.dart';

@freezed
class ParentalGatePageInfo with _$ParentalGatePageInfo {
  const factory ParentalGatePageInfo({
    @Default(0) int answerNum,
    @Default(0) int maxAnswerNum,
    ParentalGateData? targetData,
  }) = _ParentalGatePageInfo;

  factory ParentalGatePageInfo.fromJson(Map<String, dynamic> json) =>
      _$ParentalGatePageInfoFromJson(json);
}
