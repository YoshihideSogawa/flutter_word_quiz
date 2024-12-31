// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizInfoImpl _$$QuizInfoImplFromJson(Map<String, dynamic> json) =>
    _$QuizInfoImpl(
      answer: json['answer'] == null
          ? null
          : Monster.fromJson(json['answer'] as Map<String, dynamic>),
      maxAnswer: json['maxAnswer'] as int? ?? 0,
      quizType: $enumDecodeNullable(_$QuizTypesEnumMap, json['quizType']),
      quizProcess:
          $enumDecodeNullable(_$QuizProcessTypeEnumMap, json['quizProcess']) ??
              QuizProcessType.none,
      quizRange: json['quizRange'] == null
          ? null
          : QuizRange.fromJson(json['quizRange'] as Map<String, dynamic>),
      seedText: json['seedText'] as String?,
      playDate: json['playDate'] as int? ?? 0,
    );

Map<String, dynamic> _$$QuizInfoImplToJson(_$QuizInfoImpl instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'maxAnswer': instance.maxAnswer,
      'quizType': _$QuizTypesEnumMap[instance.quizType],
      'quizProcess': _$QuizProcessTypeEnumMap[instance.quizProcess]!,
      'quizRange': instance.quizRange,
      'seedText': instance.seedText,
      'playDate': instance.playDate,
    };

const _$QuizTypesEnumMap = {
  QuizTypes.daily: 'daily',
  QuizTypes.endless: 'endless',
};

const _$QuizProcessTypeEnumMap = {
  QuizProcessType.started: 'started',
  QuizProcessType.success: 'success',
  QuizProcessType.failure: 'failure',
  QuizProcessType.quit: 'quit',
  QuizProcessType.none: 'none',
};
