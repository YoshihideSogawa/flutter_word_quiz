// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WordInputImpl _$$WordInputImplFromJson(Map<String, dynamic> json) =>
    _$WordInputImpl(
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
            (k, e) => MapEntry(k, $enumDecode(_$WordKeyboardInfoEnumMap, e)),
          ) ??
          const <String, WordKeyboardInfo>{},
      inputIndex: (json['inputIndex'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$WordInputImplToJson(_$WordInputImpl instance) =>
    <String, dynamic>{
      'wordsList': instance.wordsList,
      'wordsResultList': instance.wordsResultList
          .map((e) => e?.map((e) => _$WordNameStateEnumMap[e]!).toList())
          .toList(),
      'keyResultList': instance.keyResultList
          .map((k, e) => MapEntry(k, _$WordKeyboardInfoEnumMap[e]!)),
      'inputIndex': instance.inputIndex,
    };

const _$WordNameStateEnumMap = {
  WordNameState.none: 'none',
  WordNameState.hit: 'hit',
  WordNameState.match: 'match',
  WordNameState.notMatch: 'notMatch',
};

const _$WordKeyboardInfoEnumMap = {
  WordKeyboardInfo.none: 'none',
  WordKeyboardInfo.hit: 'hit',
  WordKeyboardInfo.match: 'match',
  WordKeyboardInfo.notMatch: 'notMatch',
};
