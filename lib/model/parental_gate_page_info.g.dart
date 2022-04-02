// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parental_gate_page_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ParentalGatePageInfo _$$_ParentalGatePageInfoFromJson(
        Map<String, dynamic> json) =>
    _$_ParentalGatePageInfo(
      answerNum: json['answerNum'] as int? ?? 0,
      maxAnswerNum: json['maxAnswerNum'] as int? ?? 0,
      targetData: json['targetData'] == null
          ? null
          : ParentalGateData.fromJson(
              json['targetData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ParentalGatePageInfoToJson(
        _$_ParentalGatePageInfo instance) =>
    <String, dynamic>{
      'answerNum': instance.answerNum,
      'maxAnswerNum': instance.maxAnswerNum,
      'targetData': instance.targetData,
    };
