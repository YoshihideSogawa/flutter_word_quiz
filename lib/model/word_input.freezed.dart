// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  bool get isWordChecking => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordInputCopyWith<WordInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordInputCopyWith<$Res> {
  factory $WordInputCopyWith(WordInput value, $Res Function(WordInput) then) =
      _$WordInputCopyWithImpl<$Res>;
  $Res call(
      {List<List<String>?> wordsList,
      List<List<WordNameState>?> wordsResultList,
      Map<String, WordKeyboardInfo> keyResultList,
      int inputIndex,
      bool isWordChecking});
}

/// @nodoc
class _$WordInputCopyWithImpl<$Res> implements $WordInputCopyWith<$Res> {
  _$WordInputCopyWithImpl(this._value, this._then);

  final WordInput _value;
  // ignore: unused_field
  final $Res Function(WordInput) _then;

  @override
  $Res call({
    Object? wordsList = freezed,
    Object? wordsResultList = freezed,
    Object? keyResultList = freezed,
    Object? inputIndex = freezed,
    Object? isWordChecking = freezed,
  }) {
    return _then(_value.copyWith(
      wordsList: wordsList == freezed
          ? _value.wordsList
          : wordsList // ignore: cast_nullable_to_non_nullable
              as List<List<String>?>,
      wordsResultList: wordsResultList == freezed
          ? _value.wordsResultList
          : wordsResultList // ignore: cast_nullable_to_non_nullable
              as List<List<WordNameState>?>,
      keyResultList: keyResultList == freezed
          ? _value.keyResultList
          : keyResultList // ignore: cast_nullable_to_non_nullable
              as Map<String, WordKeyboardInfo>,
      inputIndex: inputIndex == freezed
          ? _value.inputIndex
          : inputIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isWordChecking: isWordChecking == freezed
          ? _value.isWordChecking
          : isWordChecking // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_WordInputCopyWith<$Res> implements $WordInputCopyWith<$Res> {
  factory _$$_WordInputCopyWith(
          _$_WordInput value, $Res Function(_$_WordInput) then) =
      __$$_WordInputCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<List<String>?> wordsList,
      List<List<WordNameState>?> wordsResultList,
      Map<String, WordKeyboardInfo> keyResultList,
      int inputIndex,
      bool isWordChecking});
}

/// @nodoc
class __$$_WordInputCopyWithImpl<$Res> extends _$WordInputCopyWithImpl<$Res>
    implements _$$_WordInputCopyWith<$Res> {
  __$$_WordInputCopyWithImpl(
      _$_WordInput _value, $Res Function(_$_WordInput) _then)
      : super(_value, (v) => _then(v as _$_WordInput));

  @override
  _$_WordInput get _value => super._value as _$_WordInput;

  @override
  $Res call({
    Object? wordsList = freezed,
    Object? wordsResultList = freezed,
    Object? keyResultList = freezed,
    Object? inputIndex = freezed,
    Object? isWordChecking = freezed,
  }) {
    return _then(_$_WordInput(
      wordsList: wordsList == freezed
          ? _value._wordsList
          : wordsList // ignore: cast_nullable_to_non_nullable
              as List<List<String>?>,
      wordsResultList: wordsResultList == freezed
          ? _value._wordsResultList
          : wordsResultList // ignore: cast_nullable_to_non_nullable
              as List<List<WordNameState>?>,
      keyResultList: keyResultList == freezed
          ? _value._keyResultList
          : keyResultList // ignore: cast_nullable_to_non_nullable
              as Map<String, WordKeyboardInfo>,
      inputIndex: inputIndex == freezed
          ? _value.inputIndex
          : inputIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isWordChecking: isWordChecking == freezed
          ? _value.isWordChecking
          : isWordChecking // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WordInput with DiagnosticableTreeMixin implements _WordInput {
  const _$_WordInput(
      {final List<List<String>?> wordsList = const <InputWords?>[],
      final List<List<WordNameState>?> wordsResultList = const <WordResults?>[],
      final Map<String, WordKeyboardInfo> keyResultList =
          const <String, WordKeyboardInfo>{},
      this.inputIndex = 0,
      this.isWordChecking = false})
      : _wordsList = wordsList,
        _wordsResultList = wordsResultList,
        _keyResultList = keyResultList;

  factory _$_WordInput.fromJson(Map<String, dynamic> json) =>
      _$$_WordInputFromJson(json);

  final List<List<String>?> _wordsList;
  @override
  @JsonKey()
  List<List<String>?> get wordsList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wordsList);
  }

  final List<List<WordNameState>?> _wordsResultList;
  @override
  @JsonKey()
  List<List<WordNameState>?> get wordsResultList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wordsResultList);
  }

  final Map<String, WordKeyboardInfo> _keyResultList;
  @override
  @JsonKey()
  Map<String, WordKeyboardInfo> get keyResultList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_keyResultList);
  }

  @override
  @JsonKey()
  final int inputIndex;
  @override
  @JsonKey()
  final bool isWordChecking;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WordInput(wordsList: $wordsList, wordsResultList: $wordsResultList, keyResultList: $keyResultList, inputIndex: $inputIndex, isWordChecking: $isWordChecking)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WordInput'))
      ..add(DiagnosticsProperty('wordsList', wordsList))
      ..add(DiagnosticsProperty('wordsResultList', wordsResultList))
      ..add(DiagnosticsProperty('keyResultList', keyResultList))
      ..add(DiagnosticsProperty('inputIndex', inputIndex))
      ..add(DiagnosticsProperty('isWordChecking', isWordChecking));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WordInput &&
            const DeepCollectionEquality()
                .equals(other._wordsList, _wordsList) &&
            const DeepCollectionEquality()
                .equals(other._wordsResultList, _wordsResultList) &&
            const DeepCollectionEquality()
                .equals(other._keyResultList, _keyResultList) &&
            const DeepCollectionEquality()
                .equals(other.inputIndex, inputIndex) &&
            const DeepCollectionEquality()
                .equals(other.isWordChecking, isWordChecking));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_wordsList),
      const DeepCollectionEquality().hash(_wordsResultList),
      const DeepCollectionEquality().hash(_keyResultList),
      const DeepCollectionEquality().hash(inputIndex),
      const DeepCollectionEquality().hash(isWordChecking));

  @JsonKey(ignore: true)
  @override
  _$$_WordInputCopyWith<_$_WordInput> get copyWith =>
      __$$_WordInputCopyWithImpl<_$_WordInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WordInputToJson(this);
  }
}

abstract class _WordInput implements WordInput {
  const factory _WordInput(
      {final List<List<String>?> wordsList,
      final List<List<WordNameState>?> wordsResultList,
      final Map<String, WordKeyboardInfo> keyResultList,
      final int inputIndex,
      final bool isWordChecking}) = _$_WordInput;

  factory _WordInput.fromJson(Map<String, dynamic> json) =
      _$_WordInput.fromJson;

  @override
  List<List<String>?> get wordsList => throw _privateConstructorUsedError;
  @override
  List<List<WordNameState>?> get wordsResultList =>
      throw _privateConstructorUsedError;
  @override
  Map<String, WordKeyboardInfo> get keyResultList =>
      throw _privateConstructorUsedError;
  @override
  int get inputIndex => throw _privateConstructorUsedError;
  @override
  bool get isWordChecking => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WordInputCopyWith<_$_WordInput> get copyWith =>
      throw _privateConstructorUsedError;
}
