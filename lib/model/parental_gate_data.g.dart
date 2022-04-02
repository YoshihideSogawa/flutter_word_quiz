// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parental_gate_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ParentalGateData _$$_ParentalGateDataFromJson(Map<String, dynamic> json) =>
    _$_ParentalGateData(
      question: json['question'] as String?,
      correct: json['correct'] as String?,
      answerList: (json['answerList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_ParentalGateDataToJson(_$_ParentalGateData instance) =>
    <String, dynamic>{
      'question': instance.question,
      'correct': instance.correct,
      'answerList': instance.answerList,
    };
