// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizInfo _$QuizInfoFromJson(Map<String, dynamic> json) {
  return _QuizInfo.fromJson(json);
}

/// @nodoc
mixin _$QuizInfo {
  Monster? get answer => throw _privateConstructorUsedError;
  int get maxAnswer => throw _privateConstructorUsedError;
  QuizTypes? get quizType => throw _privateConstructorUsedError;
  QuizProcessType get quizProcess => throw _privateConstructorUsedError;
  QuizRange? get quizRange => throw _privateConstructorUsedError;
  String? get seedText => throw _privateConstructorUsedError;
  int get playDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizInfoCopyWith<QuizInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizInfoCopyWith<$Res> {
  factory $QuizInfoCopyWith(QuizInfo value, $Res Function(QuizInfo) then) =
      _$QuizInfoCopyWithImpl<$Res, QuizInfo>;
  @useResult
  $Res call(
      {Monster? answer,
      int maxAnswer,
      QuizTypes? quizType,
      QuizProcessType quizProcess,
      QuizRange? quizRange,
      String? seedText,
      int playDate});

  $MonsterCopyWith<$Res>? get answer;
  $QuizRangeCopyWith<$Res>? get quizRange;
}

/// @nodoc
class _$QuizInfoCopyWithImpl<$Res, $Val extends QuizInfo>
    implements $QuizInfoCopyWith<$Res> {
  _$QuizInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = freezed,
    Object? maxAnswer = null,
    Object? quizType = freezed,
    Object? quizProcess = null,
    Object? quizRange = freezed,
    Object? seedText = freezed,
    Object? playDate = null,
  }) {
    return _then(_value.copyWith(
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as Monster?,
      maxAnswer: null == maxAnswer
          ? _value.maxAnswer
          : maxAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      quizType: freezed == quizType
          ? _value.quizType
          : quizType // ignore: cast_nullable_to_non_nullable
              as QuizTypes?,
      quizProcess: null == quizProcess
          ? _value.quizProcess
          : quizProcess // ignore: cast_nullable_to_non_nullable
              as QuizProcessType,
      quizRange: freezed == quizRange
          ? _value.quizRange
          : quizRange // ignore: cast_nullable_to_non_nullable
              as QuizRange?,
      seedText: freezed == seedText
          ? _value.seedText
          : seedText // ignore: cast_nullable_to_non_nullable
              as String?,
      playDate: null == playDate
          ? _value.playDate
          : playDate // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MonsterCopyWith<$Res>? get answer {
    if (_value.answer == null) {
      return null;
    }

    return $MonsterCopyWith<$Res>(_value.answer!, (value) {
      return _then(_value.copyWith(answer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizRangeCopyWith<$Res>? get quizRange {
    if (_value.quizRange == null) {
      return null;
    }

    return $QuizRangeCopyWith<$Res>(_value.quizRange!, (value) {
      return _then(_value.copyWith(quizRange: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuizInfoImplCopyWith<$Res>
    implements $QuizInfoCopyWith<$Res> {
  factory _$$QuizInfoImplCopyWith(
          _$QuizInfoImpl value, $Res Function(_$QuizInfoImpl) then) =
      __$$QuizInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Monster? answer,
      int maxAnswer,
      QuizTypes? quizType,
      QuizProcessType quizProcess,
      QuizRange? quizRange,
      String? seedText,
      int playDate});

  @override
  $MonsterCopyWith<$Res>? get answer;
  @override
  $QuizRangeCopyWith<$Res>? get quizRange;
}

/// @nodoc
class __$$QuizInfoImplCopyWithImpl<$Res>
    extends _$QuizInfoCopyWithImpl<$Res, _$QuizInfoImpl>
    implements _$$QuizInfoImplCopyWith<$Res> {
  __$$QuizInfoImplCopyWithImpl(
      _$QuizInfoImpl _value, $Res Function(_$QuizInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = freezed,
    Object? maxAnswer = null,
    Object? quizType = freezed,
    Object? quizProcess = null,
    Object? quizRange = freezed,
    Object? seedText = freezed,
    Object? playDate = null,
  }) {
    return _then(_$QuizInfoImpl(
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as Monster?,
      maxAnswer: null == maxAnswer
          ? _value.maxAnswer
          : maxAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      quizType: freezed == quizType
          ? _value.quizType
          : quizType // ignore: cast_nullable_to_non_nullable
              as QuizTypes?,
      quizProcess: null == quizProcess
          ? _value.quizProcess
          : quizProcess // ignore: cast_nullable_to_non_nullable
              as QuizProcessType,
      quizRange: freezed == quizRange
          ? _value.quizRange
          : quizRange // ignore: cast_nullable_to_non_nullable
              as QuizRange?,
      seedText: freezed == seedText
          ? _value.seedText
          : seedText // ignore: cast_nullable_to_non_nullable
              as String?,
      playDate: null == playDate
          ? _value.playDate
          : playDate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizInfoImpl with DiagnosticableTreeMixin implements _QuizInfo {
  const _$QuizInfoImpl(
      {this.answer,
      this.maxAnswer = 0,
      this.quizType,
      this.quizProcess = QuizProcessType.none,
      this.quizRange,
      this.seedText,
      this.playDate = 0});

  factory _$QuizInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizInfoImplFromJson(json);

  @override
  final Monster? answer;
  @override
  @JsonKey()
  final int maxAnswer;
  @override
  final QuizTypes? quizType;
  @override
  @JsonKey()
  final QuizProcessType quizProcess;
  @override
  final QuizRange? quizRange;
  @override
  final String? seedText;
  @override
  @JsonKey()
  final int playDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuizInfo(answer: $answer, maxAnswer: $maxAnswer, quizType: $quizType, quizProcess: $quizProcess, quizRange: $quizRange, seedText: $seedText, playDate: $playDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuizInfo'))
      ..add(DiagnosticsProperty('answer', answer))
      ..add(DiagnosticsProperty('maxAnswer', maxAnswer))
      ..add(DiagnosticsProperty('quizType', quizType))
      ..add(DiagnosticsProperty('quizProcess', quizProcess))
      ..add(DiagnosticsProperty('quizRange', quizRange))
      ..add(DiagnosticsProperty('seedText', seedText))
      ..add(DiagnosticsProperty('playDate', playDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizInfoImpl &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.maxAnswer, maxAnswer) ||
                other.maxAnswer == maxAnswer) &&
            (identical(other.quizType, quizType) ||
                other.quizType == quizType) &&
            (identical(other.quizProcess, quizProcess) ||
                other.quizProcess == quizProcess) &&
            (identical(other.quizRange, quizRange) ||
                other.quizRange == quizRange) &&
            (identical(other.seedText, seedText) ||
                other.seedText == seedText) &&
            (identical(other.playDate, playDate) ||
                other.playDate == playDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, answer, maxAnswer, quizType,
      quizProcess, quizRange, seedText, playDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizInfoImplCopyWith<_$QuizInfoImpl> get copyWith =>
      __$$QuizInfoImplCopyWithImpl<_$QuizInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizInfoImplToJson(
      this,
    );
  }
}

abstract class _QuizInfo implements QuizInfo {
  const factory _QuizInfo(
      {final Monster? answer,
      final int maxAnswer,
      final QuizTypes? quizType,
      final QuizProcessType quizProcess,
      final QuizRange? quizRange,
      final String? seedText,
      final int playDate}) = _$QuizInfoImpl;

  factory _QuizInfo.fromJson(Map<String, dynamic> json) =
      _$QuizInfoImpl.fromJson;

  @override
  Monster? get answer;
  @override
  int get maxAnswer;
  @override
  QuizTypes? get quizType;
  @override
  QuizProcessType get quizProcess;
  @override
  QuizRange? get quizRange;
  @override
  String? get seedText;
  @override
  int get playDate;
  @override
  @JsonKey(ignore: true)
  _$$QuizInfoImplCopyWith<_$QuizInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
