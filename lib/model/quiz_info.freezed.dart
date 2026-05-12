// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizInfo implements DiagnosticableTreeMixin {

 Monster? get answer; int get maxAnswer; QuizTypes? get quizType; QuizProcessType get quizProcess; QuizRange? get quizRange; String? get seedText; int get playDate;
/// Create a copy of QuizInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizInfoCopyWith<QuizInfo> get copyWith => _$QuizInfoCopyWithImpl<QuizInfo>(this as QuizInfo, _$identity);

  /// Serializes this QuizInfo to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QuizInfo'))
    ..add(DiagnosticsProperty('answer', answer))..add(DiagnosticsProperty('maxAnswer', maxAnswer))..add(DiagnosticsProperty('quizType', quizType))..add(DiagnosticsProperty('quizProcess', quizProcess))..add(DiagnosticsProperty('quizRange', quizRange))..add(DiagnosticsProperty('seedText', seedText))..add(DiagnosticsProperty('playDate', playDate));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizInfo&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.maxAnswer, maxAnswer) || other.maxAnswer == maxAnswer)&&(identical(other.quizType, quizType) || other.quizType == quizType)&&(identical(other.quizProcess, quizProcess) || other.quizProcess == quizProcess)&&(identical(other.quizRange, quizRange) || other.quizRange == quizRange)&&(identical(other.seedText, seedText) || other.seedText == seedText)&&(identical(other.playDate, playDate) || other.playDate == playDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,answer,maxAnswer,quizType,quizProcess,quizRange,seedText,playDate);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QuizInfo(answer: $answer, maxAnswer: $maxAnswer, quizType: $quizType, quizProcess: $quizProcess, quizRange: $quizRange, seedText: $seedText, playDate: $playDate)';
}


}

/// @nodoc
abstract mixin class $QuizInfoCopyWith<$Res>  {
  factory $QuizInfoCopyWith(QuizInfo value, $Res Function(QuizInfo) _then) = _$QuizInfoCopyWithImpl;
@useResult
$Res call({
 Monster? answer, int maxAnswer, QuizTypes? quizType, QuizProcessType quizProcess, QuizRange? quizRange, String? seedText, int playDate
});


$MonsterCopyWith<$Res>? get answer;$QuizRangeCopyWith<$Res>? get quizRange;

}
/// @nodoc
class _$QuizInfoCopyWithImpl<$Res>
    implements $QuizInfoCopyWith<$Res> {
  _$QuizInfoCopyWithImpl(this._self, this._then);

  final QuizInfo _self;
  final $Res Function(QuizInfo) _then;

/// Create a copy of QuizInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? answer = freezed,Object? maxAnswer = null,Object? quizType = freezed,Object? quizProcess = null,Object? quizRange = freezed,Object? seedText = freezed,Object? playDate = null,}) {
  return _then(_self.copyWith(
answer: freezed == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as Monster?,maxAnswer: null == maxAnswer ? _self.maxAnswer : maxAnswer // ignore: cast_nullable_to_non_nullable
as int,quizType: freezed == quizType ? _self.quizType : quizType // ignore: cast_nullable_to_non_nullable
as QuizTypes?,quizProcess: null == quizProcess ? _self.quizProcess : quizProcess // ignore: cast_nullable_to_non_nullable
as QuizProcessType,quizRange: freezed == quizRange ? _self.quizRange : quizRange // ignore: cast_nullable_to_non_nullable
as QuizRange?,seedText: freezed == seedText ? _self.seedText : seedText // ignore: cast_nullable_to_non_nullable
as String?,playDate: null == playDate ? _self.playDate : playDate // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of QuizInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonsterCopyWith<$Res>? get answer {
    if (_self.answer == null) {
    return null;
  }

  return $MonsterCopyWith<$Res>(_self.answer!, (value) {
    return _then(_self.copyWith(answer: value));
  });
}/// Create a copy of QuizInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuizRangeCopyWith<$Res>? get quizRange {
    if (_self.quizRange == null) {
    return null;
  }

  return $QuizRangeCopyWith<$Res>(_self.quizRange!, (value) {
    return _then(_self.copyWith(quizRange: value));
  });
}
}


/// Adds pattern-matching-related methods to [QuizInfo].
extension QuizInfoPatterns on QuizInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizInfo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizInfo value)  $default,){
final _that = this;
switch (_that) {
case _QuizInfo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizInfo value)?  $default,){
final _that = this;
switch (_that) {
case _QuizInfo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Monster? answer,  int maxAnswer,  QuizTypes? quizType,  QuizProcessType quizProcess,  QuizRange? quizRange,  String? seedText,  int playDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizInfo() when $default != null:
return $default(_that.answer,_that.maxAnswer,_that.quizType,_that.quizProcess,_that.quizRange,_that.seedText,_that.playDate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Monster? answer,  int maxAnswer,  QuizTypes? quizType,  QuizProcessType quizProcess,  QuizRange? quizRange,  String? seedText,  int playDate)  $default,) {final _that = this;
switch (_that) {
case _QuizInfo():
return $default(_that.answer,_that.maxAnswer,_that.quizType,_that.quizProcess,_that.quizRange,_that.seedText,_that.playDate);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Monster? answer,  int maxAnswer,  QuizTypes? quizType,  QuizProcessType quizProcess,  QuizRange? quizRange,  String? seedText,  int playDate)?  $default,) {final _that = this;
switch (_that) {
case _QuizInfo() when $default != null:
return $default(_that.answer,_that.maxAnswer,_that.quizType,_that.quizProcess,_that.quizRange,_that.seedText,_that.playDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizInfo with DiagnosticableTreeMixin implements QuizInfo {
  const _QuizInfo({this.answer, this.maxAnswer = 0, this.quizType, this.quizProcess = QuizProcessType.none, this.quizRange, this.seedText, this.playDate = 0});
  factory _QuizInfo.fromJson(Map<String, dynamic> json) => _$QuizInfoFromJson(json);

@override final  Monster? answer;
@override@JsonKey() final  int maxAnswer;
@override final  QuizTypes? quizType;
@override@JsonKey() final  QuizProcessType quizProcess;
@override final  QuizRange? quizRange;
@override final  String? seedText;
@override@JsonKey() final  int playDate;

/// Create a copy of QuizInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizInfoCopyWith<_QuizInfo> get copyWith => __$QuizInfoCopyWithImpl<_QuizInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizInfoToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QuizInfo'))
    ..add(DiagnosticsProperty('answer', answer))..add(DiagnosticsProperty('maxAnswer', maxAnswer))..add(DiagnosticsProperty('quizType', quizType))..add(DiagnosticsProperty('quizProcess', quizProcess))..add(DiagnosticsProperty('quizRange', quizRange))..add(DiagnosticsProperty('seedText', seedText))..add(DiagnosticsProperty('playDate', playDate));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizInfo&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.maxAnswer, maxAnswer) || other.maxAnswer == maxAnswer)&&(identical(other.quizType, quizType) || other.quizType == quizType)&&(identical(other.quizProcess, quizProcess) || other.quizProcess == quizProcess)&&(identical(other.quizRange, quizRange) || other.quizRange == quizRange)&&(identical(other.seedText, seedText) || other.seedText == seedText)&&(identical(other.playDate, playDate) || other.playDate == playDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,answer,maxAnswer,quizType,quizProcess,quizRange,seedText,playDate);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QuizInfo(answer: $answer, maxAnswer: $maxAnswer, quizType: $quizType, quizProcess: $quizProcess, quizRange: $quizRange, seedText: $seedText, playDate: $playDate)';
}


}

/// @nodoc
abstract mixin class _$QuizInfoCopyWith<$Res> implements $QuizInfoCopyWith<$Res> {
  factory _$QuizInfoCopyWith(_QuizInfo value, $Res Function(_QuizInfo) _then) = __$QuizInfoCopyWithImpl;
@override @useResult
$Res call({
 Monster? answer, int maxAnswer, QuizTypes? quizType, QuizProcessType quizProcess, QuizRange? quizRange, String? seedText, int playDate
});


@override $MonsterCopyWith<$Res>? get answer;@override $QuizRangeCopyWith<$Res>? get quizRange;

}
/// @nodoc
class __$QuizInfoCopyWithImpl<$Res>
    implements _$QuizInfoCopyWith<$Res> {
  __$QuizInfoCopyWithImpl(this._self, this._then);

  final _QuizInfo _self;
  final $Res Function(_QuizInfo) _then;

/// Create a copy of QuizInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? answer = freezed,Object? maxAnswer = null,Object? quizType = freezed,Object? quizProcess = null,Object? quizRange = freezed,Object? seedText = freezed,Object? playDate = null,}) {
  return _then(_QuizInfo(
answer: freezed == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as Monster?,maxAnswer: null == maxAnswer ? _self.maxAnswer : maxAnswer // ignore: cast_nullable_to_non_nullable
as int,quizType: freezed == quizType ? _self.quizType : quizType // ignore: cast_nullable_to_non_nullable
as QuizTypes?,quizProcess: null == quizProcess ? _self.quizProcess : quizProcess // ignore: cast_nullable_to_non_nullable
as QuizProcessType,quizRange: freezed == quizRange ? _self.quizRange : quizRange // ignore: cast_nullable_to_non_nullable
as QuizRange?,seedText: freezed == seedText ? _self.seedText : seedText // ignore: cast_nullable_to_non_nullable
as String?,playDate: null == playDate ? _self.playDate : playDate // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of QuizInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonsterCopyWith<$Res>? get answer {
    if (_self.answer == null) {
    return null;
  }

  return $MonsterCopyWith<$Res>(_self.answer!, (value) {
    return _then(_self.copyWith(answer: value));
  });
}/// Create a copy of QuizInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuizRangeCopyWith<$Res>? get quizRange {
    if (_self.quizRange == null) {
    return null;
  }

  return $QuizRangeCopyWith<$Res>(_self.quizRange!, (value) {
    return _then(_self.copyWith(quizRange: value));
  });
}
}

// dart format on
