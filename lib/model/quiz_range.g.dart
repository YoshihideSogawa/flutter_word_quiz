// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizRange _$QuizRangeFromJson(Map<String, dynamic> json) => _QuizRange(
  id: (json['id'] as num?)?.toInt() ?? 0,
  maxNo: (json['maxNo'] as num?)?.toInt() ?? 0,
  displayName: json['displayName'] as String?,
);

Map<String, dynamic> _$QuizRangeToJson(_QuizRange instance) =>
    <String, dynamic>{
      'id': instance.id,
      'maxNo': instance.maxNo,
      'displayName': instance.displayName,
    };
