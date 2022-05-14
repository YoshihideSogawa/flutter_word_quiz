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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WordInput _$WordInputFromJson(Map<String, dynamic> json) {
  return _WordInput.fromJson(json);
}

/// @nodoc
class _$WordInputTearOff {
  const _$WordInputTearOff();

  _WordInput call(
      {List<List<String>?> wordsList = const <InputWords?>[],
      List<List<WordNameState>?> wordsResultList = const <WordResults?>[],
      Map<String, WordKeyboardState> keyResultList =
          const <String, WordKeyboardState>{},
      int inputIndex = 0,
      bool isWordChecking = false}) {
    return _WordInput(
      wordsList: wordsList,
      wordsResultList: wordsResultList,
      keyResultList: keyResultList,
      inputIndex: inputIndex,
      isWordChecking: isWordChecking,
    );
  }

  WordInput fromJson(Map<String, Object?> json) {
    return WordInput.fromJson(json);
  }
}

/// @nodoc
const $WordInput = _$WordInputTearOff();

/// @nodoc
mixin _$WordInput {
  List<List<String>?> get wordsList => throw _privateConstructorUsedError;
  List<List<WordNameState>?> get wordsResultList =>
      throw _privateConstructorUsedError;
  Map<String, WordKeyboardState> get keyResultList =>
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
      Map<String, WordKeyboardState> keyResultList,
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
              as Map<String, WordKeyboardState>,
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
abstract class _$WordInputCopyWith<$Res> implements $WordInputCopyWith<$Res> {
  factory _$WordInputCopyWith(
          _WordInput value, $Res Function(_WordInput) then) =
      __$WordInputCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<List<String>?> wordsList,
      List<List<WordNameState>?> wordsResultList,
      Map<String, WordKeyboardState> keyResultList,
      int inputIndex,
      bool isWordChecking});
}

/// @nodoc
class __$WordInputCopyWithImpl<$Res> extends _$WordInputCopyWithImpl<$Res>
    implements _$WordInputCopyWith<$Res> {
  __$WordInputCopyWithImpl(_WordInput _value, $Res Function(_WordInput) _then)
      : super(_value, (v) => _then(v as _WordInput));

  @override
  _WordInput get _value => super._value as _WordInput;

  @override
  $Res call({
    Object? wordsList = freezed,
    Object? wordsResultList = freezed,
    Object? keyResultList = freezed,
    Object? inputIndex = freezed,
    Object? isWordChecking = freezed,
  }) {
    return _then(_WordInput(
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
              as Map<String, WordKeyboardState>,
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
      {this.wordsList = const <InputWords?>[],
      this.wordsResultList = const <WordResults?>[],
      this.keyResultList = const <String, WordKeyboardState>{},
      this.inputIndex = 0,
      this.isWordChecking = false});

  factory _$_WordInput.fromJson(Map<String, dynamic> json) =>
      _$$_WordInputFromJson(json);

  @JsonKey()
  @override
  final List<List<String>?> wordsList;
  @JsonKey()
  @override
  final List<List<WordNameState>?> wordsResultList;
  @JsonKey()
  @override
  final Map<String, WordKeyboardState> keyResultList;
  @JsonKey()
  @override
  final int inputIndex;
  @JsonKey()
  @override
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
            other is _WordInput &&
            const DeepCollectionEquality().equals(other.wordsList, wordsList) &&
            const DeepCollectionEquality()
                .equals(other.wordsResultList, wordsResultList) &&
            const DeepCollectionEquality()
                .equals(other.keyResultList, keyResultList) &&
            const DeepCollectionEquality()
                .equals(other.inputIndex, inputIndex) &&
            const DeepCollectionEquality()
                .equals(other.isWordChecking, isWordChecking));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(wordsList),
      const DeepCollectionEquality().hash(wordsResultList),
      const DeepCollectionEquality().hash(keyResultList),
      const DeepCollectionEquality().hash(inputIndex),
      const DeepCollectionEquality().hash(isWordChecking));

  @JsonKey(ignore: true)
  @override
  _$WordInputCopyWith<_WordInput> get copyWith =>
      __$WordInputCopyWithImpl<_WordInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WordInputToJson(this);
  }
}

abstract class _WordInput implements WordInput {
  const factory _WordInput(
      {List<List<String>?> wordsList,
      List<List<WordNameState>?> wordsResultList,
      Map<String, WordKeyboardState> keyResultList,
      int inputIndex,
      bool isWordChecking}) = _$_WordInput;

  factory _WordInput.fromJson(Map<String, dynamic> json) =
      _$_WordInput.fromJson;

  @override
  List<List<String>?> get wordsList;
  @override
  List<List<WordNameState>?> get wordsResultList;
  @override
  Map<String, WordKeyboardState> get keyResultList;
  @override
  int get inputIndex;
  @override
  bool get isWordChecking;
  @override
  @JsonKey(ignore: true)
  _$WordInputCopyWith<_WordInput> get copyWith =>
      throw _privateConstructorUsedError;
}
