// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quiz_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizRange _$QuizRangeFromJson(Map<String, dynamic> json) {
  return _QuizRange.fromJson(json);
}

/// @nodoc
mixin _$QuizRange {
  int get id => throw _privateConstructorUsedError;
  int get maxNo => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizRangeCopyWith<QuizRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizRangeCopyWith<$Res> {
  factory $QuizRangeCopyWith(QuizRange value, $Res Function(QuizRange) then) =
      _$QuizRangeCopyWithImpl<$Res>;
  $Res call({int id, int maxNo, String? displayName});
}

/// @nodoc
class _$QuizRangeCopyWithImpl<$Res> implements $QuizRangeCopyWith<$Res> {
  _$QuizRangeCopyWithImpl(this._value, this._then);

  final QuizRange _value;
  // ignore: unused_field
  final $Res Function(QuizRange) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? maxNo = freezed,
    Object? displayName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      maxNo: maxNo == freezed
          ? _value.maxNo
          : maxNo // ignore: cast_nullable_to_non_nullable
              as int,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_QuizRangeCopyWith<$Res> implements $QuizRangeCopyWith<$Res> {
  factory _$$_QuizRangeCopyWith(
          _$_QuizRange value, $Res Function(_$_QuizRange) then) =
      __$$_QuizRangeCopyWithImpl<$Res>;
  @override
  $Res call({int id, int maxNo, String? displayName});
}

/// @nodoc
class __$$_QuizRangeCopyWithImpl<$Res> extends _$QuizRangeCopyWithImpl<$Res>
    implements _$$_QuizRangeCopyWith<$Res> {
  __$$_QuizRangeCopyWithImpl(
      _$_QuizRange _value, $Res Function(_$_QuizRange) _then)
      : super(_value, (v) => _then(v as _$_QuizRange));

  @override
  _$_QuizRange get _value => super._value as _$_QuizRange;

  @override
  $Res call({
    Object? id = freezed,
    Object? maxNo = freezed,
    Object? displayName = freezed,
  }) {
    return _then(_$_QuizRange(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      maxNo: maxNo == freezed
          ? _value.maxNo
          : maxNo // ignore: cast_nullable_to_non_nullable
              as int,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizRange with DiagnosticableTreeMixin implements _QuizRange {
  const _$_QuizRange({this.id = 0, this.maxNo = 0, this.displayName});

  factory _$_QuizRange.fromJson(Map<String, dynamic> json) =>
      _$$_QuizRangeFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int maxNo;
  @override
  final String? displayName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuizRange(id: $id, maxNo: $maxNo, displayName: $displayName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuizRange'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('maxNo', maxNo))
      ..add(DiagnosticsProperty('displayName', displayName));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizRange &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.maxNo, maxNo) &&
            const DeepCollectionEquality()
                .equals(other.displayName, displayName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(maxNo),
      const DeepCollectionEquality().hash(displayName));

  @JsonKey(ignore: true)
  @override
  _$$_QuizRangeCopyWith<_$_QuizRange> get copyWith =>
      __$$_QuizRangeCopyWithImpl<_$_QuizRange>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizRangeToJson(this);
  }
}

abstract class _QuizRange implements QuizRange {
  const factory _QuizRange(
      {final int id,
      final int maxNo,
      final String? displayName}) = _$_QuizRange;

  factory _QuizRange.fromJson(Map<String, dynamic> json) =
      _$_QuizRange.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  int get maxNo => throw _privateConstructorUsedError;
  @override
  String? get displayName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_QuizRangeCopyWith<_$_QuizRange> get copyWith =>
      throw _privateConstructorUsedError;
}
