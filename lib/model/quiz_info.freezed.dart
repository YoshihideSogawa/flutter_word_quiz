// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quiz_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizInfo _$QuizInfoFromJson(Map<String, dynamic> json) {
  return _QuizInfo.fromJson(json);
}

/// @nodoc
class _$QuizInfoTearOff {
  const _$QuizInfoTearOff();

  _QuizInfo call(
      {Monster? answer,
      int maxAnswer = 0,
      QuizTypes? quizType,
      QuizProcessType quizProcess = QuizProcessType.none,
      QuizRange? quizRange,
      String? seedText,
      int playDate = 0}) {
    return _QuizInfo(
      answer: answer,
      maxAnswer: maxAnswer,
      quizType: quizType,
      quizProcess: quizProcess,
      quizRange: quizRange,
      seedText: seedText,
      playDate: playDate,
    );
  }

  QuizInfo fromJson(Map<String, Object?> json) {
    return QuizInfo.fromJson(json);
  }
}

/// @nodoc
const $QuizInfo = _$QuizInfoTearOff();

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
      _$QuizInfoCopyWithImpl<$Res>;
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
class _$QuizInfoCopyWithImpl<$Res> implements $QuizInfoCopyWith<$Res> {
  _$QuizInfoCopyWithImpl(this._value, this._then);

  final QuizInfo _value;
  // ignore: unused_field
  final $Res Function(QuizInfo) _then;

  @override
  $Res call({
    Object? answer = freezed,
    Object? maxAnswer = freezed,
    Object? quizType = freezed,
    Object? quizProcess = freezed,
    Object? quizRange = freezed,
    Object? seedText = freezed,
    Object? playDate = freezed,
  }) {
    return _then(_value.copyWith(
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as Monster?,
      maxAnswer: maxAnswer == freezed
          ? _value.maxAnswer
          : maxAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      quizType: quizType == freezed
          ? _value.quizType
          : quizType // ignore: cast_nullable_to_non_nullable
              as QuizTypes?,
      quizProcess: quizProcess == freezed
          ? _value.quizProcess
          : quizProcess // ignore: cast_nullable_to_non_nullable
              as QuizProcessType,
      quizRange: quizRange == freezed
          ? _value.quizRange
          : quizRange // ignore: cast_nullable_to_non_nullable
              as QuizRange?,
      seedText: seedText == freezed
          ? _value.seedText
          : seedText // ignore: cast_nullable_to_non_nullable
              as String?,
      playDate: playDate == freezed
          ? _value.playDate
          : playDate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $MonsterCopyWith<$Res>? get answer {
    if (_value.answer == null) {
      return null;
    }

    return $MonsterCopyWith<$Res>(_value.answer!, (value) {
      return _then(_value.copyWith(answer: value));
    });
  }

  @override
  $QuizRangeCopyWith<$Res>? get quizRange {
    if (_value.quizRange == null) {
      return null;
    }

    return $QuizRangeCopyWith<$Res>(_value.quizRange!, (value) {
      return _then(_value.copyWith(quizRange: value));
    });
  }
}

/// @nodoc
abstract class _$QuizInfoCopyWith<$Res> implements $QuizInfoCopyWith<$Res> {
  factory _$QuizInfoCopyWith(_QuizInfo value, $Res Function(_QuizInfo) then) =
      __$QuizInfoCopyWithImpl<$Res>;
  @override
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
class __$QuizInfoCopyWithImpl<$Res> extends _$QuizInfoCopyWithImpl<$Res>
    implements _$QuizInfoCopyWith<$Res> {
  __$QuizInfoCopyWithImpl(_QuizInfo _value, $Res Function(_QuizInfo) _then)
      : super(_value, (v) => _then(v as _QuizInfo));

  @override
  _QuizInfo get _value => super._value as _QuizInfo;

  @override
  $Res call({
    Object? answer = freezed,
    Object? maxAnswer = freezed,
    Object? quizType = freezed,
    Object? quizProcess = freezed,
    Object? quizRange = freezed,
    Object? seedText = freezed,
    Object? playDate = freezed,
  }) {
    return _then(_QuizInfo(
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as Monster?,
      maxAnswer: maxAnswer == freezed
          ? _value.maxAnswer
          : maxAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      quizType: quizType == freezed
          ? _value.quizType
          : quizType // ignore: cast_nullable_to_non_nullable
              as QuizTypes?,
      quizProcess: quizProcess == freezed
          ? _value.quizProcess
          : quizProcess // ignore: cast_nullable_to_non_nullable
              as QuizProcessType,
      quizRange: quizRange == freezed
          ? _value.quizRange
          : quizRange // ignore: cast_nullable_to_non_nullable
              as QuizRange?,
      seedText: seedText == freezed
          ? _value.seedText
          : seedText // ignore: cast_nullable_to_non_nullable
              as String?,
      playDate: playDate == freezed
          ? _value.playDate
          : playDate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizInfo with DiagnosticableTreeMixin implements _QuizInfo {
  const _$_QuizInfo(
      {this.answer,
      this.maxAnswer = 0,
      this.quizType,
      this.quizProcess = QuizProcessType.none,
      this.quizRange,
      this.seedText,
      this.playDate = 0});

  factory _$_QuizInfo.fromJson(Map<String, dynamic> json) =>
      _$$_QuizInfoFromJson(json);

  @override
  final Monster? answer;
  @JsonKey()
  @override
  final int maxAnswer;
  @override
  final QuizTypes? quizType;
  @JsonKey()
  @override
  final QuizProcessType quizProcess;
  @override
  final QuizRange? quizRange;
  @override
  final String? seedText;
  @JsonKey()
  @override
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
            other is _QuizInfo &&
            const DeepCollectionEquality().equals(other.answer, answer) &&
            const DeepCollectionEquality().equals(other.maxAnswer, maxAnswer) &&
            const DeepCollectionEquality().equals(other.quizType, quizType) &&
            const DeepCollectionEquality()
                .equals(other.quizProcess, quizProcess) &&
            const DeepCollectionEquality().equals(other.quizRange, quizRange) &&
            const DeepCollectionEquality().equals(other.seedText, seedText) &&
            const DeepCollectionEquality().equals(other.playDate, playDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(answer),
      const DeepCollectionEquality().hash(maxAnswer),
      const DeepCollectionEquality().hash(quizType),
      const DeepCollectionEquality().hash(quizProcess),
      const DeepCollectionEquality().hash(quizRange),
      const DeepCollectionEquality().hash(seedText),
      const DeepCollectionEquality().hash(playDate));

  @JsonKey(ignore: true)
  @override
  _$QuizInfoCopyWith<_QuizInfo> get copyWith =>
      __$QuizInfoCopyWithImpl<_QuizInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizInfoToJson(this);
  }
}

abstract class _QuizInfo implements QuizInfo {
  const factory _QuizInfo(
      {Monster? answer,
      int maxAnswer,
      QuizTypes? quizType,
      QuizProcessType quizProcess,
      QuizRange? quizRange,
      String? seedText,
      int playDate}) = _$_QuizInfo;

  factory _QuizInfo.fromJson(Map<String, dynamic> json) = _$_QuizInfo.fromJson;

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
  _$QuizInfoCopyWith<_QuizInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
