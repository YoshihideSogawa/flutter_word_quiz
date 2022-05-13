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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ParentalGateData {
  String? get question => throw _privateConstructorUsedError;
  String? get correct => throw _privateConstructorUsedError;
  List<String>? get answerList => throw _privateConstructorUsedError;

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
abstract class _$$_ParentalGateDataCopyWith<$Res>
    implements $ParentalGateDataCopyWith<$Res> {
  factory _$$_ParentalGateDataCopyWith(
          _$_ParentalGateData value, $Res Function(_$_ParentalGateData) then) =
      __$$_ParentalGateDataCopyWithImpl<$Res>;
  @override
  $Res call({String? question, String? correct, List<String>? answerList});
}

/// @nodoc
class __$$_ParentalGateDataCopyWithImpl<$Res>
    extends _$ParentalGateDataCopyWithImpl<$Res>
    implements _$$_ParentalGateDataCopyWith<$Res> {
  __$$_ParentalGateDataCopyWithImpl(
      _$_ParentalGateData _value, $Res Function(_$_ParentalGateData) _then)
      : super(_value, (v) => _then(v as _$_ParentalGateData));

  @override
  _$_ParentalGateData get _value => super._value as _$_ParentalGateData;

  @override
  $Res call({
    Object? question = freezed,
    Object? correct = freezed,
    Object? answerList = freezed,
  }) {
    return _then(_$_ParentalGateData(
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      correct: correct == freezed
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as String?,
      answerList: answerList == freezed
          ? _value._answerList
          : answerList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$_ParentalGateData
    with DiagnosticableTreeMixin
    implements _ParentalGateData {
  const _$_ParentalGateData(
      {this.question, this.correct, final List<String>? answerList})
      : _answerList = answerList;

  @override
  final String? question;
  @override
  final String? correct;
  final List<String>? _answerList;
  @override
  List<String>? get answerList {
    final value = _answerList;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
            other is _$_ParentalGateData &&
            const DeepCollectionEquality().equals(other.question, question) &&
            const DeepCollectionEquality().equals(other.correct, correct) &&
            const DeepCollectionEquality()
                .equals(other._answerList, _answerList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(question),
      const DeepCollectionEquality().hash(correct),
      const DeepCollectionEquality().hash(_answerList));

  @JsonKey(ignore: true)
  @override
  _$$_ParentalGateDataCopyWith<_$_ParentalGateData> get copyWith =>
      __$$_ParentalGateDataCopyWithImpl<_$_ParentalGateData>(this, _$identity);
}

abstract class _ParentalGateData implements ParentalGateData {
  const factory _ParentalGateData(
      {final String? question,
      final String? correct,
      final List<String>? answerList}) = _$_ParentalGateData;

  @override
  String? get question => throw _privateConstructorUsedError;
  @override
  String? get correct => throw _privateConstructorUsedError;
  @override
  List<String>? get answerList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ParentalGateDataCopyWith<_$_ParentalGateData> get copyWith =>
      throw _privateConstructorUsedError;
}
