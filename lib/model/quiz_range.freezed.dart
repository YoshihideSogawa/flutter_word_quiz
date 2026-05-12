// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizRange implements DiagnosticableTreeMixin {

 int get id; int get maxNo; String? get displayName;
/// Create a copy of QuizRange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizRangeCopyWith<QuizRange> get copyWith => _$QuizRangeCopyWithImpl<QuizRange>(this as QuizRange, _$identity);

  /// Serializes this QuizRange to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QuizRange'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('maxNo', maxNo))..add(DiagnosticsProperty('displayName', displayName));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizRange&&(identical(other.id, id) || other.id == id)&&(identical(other.maxNo, maxNo) || other.maxNo == maxNo)&&(identical(other.displayName, displayName) || other.displayName == displayName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,maxNo,displayName);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QuizRange(id: $id, maxNo: $maxNo, displayName: $displayName)';
}


}

/// @nodoc
abstract mixin class $QuizRangeCopyWith<$Res>  {
  factory $QuizRangeCopyWith(QuizRange value, $Res Function(QuizRange) _then) = _$QuizRangeCopyWithImpl;
@useResult
$Res call({
 int id, int maxNo, String? displayName
});




}
/// @nodoc
class _$QuizRangeCopyWithImpl<$Res>
    implements $QuizRangeCopyWith<$Res> {
  _$QuizRangeCopyWithImpl(this._self, this._then);

  final QuizRange _self;
  final $Res Function(QuizRange) _then;

/// Create a copy of QuizRange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? maxNo = null,Object? displayName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,maxNo: null == maxNo ? _self.maxNo : maxNo // ignore: cast_nullable_to_non_nullable
as int,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizRange].
extension QuizRangePatterns on QuizRange {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizRange value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizRange() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizRange value)  $default,){
final _that = this;
switch (_that) {
case _QuizRange():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizRange value)?  $default,){
final _that = this;
switch (_that) {
case _QuizRange() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int maxNo,  String? displayName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizRange() when $default != null:
return $default(_that.id,_that.maxNo,_that.displayName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int maxNo,  String? displayName)  $default,) {final _that = this;
switch (_that) {
case _QuizRange():
return $default(_that.id,_that.maxNo,_that.displayName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int maxNo,  String? displayName)?  $default,) {final _that = this;
switch (_that) {
case _QuizRange() when $default != null:
return $default(_that.id,_that.maxNo,_that.displayName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizRange with DiagnosticableTreeMixin implements QuizRange {
  const _QuizRange({this.id = 0, this.maxNo = 0, this.displayName});
  factory _QuizRange.fromJson(Map<String, dynamic> json) => _$QuizRangeFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  int maxNo;
@override final  String? displayName;

/// Create a copy of QuizRange
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizRangeCopyWith<_QuizRange> get copyWith => __$QuizRangeCopyWithImpl<_QuizRange>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizRangeToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QuizRange'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('maxNo', maxNo))..add(DiagnosticsProperty('displayName', displayName));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizRange&&(identical(other.id, id) || other.id == id)&&(identical(other.maxNo, maxNo) || other.maxNo == maxNo)&&(identical(other.displayName, displayName) || other.displayName == displayName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,maxNo,displayName);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QuizRange(id: $id, maxNo: $maxNo, displayName: $displayName)';
}


}

/// @nodoc
abstract mixin class _$QuizRangeCopyWith<$Res> implements $QuizRangeCopyWith<$Res> {
  factory _$QuizRangeCopyWith(_QuizRange value, $Res Function(_QuizRange) _then) = __$QuizRangeCopyWithImpl;
@override @useResult
$Res call({
 int id, int maxNo, String? displayName
});




}
/// @nodoc
class __$QuizRangeCopyWithImpl<$Res>
    implements _$QuizRangeCopyWith<$Res> {
  __$QuizRangeCopyWithImpl(this._self, this._then);

  final _QuizRange _self;
  final $Res Function(_QuizRange) _then;

/// Create a copy of QuizRange
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? maxNo = null,Object? displayName = freezed,}) {
  return _then(_QuizRange(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,maxNo: null == maxNo ? _self.maxNo : maxNo // ignore: cast_nullable_to_non_nullable
as int,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
