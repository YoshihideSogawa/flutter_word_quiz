// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_page_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizPageInfo implements DiagnosticableTreeMixin {

 bool get showAnswer; bool get showStatistics; bool get normalKeyboard; bool get showQuizSelection; bool get showResult; bool get showQuizChanged;
/// Create a copy of QuizPageInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizPageInfoCopyWith<QuizPageInfo> get copyWith => _$QuizPageInfoCopyWithImpl<QuizPageInfo>(this as QuizPageInfo, _$identity);

  /// Serializes this QuizPageInfo to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QuizPageInfo'))
    ..add(DiagnosticsProperty('showAnswer', showAnswer))..add(DiagnosticsProperty('showStatistics', showStatistics))..add(DiagnosticsProperty('normalKeyboard', normalKeyboard))..add(DiagnosticsProperty('showQuizSelection', showQuizSelection))..add(DiagnosticsProperty('showResult', showResult))..add(DiagnosticsProperty('showQuizChanged', showQuizChanged));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizPageInfo&&(identical(other.showAnswer, showAnswer) || other.showAnswer == showAnswer)&&(identical(other.showStatistics, showStatistics) || other.showStatistics == showStatistics)&&(identical(other.normalKeyboard, normalKeyboard) || other.normalKeyboard == normalKeyboard)&&(identical(other.showQuizSelection, showQuizSelection) || other.showQuizSelection == showQuizSelection)&&(identical(other.showResult, showResult) || other.showResult == showResult)&&(identical(other.showQuizChanged, showQuizChanged) || other.showQuizChanged == showQuizChanged));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,showAnswer,showStatistics,normalKeyboard,showQuizSelection,showResult,showQuizChanged);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QuizPageInfo(showAnswer: $showAnswer, showStatistics: $showStatistics, normalKeyboard: $normalKeyboard, showQuizSelection: $showQuizSelection, showResult: $showResult, showQuizChanged: $showQuizChanged)';
}


}

/// @nodoc
abstract mixin class $QuizPageInfoCopyWith<$Res>  {
  factory $QuizPageInfoCopyWith(QuizPageInfo value, $Res Function(QuizPageInfo) _then) = _$QuizPageInfoCopyWithImpl;
@useResult
$Res call({
 bool showAnswer, bool showStatistics, bool normalKeyboard, bool showQuizSelection, bool showResult, bool showQuizChanged
});




}
/// @nodoc
class _$QuizPageInfoCopyWithImpl<$Res>
    implements $QuizPageInfoCopyWith<$Res> {
  _$QuizPageInfoCopyWithImpl(this._self, this._then);

  final QuizPageInfo _self;
  final $Res Function(QuizPageInfo) _then;

/// Create a copy of QuizPageInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? showAnswer = null,Object? showStatistics = null,Object? normalKeyboard = null,Object? showQuizSelection = null,Object? showResult = null,Object? showQuizChanged = null,}) {
  return _then(_self.copyWith(
showAnswer: null == showAnswer ? _self.showAnswer : showAnswer // ignore: cast_nullable_to_non_nullable
as bool,showStatistics: null == showStatistics ? _self.showStatistics : showStatistics // ignore: cast_nullable_to_non_nullable
as bool,normalKeyboard: null == normalKeyboard ? _self.normalKeyboard : normalKeyboard // ignore: cast_nullable_to_non_nullable
as bool,showQuizSelection: null == showQuizSelection ? _self.showQuizSelection : showQuizSelection // ignore: cast_nullable_to_non_nullable
as bool,showResult: null == showResult ? _self.showResult : showResult // ignore: cast_nullable_to_non_nullable
as bool,showQuizChanged: null == showQuizChanged ? _self.showQuizChanged : showQuizChanged // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizPageInfo].
extension QuizPageInfoPatterns on QuizPageInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizPageInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizPageInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizPageInfo value)  $default,){
final _that = this;
switch (_that) {
case _QuizPageInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizPageInfo value)?  $default,){
final _that = this;
switch (_that) {
case _QuizPageInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool showAnswer,  bool showStatistics,  bool normalKeyboard,  bool showQuizSelection,  bool showResult,  bool showQuizChanged)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizPageInfo() when $default != null:
return $default(_that.showAnswer,_that.showStatistics,_that.normalKeyboard,_that.showQuizSelection,_that.showResult,_that.showQuizChanged);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool showAnswer,  bool showStatistics,  bool normalKeyboard,  bool showQuizSelection,  bool showResult,  bool showQuizChanged)  $default,) {final _that = this;
switch (_that) {
case _QuizPageInfo():
return $default(_that.showAnswer,_that.showStatistics,_that.normalKeyboard,_that.showQuizSelection,_that.showResult,_that.showQuizChanged);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool showAnswer,  bool showStatistics,  bool normalKeyboard,  bool showQuizSelection,  bool showResult,  bool showQuizChanged)?  $default,) {final _that = this;
switch (_that) {
case _QuizPageInfo() when $default != null:
return $default(_that.showAnswer,_that.showStatistics,_that.normalKeyboard,_that.showQuizSelection,_that.showResult,_that.showQuizChanged);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizPageInfo with DiagnosticableTreeMixin implements QuizPageInfo {
  const _QuizPageInfo({this.showAnswer = false, this.showStatistics = false, this.normalKeyboard = true, this.showQuizSelection = false, this.showResult = false, this.showQuizChanged = false});
  factory _QuizPageInfo.fromJson(Map<String, dynamic> json) => _$QuizPageInfoFromJson(json);

@override@JsonKey() final  bool showAnswer;
@override@JsonKey() final  bool showStatistics;
@override@JsonKey() final  bool normalKeyboard;
@override@JsonKey() final  bool showQuizSelection;
@override@JsonKey() final  bool showResult;
@override@JsonKey() final  bool showQuizChanged;

/// Create a copy of QuizPageInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizPageInfoCopyWith<_QuizPageInfo> get copyWith => __$QuizPageInfoCopyWithImpl<_QuizPageInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizPageInfoToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QuizPageInfo'))
    ..add(DiagnosticsProperty('showAnswer', showAnswer))..add(DiagnosticsProperty('showStatistics', showStatistics))..add(DiagnosticsProperty('normalKeyboard', normalKeyboard))..add(DiagnosticsProperty('showQuizSelection', showQuizSelection))..add(DiagnosticsProperty('showResult', showResult))..add(DiagnosticsProperty('showQuizChanged', showQuizChanged));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizPageInfo&&(identical(other.showAnswer, showAnswer) || other.showAnswer == showAnswer)&&(identical(other.showStatistics, showStatistics) || other.showStatistics == showStatistics)&&(identical(other.normalKeyboard, normalKeyboard) || other.normalKeyboard == normalKeyboard)&&(identical(other.showQuizSelection, showQuizSelection) || other.showQuizSelection == showQuizSelection)&&(identical(other.showResult, showResult) || other.showResult == showResult)&&(identical(other.showQuizChanged, showQuizChanged) || other.showQuizChanged == showQuizChanged));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,showAnswer,showStatistics,normalKeyboard,showQuizSelection,showResult,showQuizChanged);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QuizPageInfo(showAnswer: $showAnswer, showStatistics: $showStatistics, normalKeyboard: $normalKeyboard, showQuizSelection: $showQuizSelection, showResult: $showResult, showQuizChanged: $showQuizChanged)';
}


}

/// @nodoc
abstract mixin class _$QuizPageInfoCopyWith<$Res> implements $QuizPageInfoCopyWith<$Res> {
  factory _$QuizPageInfoCopyWith(_QuizPageInfo value, $Res Function(_QuizPageInfo) _then) = __$QuizPageInfoCopyWithImpl;
@override @useResult
$Res call({
 bool showAnswer, bool showStatistics, bool normalKeyboard, bool showQuizSelection, bool showResult, bool showQuizChanged
});




}
/// @nodoc
class __$QuizPageInfoCopyWithImpl<$Res>
    implements _$QuizPageInfoCopyWith<$Res> {
  __$QuizPageInfoCopyWithImpl(this._self, this._then);

  final _QuizPageInfo _self;
  final $Res Function(_QuizPageInfo) _then;

/// Create a copy of QuizPageInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? showAnswer = null,Object? showStatistics = null,Object? normalKeyboard = null,Object? showQuizSelection = null,Object? showResult = null,Object? showQuizChanged = null,}) {
  return _then(_QuizPageInfo(
showAnswer: null == showAnswer ? _self.showAnswer : showAnswer // ignore: cast_nullable_to_non_nullable
as bool,showStatistics: null == showStatistics ? _self.showStatistics : showStatistics // ignore: cast_nullable_to_non_nullable
as bool,normalKeyboard: null == normalKeyboard ? _self.normalKeyboard : normalKeyboard // ignore: cast_nullable_to_non_nullable
as bool,showQuizSelection: null == showQuizSelection ? _self.showQuizSelection : showQuizSelection // ignore: cast_nullable_to_non_nullable
as bool,showResult: null == showResult ? _self.showResult : showResult // ignore: cast_nullable_to_non_nullable
as bool,showQuizChanged: null == showQuizChanged ? _self.showQuizChanged : showQuizChanged // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
