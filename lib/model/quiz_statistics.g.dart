// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizStatisticsImpl _$$QuizStatisticsImplFromJson(Map<String, dynamic> json) =>
    _$QuizStatisticsImpl(
      clearCount: json['clearCount'] as int? ?? 0,
      currentChain: json['currentChain'] as int? ?? 0,
      lastChain: json['lastChain'] as int? ?? 0,
      maxChain: json['maxChain'] as int? ?? 0,
      playCount: json['playCount'] as int? ?? 0,
    );

Map<String, dynamic> _$$QuizStatisticsImplToJson(
        _$QuizStatisticsImpl instance) =>
    <String, dynamic>{
      'clearCount': instance.clearCount,
      'currentChain': instance.currentChain,
      'lastChain': instance.lastChain,
      'maxChain': instance.maxChain,
      'playCount': instance.playCount,
    };
