// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_page_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SplashPageInfo implements DiagnosticableTreeMixin {

 bool get showRule;
/// Create a copy of SplashPageInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplashPageInfoCopyWith<SplashPageInfo> get copyWith => _$SplashPageInfoCopyWithImpl<SplashPageInfo>(this as SplashPageInfo, _$identity);

  /// Serializes this SplashPageInfo to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SplashPageInfo'))
    ..add(DiagnosticsProperty('showRule', showRule));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashPageInfo&&(identical(other.showRule, showRule) || other.showRule == showRule));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,showRule);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SplashPageInfo(showRule: $showRule)';
}


}

/// @nodoc
abstract mixin class $SplashPageInfoCopyWith<$Res>  {
  factory $SplashPageInfoCopyWith(SplashPageInfo value, $Res Function(SplashPageInfo) _then) = _$SplashPageInfoCopyWithImpl;
@useResult
$Res call({
 bool showRule
});




}
/// @nodoc
class _$SplashPageInfoCopyWithImpl<$Res>
    implements $SplashPageInfoCopyWith<$Res> {
  _$SplashPageInfoCopyWithImpl(this._self, this._then);

  final SplashPageInfo _self;
  final $Res Function(SplashPageInfo) _then;

/// Create a copy of SplashPageInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? showRule = null,}) {
  return _then(_self.copyWith(
showRule: null == showRule ? _self.showRule : showRule // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SplashPageInfo].
extension SplashPageInfoPatterns on SplashPageInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SplashPageInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SplashPageInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SplashPageInfo value)  $default,){
final _that = this;
switch (_that) {
case _SplashPageInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SplashPageInfo value)?  $default,){
final _that = this;
switch (_that) {
case _SplashPageInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool showRule)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SplashPageInfo() when $default != null:
return $default(_that.showRule);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool showRule)  $default,) {final _that = this;
switch (_that) {
case _SplashPageInfo():
return $default(_that.showRule);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool showRule)?  $default,) {final _that = this;
switch (_that) {
case _SplashPageInfo() when $default != null:
return $default(_that.showRule);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SplashPageInfo with DiagnosticableTreeMixin implements SplashPageInfo {
  const _SplashPageInfo({this.showRule = false});
  factory _SplashPageInfo.fromJson(Map<String, dynamic> json) => _$SplashPageInfoFromJson(json);

@override@JsonKey() final  bool showRule;

/// Create a copy of SplashPageInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SplashPageInfoCopyWith<_SplashPageInfo> get copyWith => __$SplashPageInfoCopyWithImpl<_SplashPageInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SplashPageInfoToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SplashPageInfo'))
    ..add(DiagnosticsProperty('showRule', showRule));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplashPageInfo&&(identical(other.showRule, showRule) || other.showRule == showRule));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,showRule);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SplashPageInfo(showRule: $showRule)';
}


}

/// @nodoc
abstract mixin class _$SplashPageInfoCopyWith<$Res> implements $SplashPageInfoCopyWith<$Res> {
  factory _$SplashPageInfoCopyWith(_SplashPageInfo value, $Res Function(_SplashPageInfo) _then) = __$SplashPageInfoCopyWithImpl;
@override @useResult
$Res call({
 bool showRule
});




}
/// @nodoc
class __$SplashPageInfoCopyWithImpl<$Res>
    implements _$SplashPageInfoCopyWith<$Res> {
  __$SplashPageInfoCopyWithImpl(this._self, this._then);

  final _SplashPageInfo _self;
  final $Res Function(_SplashPageInfo) _then;

/// Create a copy of SplashPageInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? showRule = null,}) {
  return _then(_SplashPageInfo(
showRule: null == showRule ? _self.showRule : showRule // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
