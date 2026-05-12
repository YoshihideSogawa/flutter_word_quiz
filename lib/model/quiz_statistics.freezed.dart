// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizStatistics implements DiagnosticableTreeMixin {

 int get clearCount; int get currentChain; int get lastChain; int get maxChain; int get playCount;
/// Create a copy of QuizStatistics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizStatisticsCopyWith<QuizStatistics> get copyWith => _$QuizStatisticsCopyWithImpl<QuizStatistics>(this as QuizStatistics, _$identity);

  /// Serializes this QuizStatistics to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QuizStatistics'))
    ..add(DiagnosticsProperty('clearCount', clearCount))..add(DiagnosticsProperty('currentChain', currentChain))..add(DiagnosticsProperty('lastChain', lastChain))..add(DiagnosticsProperty('maxChain', maxChain))..add(DiagnosticsProperty('playCount', playCount));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizStatistics&&(identical(other.clearCount, clearCount) || other.clearCount == clearCount)&&(identical(other.currentChain, currentChain) || other.currentChain == currentChain)&&(identical(other.lastChain, lastChain) || other.lastChain == lastChain)&&(identical(other.maxChain, maxChain) || other.maxChain == maxChain)&&(identical(other.playCount, playCount) || other.playCount == playCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clearCount,currentChain,lastChain,maxChain,playCount);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QuizStatistics(clearCount: $clearCount, currentChain: $currentChain, lastChain: $lastChain, maxChain: $maxChain, playCount: $playCount)';
}


}

/// @nodoc
abstract mixin class $QuizStatisticsCopyWith<$Res>  {
  factory $QuizStatisticsCopyWith(QuizStatistics value, $Res Function(QuizStatistics) _then) = _$QuizStatisticsCopyWithImpl;
@useResult
$Res call({
 int clearCount, int currentChain, int lastChain, int maxChain, int playCount
});




}
/// @nodoc
class _$QuizStatisticsCopyWithImpl<$Res>
    implements $QuizStatisticsCopyWith<$Res> {
  _$QuizStatisticsCopyWithImpl(this._self, this._then);

  final QuizStatistics _self;
  final $Res Function(QuizStatistics) _then;

/// Create a copy of QuizStatistics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clearCount = null,Object? currentChain = null,Object? lastChain = null,Object? maxChain = null,Object? playCount = null,}) {
  return _then(_self.copyWith(
clearCount: null == clearCount ? _self.clearCount : clearCount // ignore: cast_nullable_to_non_nullable
as int,currentChain: null == currentChain ? _self.currentChain : currentChain // ignore: cast_nullable_to_non_nullable
as int,lastChain: null == lastChain ? _self.lastChain : lastChain // ignore: cast_nullable_to_non_nullable
as int,maxChain: null == maxChain ? _self.maxChain : maxChain // ignore: cast_nullable_to_non_nullable
as int,playCount: null == playCount ? _self.playCount : playCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizStatistics].
extension QuizStatisticsPatterns on QuizStatistics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizStatistics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizStatistics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizStatistics value)  $default,){
final _that = this;
switch (_that) {
case _QuizStatistics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizStatistics value)?  $default,){
final _that = this;
switch (_that) {
case _QuizStatistics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int clearCount,  int currentChain,  int lastChain,  int maxChain,  int playCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizStatistics() when $default != null:
return $default(_that.clearCount,_that.currentChain,_that.lastChain,_that.maxChain,_that.playCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int clearCount,  int currentChain,  int lastChain,  int maxChain,  int playCount)  $default,) {final _that = this;
switch (_that) {
case _QuizStatistics():
return $default(_that.clearCount,_that.currentChain,_that.lastChain,_that.maxChain,_that.playCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int clearCount,  int currentChain,  int lastChain,  int maxChain,  int playCount)?  $default,) {final _that = this;
switch (_that) {
case _QuizStatistics() when $default != null:
return $default(_that.clearCount,_that.currentChain,_that.lastChain,_that.maxChain,_that.playCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizStatistics with DiagnosticableTreeMixin implements QuizStatistics {
  const _QuizStatistics({this.clearCount = 0, this.currentChain = 0, this.lastChain = 0, this.maxChain = 0, this.playCount = 0});
  factory _QuizStatistics.fromJson(Map<String, dynamic> json) => _$QuizStatisticsFromJson(json);

@override@JsonKey() final  int clearCount;
@override@JsonKey() final  int currentChain;
@override@JsonKey() final  int lastChain;
@override@JsonKey() final  int maxChain;
@override@JsonKey() final  int playCount;

/// Create a copy of QuizStatistics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizStatisticsCopyWith<_QuizStatistics> get copyWith => __$QuizStatisticsCopyWithImpl<_QuizStatistics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizStatisticsToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QuizStatistics'))
    ..add(DiagnosticsProperty('clearCount', clearCount))..add(DiagnosticsProperty('currentChain', currentChain))..add(DiagnosticsProperty('lastChain', lastChain))..add(DiagnosticsProperty('maxChain', maxChain))..add(DiagnosticsProperty('playCount', playCount));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizStatistics&&(identical(other.clearCount, clearCount) || other.clearCount == clearCount)&&(identical(other.currentChain, currentChain) || other.currentChain == currentChain)&&(identical(other.lastChain, lastChain) || other.lastChain == lastChain)&&(identical(other.maxChain, maxChain) || other.maxChain == maxChain)&&(identical(other.playCount, playCount) || other.playCount == playCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clearCount,currentChain,lastChain,maxChain,playCount);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QuizStatistics(clearCount: $clearCount, currentChain: $currentChain, lastChain: $lastChain, maxChain: $maxChain, playCount: $playCount)';
}


}

/// @nodoc
abstract mixin class _$QuizStatisticsCopyWith<$Res> implements $QuizStatisticsCopyWith<$Res> {
  factory _$QuizStatisticsCopyWith(_QuizStatistics value, $Res Function(_QuizStatistics) _then) = __$QuizStatisticsCopyWithImpl;
@override @useResult
$Res call({
 int clearCount, int currentChain, int lastChain, int maxChain, int playCount
});




}
/// @nodoc
class __$QuizStatisticsCopyWithImpl<$Res>
    implements _$QuizStatisticsCopyWith<$Res> {
  __$QuizStatisticsCopyWithImpl(this._self, this._then);

  final _QuizStatistics _self;
  final $Res Function(_QuizStatistics) _then;

/// Create a copy of QuizStatistics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clearCount = null,Object? currentChain = null,Object? lastChain = null,Object? maxChain = null,Object? playCount = null,}) {
  return _then(_QuizStatistics(
clearCount: null == clearCount ? _self.clearCount : clearCount // ignore: cast_nullable_to_non_nullable
as int,currentChain: null == currentChain ? _self.currentChain : currentChain // ignore: cast_nullable_to_non_nullable
as int,lastChain: null == lastChain ? _self.lastChain : lastChain // ignore: cast_nullable_to_non_nullable
as int,maxChain: null == maxChain ? _self.maxChain : maxChain // ignore: cast_nullable_to_non_nullable
as int,playCount: null == playCount ? _self.playCount : playCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
