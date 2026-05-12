// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parental_gate_page_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ParentalGatePageInfo implements DiagnosticableTreeMixin {

 int get maxAnswerNum; List<ParentalGateData> get parentalGateDataList;
/// Create a copy of ParentalGatePageInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParentalGatePageInfoCopyWith<ParentalGatePageInfo> get copyWith => _$ParentalGatePageInfoCopyWithImpl<ParentalGatePageInfo>(this as ParentalGatePageInfo, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ParentalGatePageInfo'))
    ..add(DiagnosticsProperty('maxAnswerNum', maxAnswerNum))..add(DiagnosticsProperty('parentalGateDataList', parentalGateDataList));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParentalGatePageInfo&&(identical(other.maxAnswerNum, maxAnswerNum) || other.maxAnswerNum == maxAnswerNum)&&const DeepCollectionEquality().equals(other.parentalGateDataList, parentalGateDataList));
}


@override
int get hashCode => Object.hash(runtimeType,maxAnswerNum,const DeepCollectionEquality().hash(parentalGateDataList));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ParentalGatePageInfo(maxAnswerNum: $maxAnswerNum, parentalGateDataList: $parentalGateDataList)';
}


}

/// @nodoc
abstract mixin class $ParentalGatePageInfoCopyWith<$Res>  {
  factory $ParentalGatePageInfoCopyWith(ParentalGatePageInfo value, $Res Function(ParentalGatePageInfo) _then) = _$ParentalGatePageInfoCopyWithImpl;
@useResult
$Res call({
 int maxAnswerNum, List<ParentalGateData> parentalGateDataList
});




}
/// @nodoc
class _$ParentalGatePageInfoCopyWithImpl<$Res>
    implements $ParentalGatePageInfoCopyWith<$Res> {
  _$ParentalGatePageInfoCopyWithImpl(this._self, this._then);

  final ParentalGatePageInfo _self;
  final $Res Function(ParentalGatePageInfo) _then;

/// Create a copy of ParentalGatePageInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? maxAnswerNum = null,Object? parentalGateDataList = null,}) {
  return _then(_self.copyWith(
maxAnswerNum: null == maxAnswerNum ? _self.maxAnswerNum : maxAnswerNum // ignore: cast_nullable_to_non_nullable
as int,parentalGateDataList: null == parentalGateDataList ? _self.parentalGateDataList : parentalGateDataList // ignore: cast_nullable_to_non_nullable
as List<ParentalGateData>,
  ));
}

}


/// Adds pattern-matching-related methods to [ParentalGatePageInfo].
extension ParentalGatePageInfoPatterns on ParentalGatePageInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParentalGatePageInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParentalGatePageInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParentalGatePageInfo value)  $default,){
final _that = this;
switch (_that) {
case _ParentalGatePageInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParentalGatePageInfo value)?  $default,){
final _that = this;
switch (_that) {
case _ParentalGatePageInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int maxAnswerNum,  List<ParentalGateData> parentalGateDataList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParentalGatePageInfo() when $default != null:
return $default(_that.maxAnswerNum,_that.parentalGateDataList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int maxAnswerNum,  List<ParentalGateData> parentalGateDataList)  $default,) {final _that = this;
switch (_that) {
case _ParentalGatePageInfo():
return $default(_that.maxAnswerNum,_that.parentalGateDataList);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int maxAnswerNum,  List<ParentalGateData> parentalGateDataList)?  $default,) {final _that = this;
switch (_that) {
case _ParentalGatePageInfo() when $default != null:
return $default(_that.maxAnswerNum,_that.parentalGateDataList);case _:
  return null;

}
}

}

/// @nodoc


class _ParentalGatePageInfo with DiagnosticableTreeMixin implements ParentalGatePageInfo {
  const _ParentalGatePageInfo({this.maxAnswerNum = 0, final  List<ParentalGateData> parentalGateDataList = const []}): _parentalGateDataList = parentalGateDataList;
  

@override@JsonKey() final  int maxAnswerNum;
 final  List<ParentalGateData> _parentalGateDataList;
@override@JsonKey() List<ParentalGateData> get parentalGateDataList {
  if (_parentalGateDataList is EqualUnmodifiableListView) return _parentalGateDataList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_parentalGateDataList);
}


/// Create a copy of ParentalGatePageInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParentalGatePageInfoCopyWith<_ParentalGatePageInfo> get copyWith => __$ParentalGatePageInfoCopyWithImpl<_ParentalGatePageInfo>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ParentalGatePageInfo'))
    ..add(DiagnosticsProperty('maxAnswerNum', maxAnswerNum))..add(DiagnosticsProperty('parentalGateDataList', parentalGateDataList));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParentalGatePageInfo&&(identical(other.maxAnswerNum, maxAnswerNum) || other.maxAnswerNum == maxAnswerNum)&&const DeepCollectionEquality().equals(other._parentalGateDataList, _parentalGateDataList));
}


@override
int get hashCode => Object.hash(runtimeType,maxAnswerNum,const DeepCollectionEquality().hash(_parentalGateDataList));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ParentalGatePageInfo(maxAnswerNum: $maxAnswerNum, parentalGateDataList: $parentalGateDataList)';
}


}

/// @nodoc
abstract mixin class _$ParentalGatePageInfoCopyWith<$Res> implements $ParentalGatePageInfoCopyWith<$Res> {
  factory _$ParentalGatePageInfoCopyWith(_ParentalGatePageInfo value, $Res Function(_ParentalGatePageInfo) _then) = __$ParentalGatePageInfoCopyWithImpl;
@override @useResult
$Res call({
 int maxAnswerNum, List<ParentalGateData> parentalGateDataList
});




}
/// @nodoc
class __$ParentalGatePageInfoCopyWithImpl<$Res>
    implements _$ParentalGatePageInfoCopyWith<$Res> {
  __$ParentalGatePageInfoCopyWithImpl(this._self, this._then);

  final _ParentalGatePageInfo _self;
  final $Res Function(_ParentalGatePageInfo) _then;

/// Create a copy of ParentalGatePageInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? maxAnswerNum = null,Object? parentalGateDataList = null,}) {
  return _then(_ParentalGatePageInfo(
maxAnswerNum: null == maxAnswerNum ? _self.maxAnswerNum : maxAnswerNum // ignore: cast_nullable_to_non_nullable
as int,parentalGateDataList: null == parentalGateDataList ? _self._parentalGateDataList : parentalGateDataList // ignore: cast_nullable_to_non_nullable
as List<ParentalGateData>,
  ));
}


}

// dart format on
