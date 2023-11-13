// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_page_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizPageInfoImpl _$$QuizPageInfoImplFromJson(Map<String, dynamic> json) =>
    _$QuizPageInfoImpl(
      showAnswer: json['showAnswer'] as bool? ?? false,
      showStatistics: json['showStatistics'] as bool? ?? false,
      normalKeyboard: json['normalKeyboard'] as bool? ?? true,
      showQuizSelection: json['showQuizSelection'] as bool? ?? false,
      showResult: json['showResult'] as bool? ?? false,
      showQuizChanged: json['showQuizChanged'] as bool? ?? false,
    );

Map<String, dynamic> _$$QuizPageInfoImplToJson(_$QuizPageInfoImpl instance) =>
    <String, dynamic>{
      'showAnswer': instance.showAnswer,
      'showStatistics': instance.showStatistics,
      'normalKeyboard': instance.normalKeyboard,
      'showQuizSelection': instance.showQuizSelection,
      'showResult': instance.showResult,
      'showQuizChanged': instance.showQuizChanged,
    };
