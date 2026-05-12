// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WordInput implements DiagnosticableTreeMixin {

 List<InputWords?> get wordsList; List<WordResults?> get wordsResultList; Map<String, WordKeyboardInfo> get keyResultList; int get inputIndex;
/// Create a copy of WordInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WordInputCopyWith<WordInput> get copyWith => _$WordInputCopyWithImpl<WordInput>(this as WordInput, _$identity);

  /// Serializes this WordInput to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WordInput'))
    ..add(DiagnosticsProperty('wordsList', wordsList))..add(DiagnosticsProperty('wordsResultList', wordsResultList))..add(DiagnosticsProperty('keyResultList', keyResultList))..add(DiagnosticsProperty('inputIndex', inputIndex));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WordInput&&const DeepCollectionEquality().equals(other.wordsList, wordsList)&&const DeepCollectionEquality().equals(other.wordsResultList, wordsResultList)&&const DeepCollectionEquality().equals(other.keyResultList, keyResultList)&&(identical(other.inputIndex, inputIndex) || other.inputIndex == inputIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(wordsList),const DeepCollectionEquality().hash(wordsResultList),const DeepCollectionEquality().hash(keyResultList),inputIndex);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WordInput(wordsList: $wordsList, wordsResultList: $wordsResultList, keyResultList: $keyResultList, inputIndex: $inputIndex)';
}


}

/// @nodoc
abstract mixin class $WordInputCopyWith<$Res>  {
  factory $WordInputCopyWith(WordInput value, $Res Function(WordInput) _then) = _$WordInputCopyWithImpl;
@useResult
$Res call({
 List<InputWords?> wordsList, List<WordResults?> wordsResultList, Map<String, WordKeyboardInfo> keyResultList, int inputIndex
});




}
/// @nodoc
class _$WordInputCopyWithImpl<$Res>
    implements $WordInputCopyWith<$Res> {
  _$WordInputCopyWithImpl(this._self, this._then);

  final WordInput _self;
  final $Res Function(WordInput) _then;

/// Create a copy of WordInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? wordsList = null,Object? wordsResultList = null,Object? keyResultList = null,Object? inputIndex = null,}) {
  return _then(_self.copyWith(
wordsList: null == wordsList ? _self.wordsList : wordsList // ignore: cast_nullable_to_non_nullable
as List<InputWords?>,wordsResultList: null == wordsResultList ? _self.wordsResultList : wordsResultList // ignore: cast_nullable_to_non_nullable
as List<WordResults?>,keyResultList: null == keyResultList ? _self.keyResultList : keyResultList // ignore: cast_nullable_to_non_nullable
as Map<String, WordKeyboardInfo>,inputIndex: null == inputIndex ? _self.inputIndex : inputIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WordInput].
extension WordInputPatterns on WordInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WordInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WordInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WordInput value)  $default,){
final _that = this;
switch (_that) {
case _WordInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WordInput value)?  $default,){
final _that = this;
switch (_that) {
case _WordInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<InputWords?> wordsList,  List<WordResults?> wordsResultList,  Map<String, WordKeyboardInfo> keyResultList,  int inputIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WordInput() when $default != null:
return $default(_that.wordsList,_that.wordsResultList,_that.keyResultList,_that.inputIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<InputWords?> wordsList,  List<WordResults?> wordsResultList,  Map<String, WordKeyboardInfo> keyResultList,  int inputIndex)  $default,) {final _that = this;
switch (_that) {
case _WordInput():
return $default(_that.wordsList,_that.wordsResultList,_that.keyResultList,_that.inputIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<InputWords?> wordsList,  List<WordResults?> wordsResultList,  Map<String, WordKeyboardInfo> keyResultList,  int inputIndex)?  $default,) {final _that = this;
switch (_that) {
case _WordInput() when $default != null:
return $default(_that.wordsList,_that.wordsResultList,_that.keyResultList,_that.inputIndex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WordInput with DiagnosticableTreeMixin implements WordInput {
  const _WordInput({final  List<InputWords?> wordsList = const <InputWords?>[], final  List<WordResults?> wordsResultList = const <WordResults?>[], final  Map<String, WordKeyboardInfo> keyResultList = const <String, WordKeyboardInfo>{}, this.inputIndex = 0}): _wordsList = wordsList,_wordsResultList = wordsResultList,_keyResultList = keyResultList;
  factory _WordInput.fromJson(Map<String, dynamic> json) => _$WordInputFromJson(json);

 final  List<InputWords?> _wordsList;
@override@JsonKey() List<InputWords?> get wordsList {
  if (_wordsList is EqualUnmodifiableListView) return _wordsList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_wordsList);
}

 final  List<WordResults?> _wordsResultList;
@override@JsonKey() List<WordResults?> get wordsResultList {
  if (_wordsResultList is EqualUnmodifiableListView) return _wordsResultList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_wordsResultList);
}

 final  Map<String, WordKeyboardInfo> _keyResultList;
@override@JsonKey() Map<String, WordKeyboardInfo> get keyResultList {
  if (_keyResultList is EqualUnmodifiableMapView) return _keyResultList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_keyResultList);
}

@override@JsonKey() final  int inputIndex;

/// Create a copy of WordInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WordInputCopyWith<_WordInput> get copyWith => __$WordInputCopyWithImpl<_WordInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WordInputToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WordInput'))
    ..add(DiagnosticsProperty('wordsList', wordsList))..add(DiagnosticsProperty('wordsResultList', wordsResultList))..add(DiagnosticsProperty('keyResultList', keyResultList))..add(DiagnosticsProperty('inputIndex', inputIndex));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WordInput&&const DeepCollectionEquality().equals(other._wordsList, _wordsList)&&const DeepCollectionEquality().equals(other._wordsResultList, _wordsResultList)&&const DeepCollectionEquality().equals(other._keyResultList, _keyResultList)&&(identical(other.inputIndex, inputIndex) || other.inputIndex == inputIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_wordsList),const DeepCollectionEquality().hash(_wordsResultList),const DeepCollectionEquality().hash(_keyResultList),inputIndex);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WordInput(wordsList: $wordsList, wordsResultList: $wordsResultList, keyResultList: $keyResultList, inputIndex: $inputIndex)';
}


}

/// @nodoc
abstract mixin class _$WordInputCopyWith<$Res> implements $WordInputCopyWith<$Res> {
  factory _$WordInputCopyWith(_WordInput value, $Res Function(_WordInput) _then) = __$WordInputCopyWithImpl;
@override @useResult
$Res call({
 List<InputWords?> wordsList, List<WordResults?> wordsResultList, Map<String, WordKeyboardInfo> keyResultList, int inputIndex
});




}
/// @nodoc
class __$WordInputCopyWithImpl<$Res>
    implements _$WordInputCopyWith<$Res> {
  __$WordInputCopyWithImpl(this._self, this._then);

  final _WordInput _self;
  final $Res Function(_WordInput) _then;

/// Create a copy of WordInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? wordsList = null,Object? wordsResultList = null,Object? keyResultList = null,Object? inputIndex = null,}) {
  return _then(_WordInput(
wordsList: null == wordsList ? _self._wordsList : wordsList // ignore: cast_nullable_to_non_nullable
as List<InputWords?>,wordsResultList: null == wordsResultList ? _self._wordsResultList : wordsResultList // ignore: cast_nullable_to_non_nullable
as List<WordResults?>,keyResultList: null == keyResultList ? _self._keyResultList : keyResultList // ignore: cast_nullable_to_non_nullable
as Map<String, WordKeyboardInfo>,inputIndex: null == inputIndex ? _self.inputIndex : inputIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
