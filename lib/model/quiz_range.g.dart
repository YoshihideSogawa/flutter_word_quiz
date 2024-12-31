// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizRangeImpl _$$QuizRangeImplFromJson(Map<String, dynamic> json) =>
    _$QuizRangeImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      maxNo: (json['maxNo'] as num?)?.toInt() ?? 0,
      displayName: json['displayName'] as String?,
    );

Map<String, dynamic> _$$QuizRangeImplToJson(_$QuizRangeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'maxNo': instance.maxNo,
      'displayName': instance.displayName,
    };
