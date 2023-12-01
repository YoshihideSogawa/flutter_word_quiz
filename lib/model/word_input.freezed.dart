// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WordInput _$WordInputFromJson(Map<String, dynamic> json) {
  return _WordInput.fromJson(json);
}

/// @nodoc
mixin _$WordInput {
  List<List<String>?> get wordsList => throw _privateConstructorUsedError;
  List<List<WordNameState>?> get wordsResultList =>
      throw _privateConstructorUsedError;
  Map<String, WordKeyboardInfo> get keyResultList =>
      throw _privateConstructorUsedError;
  int get inputIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordInputCopyWith<WordInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordInputCopyWith<$Res> {
  factory $WordInputCopyWith(WordInput value, $Res Function(WordInput) then) =
      _$WordInputCopyWithImpl<$Res, WordInput>;
  @useResult
  $Res call(
      {List<List<String>?> wordsList,
      List<List<WordNameState>?> wordsResultList,
      Map<String, WordKeyboardInfo> keyResultList,
      int inputIndex});
}

/// @nodoc
class _$WordInputCopyWithImpl<$Res, $Val extends WordInput>
    implements $WordInputCopyWith<$Res> {
  _$WordInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wordsList = null,
    Object? wordsResultList = null,
    Object? keyResultList = null,
    Object? inputIndex = null,
  }) {
    return _then(_value.copyWith(
      wordsList: null == wordsList
          ? _value.wordsList
          : wordsList // ignore: cast_nullable_to_non_nullable
              as List<List<String>?>,
      wordsResultList: null == wordsResultList
          ? _value.wordsResultList
          : wordsResultList // ignore: cast_nullable_to_non_nullable
              as List<List<WordNameState>?>,
      keyResultList: null == keyResultList
          ? _value.keyResultList
          : keyResultList // ignore: cast_nullable_to_non_nullable
              as Map<String, WordKeyboardInfo>,
      inputIndex: null == inputIndex
          ? _value.inputIndex
          : inputIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordInputImplCopyWith<$Res>
    implements $WordInputCopyWith<$Res> {
  factory _$$WordInputImplCopyWith(
          _$WordInputImpl value, $Res Function(_$WordInputImpl) then) =
      __$$WordInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<List<String>?> wordsList,
      List<List<WordNameState>?> wordsResultList,
      Map<String, WordKeyboardInfo> keyResultList,
      int inputIndex});
}

/// @nodoc
class __$$WordInputImplCopyWithImpl<$Res>
    extends _$WordInputCopyWithImpl<$Res, _$WordInputImpl>
    implements _$$WordInputImplCopyWith<$Res> {
  __$$WordInputImplCopyWithImpl(
      _$WordInputImpl _value, $Res Function(_$WordInputImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wordsList = null,
    Object? wordsResultList = null,
    Object? keyResultList = null,
    Object? inputIndex = null,
  }) {
    return _then(_$WordInputImpl(
      wordsList: null == wordsList
          ? _value._wordsList
          : wordsList // ignore: cast_nullable_to_non_nullable
              as List<List<String>?>,
      wordsResultList: null == wordsResultList
          ? _value._wordsResultList
          : wordsResultList // ignore: cast_nullable_to_non_nullable
              as List<List<WordNameState>?>,
      keyResultList: null == keyResultList
          ? _value._keyResultList
          : keyResultList // ignore: cast_nullable_to_non_nullable
              as Map<String, WordKeyboardInfo>,
      inputIndex: null == inputIndex
          ? _value.inputIndex
          : inputIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WordInputImpl with DiagnosticableTreeMixin implements _WordInput {
  const _$WordInputImpl(
      {final List<List<String>?> wordsList = const <InputWords?>[],
      final List<List<WordNameState>?> wordsResultList = const <WordResults?>[],
      final Map<String, WordKeyboardInfo> keyResultList =
          const <String, WordKeyboardInfo>{},
      this.inputIndex = 0})
      : _wordsList = wordsList,
        _wordsResultList = wordsResultList,
        _keyResultList = keyResultList;

  factory _$WordInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordInputImplFromJson(json);

  final List<List<String>?> _wordsList;
  @override
  @JsonKey()
  List<List<String>?> get wordsList {
    if (_wordsList is EqualUnmodifiableListView) return _wordsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wordsList);
  }

  final List<List<WordNameState>?> _wordsResultList;
  @override
  @JsonKey()
  List<List<WordNameState>?> get wordsResultList {
    if (_wordsResultList is EqualUnmodifiableListView) return _wordsResultList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wordsResultList);
  }

  final Map<String, WordKeyboardInfo> _keyResultList;
  @override
  @JsonKey()
  Map<String, WordKeyboardInfo> get keyResultList {
    if (_keyResultList is EqualUnmodifiableMapView) return _keyResultList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_keyResultList);
  }

  @override
  @JsonKey()
  final int inputIndex;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WordInput(wordsList: $wordsList, wordsResultList: $wordsResultList, keyResultList: $keyResultList, inputIndex: $inputIndex)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WordInput'))
      ..add(DiagnosticsProperty('wordsList', wordsList))
      ..add(DiagnosticsProperty('wordsResultList', wordsResultList))
      ..add(DiagnosticsProperty('keyResultList', keyResultList))
      ..add(DiagnosticsProperty('inputIndex', inputIndex));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordInputImpl &&
            const DeepCollectionEquality()
                .equals(other._wordsList, _wordsList) &&
            const DeepCollectionEquality()
                .equals(other._wordsResultList, _wordsResultList) &&
            const DeepCollectionEquality()
                .equals(other._keyResultList, _keyResultList) &&
            (identical(other.inputIndex, inputIndex) ||
                other.inputIndex == inputIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_wordsList),
      const DeepCollectionEquality().hash(_wordsResultList),
      const DeepCollectionEquality().hash(_keyResultList),
      inputIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WordInputImplCopyWith<_$WordInputImpl> get copyWith =>
      __$$WordInputImplCopyWithImpl<_$WordInputImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WordInputImplToJson(
      this,
    );
  }
}

abstract class _WordInput implements WordInput {
  const factory _WordInput(
      {final List<List<String>?> wordsList,
      final List<List<WordNameState>?> wordsResultList,
      final Map<String, WordKeyboardInfo> keyResultList,
      final int inputIndex}) = _$WordInputImpl;

  factory _WordInput.fromJson(Map<String, dynamic> json) =
      _$WordInputImpl.fromJson;

  @override
  List<List<String>?> get wordsList;
  @override
  List<List<WordNameState>?> get wordsResultList;
  @override
  Map<String, WordKeyboardInfo> get keyResultList;
  @override
  int get inputIndex;
  @override
  @JsonKey(ignore: true)
  _$$WordInputImplCopyWith<_$WordInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
