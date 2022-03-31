// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_page_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizPageInfo _$$_QuizPageInfoFromJson(Map<String, dynamic> json) =>
    _$_QuizPageInfo(
      showAnswer: json['showAnswer'] as bool? ?? false,
      showStatistics: json['showStatistics'] as bool? ?? false,
      normalKeyboard: json['normalKeyboard'] as bool? ?? true,
      showQuizSelection: json['showQuizSelection'] as bool? ?? false,
      showResult: json['showResult'] as bool? ?? false,
      showQuizChanged: json['showQuizChanged'] as bool? ?? false,
    );

Map<String, dynamic> _$$_QuizPageInfoToJson(_$_QuizPageInfo instance) =>
    <String, dynamic>{
      'showAnswer': instance.showAnswer,
      'showStatistics': instance.showStatistics,
      'normalKeyboard': instance.normalKeyboard,
      'showQuizSelection': instance.showQuizSelection,
      'showResult': instance.showResult,
      'showQuizChanged': instance.showQuizChanged,
    };
