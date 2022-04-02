// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'parental_gate_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ParentalGateData _$ParentalGateDataFromJson(Map<String, dynamic> json) {
  return _ParentalGateData.fromJson(json);
}

/// @nodoc
class _$ParentalGateDataTearOff {
  const _$ParentalGateDataTearOff();

  _ParentalGateData call(
      {String? question, String? correct, List<String>? answerList}) {
    return _ParentalGateData(
      question: question,
      correct: correct,
      answerList: answerList,
    );
  }

  ParentalGateData fromJson(Map<String, Object?> json) {
    return ParentalGateData.fromJson(json);
  }
}

/// @nodoc
const $ParentalGateData = _$ParentalGateDataTearOff();

/// @nodoc
mixin _$ParentalGateData {
  String? get question => throw _privateConstructorUsedError;
  String? get correct => throw _privateConstructorUsedError;
  List<String>? get answerList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParentalGateDataCopyWith<ParentalGateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParentalGateDataCopyWith<$Res> {
  factory $ParentalGateDataCopyWith(
          ParentalGateData value, $Res Function(ParentalGateData) then) =
      _$ParentalGateDataCopyWithImpl<$Res>;
  $Res call({String? question, String? correct, List<String>? answerList});
}

/// @nodoc
class _$ParentalGateDataCopyWithImpl<$Res>
    implements $ParentalGateDataCopyWith<$Res> {
  _$ParentalGateDataCopyWithImpl(this._value, this._then);

  final ParentalGateData _value;
  // ignore: unused_field
  final $Res Function(ParentalGateData) _then;

  @override
  $Res call({
    Object? question = freezed,
    Object? correct = freezed,
    Object? answerList = freezed,
  }) {
    return _then(_value.copyWith(
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      correct: correct == freezed
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as String?,
      answerList: answerList == freezed
          ? _value.answerList
          : answerList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$ParentalGateDataCopyWith<$Res>
    implements $ParentalGateDataCopyWith<$Res> {
  factory _$ParentalGateDataCopyWith(
          _ParentalGateData value, $Res Function(_ParentalGateData) then) =
      __$ParentalGateDataCopyWithImpl<$Res>;
  @override
  $Res call({String? question, String? correct, List<String>? answerList});
}

/// @nodoc
class __$ParentalGateDataCopyWithImpl<$Res>
    extends _$ParentalGateDataCopyWithImpl<$Res>
    implements _$ParentalGateDataCopyWith<$Res> {
  __$ParentalGateDataCopyWithImpl(
      _ParentalGateData _value, $Res Function(_ParentalGateData) _then)
      : super(_value, (v) => _then(v as _ParentalGateData));

  @override
  _ParentalGateData get _value => super._value as _ParentalGateData;

  @override
  $Res call({
    Object? question = freezed,
    Object? correct = freezed,
    Object? answerList = freezed,
  }) {
    return _then(_ParentalGateData(
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      correct: correct == freezed
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as String?,
      answerList: answerList == freezed
          ? _value.answerList
          : answerList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ParentalGateData
    with DiagnosticableTreeMixin
    implements _ParentalGateData {
  const _$_ParentalGateData({this.question, this.correct, this.answerList});

  factory _$_ParentalGateData.fromJson(Map<String, dynamic> json) =>
      _$$_ParentalGateDataFromJson(json);

  @override
  final String? question;
  @override
  final String? correct;
  @override
  final List<String>? answerList;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ParentalGateData(question: $question, correct: $correct, answerList: $answerList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ParentalGateData'))
      ..add(DiagnosticsProperty('question', question))
      ..add(DiagnosticsProperty('correct', correct))
      ..add(DiagnosticsProperty('answerList', answerList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ParentalGateData &&
            const DeepCollectionEquality().equals(other.question, question) &&
            const DeepCollectionEquality().equals(other.correct, correct) &&
            const DeepCollectionEquality()
                .equals(other.answerList, answerList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(question),
      const DeepCollectionEquality().hash(correct),
      const DeepCollectionEquality().hash(answerList));

  @JsonKey(ignore: true)
  @override
  _$ParentalGateDataCopyWith<_ParentalGateData> get copyWith =>
      __$ParentalGateDataCopyWithImpl<_ParentalGateData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ParentalGateDataToJson(this);
  }
}

abstract class _ParentalGateData implements ParentalGateData {
  const factory _ParentalGateData(
      {String? question,
      String? correct,
      List<String>? answerList}) = _$_ParentalGateData;

  factory _ParentalGateData.fromJson(Map<String, dynamic> json) =
      _$_ParentalGateData.fromJson;

  @override
  String? get question;
  @override
  String? get correct;
  @override
  List<String>? get answerList;
  @override
  @JsonKey(ignore: true)
  _$ParentalGateDataCopyWith<_ParentalGateData> get copyWith =>
      throw _privateConstructorUsedError;
}
