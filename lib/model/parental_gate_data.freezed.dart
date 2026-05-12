// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parental_gate_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ParentalGateData implements DiagnosticableTreeMixin {

 String? get question; String? get correct; List<String>? get answerList;
/// Create a copy of ParentalGateData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParentalGateDataCopyWith<ParentalGateData> get copyWith => _$ParentalGateDataCopyWithImpl<ParentalGateData>(this as ParentalGateData, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ParentalGateData'))
    ..add(DiagnosticsProperty('question', question))..add(DiagnosticsProperty('correct', correct))..add(DiagnosticsProperty('answerList', answerList));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParentalGateData&&(identical(other.question, question) || other.question == question)&&(identical(other.correct, correct) || other.correct == correct)&&const DeepCollectionEquality().equals(other.answerList, answerList));
}


@override
int get hashCode => Object.hash(runtimeType,question,correct,const DeepCollectionEquality().hash(answerList));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ParentalGateData(question: $question, correct: $correct, answerList: $answerList)';
}


}

/// @nodoc
abstract mixin class $ParentalGateDataCopyWith<$Res>  {
  factory $ParentalGateDataCopyWith(ParentalGateData value, $Res Function(ParentalGateData) _then) = _$ParentalGateDataCopyWithImpl;
@useResult
$Res call({
 String? question, String? correct, List<String>? answerList
});




}
/// @nodoc
class _$ParentalGateDataCopyWithImpl<$Res>
    implements $ParentalGateDataCopyWith<$Res> {
  _$ParentalGateDataCopyWithImpl(this._self, this._then);

  final ParentalGateData _self;
  final $Res Function(ParentalGateData) _then;

/// Create a copy of ParentalGateData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? question = freezed,Object? correct = freezed,Object? answerList = freezed,}) {
  return _then(_self.copyWith(
question: freezed == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String?,correct: freezed == correct ? _self.correct : correct // ignore: cast_nullable_to_non_nullable
as String?,answerList: freezed == answerList ? _self.answerList : answerList // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ParentalGateData].
extension ParentalGateDataPatterns on ParentalGateData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParentalGateData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParentalGateData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParentalGateData value)  $default,){
final _that = this;
switch (_that) {
case _ParentalGateData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParentalGateData value)?  $default,){
final _that = this;
switch (_that) {
case _ParentalGateData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? question,  String? correct,  List<String>? answerList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParentalGateData() when $default != null:
return $default(_that.question,_that.correct,_that.answerList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? question,  String? correct,  List<String>? answerList)  $default,) {final _that = this;
switch (_that) {
case _ParentalGateData():
return $default(_that.question,_that.correct,_that.answerList);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? question,  String? correct,  List<String>? answerList)?  $default,) {final _that = this;
switch (_that) {
case _ParentalGateData() when $default != null:
return $default(_that.question,_that.correct,_that.answerList);case _:
  return null;

}
}

}

/// @nodoc


class _ParentalGateData with DiagnosticableTreeMixin implements ParentalGateData {
  const _ParentalGateData({this.question, this.correct, final  List<String>? answerList}): _answerList = answerList;
  

@override final  String? question;
@override final  String? correct;
 final  List<String>? _answerList;
@override List<String>? get answerList {
  final value = _answerList;
  if (value == null) return null;
  if (_answerList is EqualUnmodifiableListView) return _answerList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ParentalGateData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParentalGateDataCopyWith<_ParentalGateData> get copyWith => __$ParentalGateDataCopyWithImpl<_ParentalGateData>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ParentalGateData'))
    ..add(DiagnosticsProperty('question', question))..add(DiagnosticsProperty('correct', correct))..add(DiagnosticsProperty('answerList', answerList));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParentalGateData&&(identical(other.question, question) || other.question == question)&&(identical(other.correct, correct) || other.correct == correct)&&const DeepCollectionEquality().equals(other._answerList, _answerList));
}


@override
int get hashCode => Object.hash(runtimeType,question,correct,const DeepCollectionEquality().hash(_answerList));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ParentalGateData(question: $question, correct: $correct, answerList: $answerList)';
}


}

/// @nodoc
abstract mixin class _$ParentalGateDataCopyWith<$Res> implements $ParentalGateDataCopyWith<$Res> {
  factory _$ParentalGateDataCopyWith(_ParentalGateData value, $Res Function(_ParentalGateData) _then) = __$ParentalGateDataCopyWithImpl;
@override @useResult
$Res call({
 String? question, String? correct, List<String>? answerList
});




}
/// @nodoc
class __$ParentalGateDataCopyWithImpl<$Res>
    implements _$ParentalGateDataCopyWith<$Res> {
  __$ParentalGateDataCopyWithImpl(this._self, this._then);

  final _ParentalGateData _self;
  final $Res Function(_ParentalGateData) _then;

/// Create a copy of ParentalGateData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? question = freezed,Object? correct = freezed,Object? answerList = freezed,}) {
  return _then(_ParentalGateData(
question: freezed == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String?,correct: freezed == correct ? _self.correct : correct // ignore: cast_nullable_to_non_nullable
as String?,answerList: freezed == answerList ? _self._answerList : answerList // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
