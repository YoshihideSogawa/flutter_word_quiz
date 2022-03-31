// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WordInput _$$_WordInputFromJson(Map<String, dynamic> json) => _$_WordInput(
      wordsList: (json['wordsList'] as List<dynamic>?)
              ?.map((e) =>
                  (e as List<dynamic>?)?.map((e) => e as String).toList())
              .toList() ??
          const <InputWords?>[],
      wordsResultList: (json['wordsResultList'] as List<dynamic>?)
              ?.map((e) => (e as List<dynamic>?)
                  ?.map((e) => $enumDecode(_$WordNameStateEnumMap, e))
                  .toList())
              .toList() ??
          const <WordResults?>[],
      keyResultList: (json['keyResultList'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, $enumDecode(_$WordKeyboardStateEnumMap, e)),
          ) ??
          const <String, WordKeyboardState>{},
      inputIndex: json['inputIndex'] as int? ?? 0,
      isWordChecking: json['isWordChecking'] as bool? ?? false,
    );

Map<String, dynamic> _$$_WordInputToJson(_$_WordInput instance) =>
    <String, dynamic>{
      'wordsList': instance.wordsList,
      'wordsResultList': instance.wordsResultList
          .map((e) => e?.map((e) => _$WordNameStateEnumMap[e]).toList())
          .toList(),
      'keyResultList': instance.keyResultList
          .map((k, e) => MapEntry(k, _$WordKeyboardStateEnumMap[e])),
      'inputIndex': instance.inputIndex,
      'isWordChecking': instance.isWordChecking,
    };

const _$WordNameStateEnumMap = {
  WordNameState.none: 'none',
  WordNameState.hit: 'hit',
  WordNameState.match: 'match',
  WordNameState.notMatch: 'notMatch',
};

const _$WordKeyboardStateEnumMap = {
  WordKeyboardState.none: 'none',
  WordKeyboardState.hit: 'hit',
  WordKeyboardState.match: 'match',
  WordKeyboardState.notMatch: 'notMatch',
};
