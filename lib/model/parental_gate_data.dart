import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'parental_gate_data.freezed.dart';

part 'parental_gate_data.g.dart';

@freezed
class ParentalGateData with _$ParentalGateData {
  const factory ParentalGateData({
    String? question,
    String? correct,
    List<String>? answerList,
  }) = _ParentalGateData;

  factory ParentalGateData.fromJson(Map<String, dynamic> json) =>
      _$ParentalGateDataFromJson(json);
}
