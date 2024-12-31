// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parental_gate_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ParentalGateData {
  String? get question => throw _privateConstructorUsedError;
  String? get correct => throw _privateConstructorUsedError;
  List<String>? get answerList => throw _privateConstructorUsedError;

  /// Create a copy of ParentalGateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParentalGateDataCopyWith<ParentalGateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParentalGateDataCopyWith<$Res> {
  factory $ParentalGateDataCopyWith(
          ParentalGateData value, $Res Function(ParentalGateData) then) =
      _$ParentalGateDataCopyWithImpl<$Res, ParentalGateData>;
  @useResult
  $Res call({String? question, String? correct, List<String>? answerList});
}

/// @nodoc
class _$ParentalGateDataCopyWithImpl<$Res, $Val extends ParentalGateData>
    implements $ParentalGateDataCopyWith<$Res> {
  _$ParentalGateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParentalGateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = freezed,
    Object? correct = freezed,
    Object? answerList = freezed,
  }) {
    return _then(_value.copyWith(
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      correct: freezed == correct
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as String?,
      answerList: freezed == answerList
          ? _value.answerList
          : answerList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParentalGateDataImplCopyWith<$Res>
    implements $ParentalGateDataCopyWith<$Res> {
  factory _$$ParentalGateDataImplCopyWith(_$ParentalGateDataImpl value,
          $Res Function(_$ParentalGateDataImpl) then) =
      __$$ParentalGateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? question, String? correct, List<String>? answerList});
}

/// @nodoc
class __$$ParentalGateDataImplCopyWithImpl<$Res>
    extends _$ParentalGateDataCopyWithImpl<$Res, _$ParentalGateDataImpl>
    implements _$$ParentalGateDataImplCopyWith<$Res> {
  __$$ParentalGateDataImplCopyWithImpl(_$ParentalGateDataImpl _value,
      $Res Function(_$ParentalGateDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParentalGateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = freezed,
    Object? correct = freezed,
    Object? answerList = freezed,
  }) {
    return _then(_$ParentalGateDataImpl(
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      correct: freezed == correct
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as String?,
      answerList: freezed == answerList
          ? _value._answerList
          : answerList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$ParentalGateDataImpl
    with DiagnosticableTreeMixin
    implements _ParentalGateData {
  const _$ParentalGateDataImpl(
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
    if (_answerList is EqualUnmodifiableListView) return _answerList;
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParentalGateDataImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.correct, correct) || other.correct == correct) &&
            const DeepCollectionEquality()
                .equals(other._answerList, _answerList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, question, correct,
      const DeepCollectionEquality().hash(_answerList));

  /// Create a copy of ParentalGateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParentalGateDataImplCopyWith<_$ParentalGateDataImpl> get copyWith =>
      __$$ParentalGateDataImplCopyWithImpl<_$ParentalGateDataImpl>(
          this, _$identity);
}

abstract class _ParentalGateData implements ParentalGateData {
  const factory _ParentalGateData(
      {final String? question,
      final String? correct,
      final List<String>? answerList}) = _$ParentalGateDataImpl;

  @override
  String? get question;
  @override
  String? get correct;
  @override
  List<String>? get answerList;

  /// Create a copy of ParentalGateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParentalGateDataImplCopyWith<_$ParentalGateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
