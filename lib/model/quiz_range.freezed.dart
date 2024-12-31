// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$QuizRangeCopyWithImpl<$Res, QuizRange>;
  @useResult
  $Res call({int id, int maxNo, String? displayName});
}

/// @nodoc
class _$QuizRangeCopyWithImpl<$Res, $Val extends QuizRange>
    implements $QuizRangeCopyWith<$Res> {
  _$QuizRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? maxNo = null,
    Object? displayName = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      maxNo: null == maxNo
          ? _value.maxNo
          : maxNo // ignore: cast_nullable_to_non_nullable
              as int,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizRangeImplCopyWith<$Res>
    implements $QuizRangeCopyWith<$Res> {
  factory _$$QuizRangeImplCopyWith(
          _$QuizRangeImpl value, $Res Function(_$QuizRangeImpl) then) =
      __$$QuizRangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int maxNo, String? displayName});
}

/// @nodoc
class __$$QuizRangeImplCopyWithImpl<$Res>
    extends _$QuizRangeCopyWithImpl<$Res, _$QuizRangeImpl>
    implements _$$QuizRangeImplCopyWith<$Res> {
  __$$QuizRangeImplCopyWithImpl(
      _$QuizRangeImpl _value, $Res Function(_$QuizRangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? maxNo = null,
    Object? displayName = freezed,
  }) {
    return _then(_$QuizRangeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      maxNo: null == maxNo
          ? _value.maxNo
          : maxNo // ignore: cast_nullable_to_non_nullable
              as int,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizRangeImpl with DiagnosticableTreeMixin implements _QuizRange {
  const _$QuizRangeImpl({this.id = 0, this.maxNo = 0, this.displayName});

  factory _$QuizRangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizRangeImplFromJson(json);

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
            other is _$QuizRangeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.maxNo, maxNo) || other.maxNo == maxNo) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, maxNo, displayName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizRangeImplCopyWith<_$QuizRangeImpl> get copyWith =>
      __$$QuizRangeImplCopyWithImpl<_$QuizRangeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizRangeImplToJson(
      this,
    );
  }
}

abstract class _QuizRange implements QuizRange {
  const factory _QuizRange(
      {final int id,
      final int maxNo,
      final String? displayName}) = _$QuizRangeImpl;

  factory _QuizRange.fromJson(Map<String, dynamic> json) =
      _$QuizRangeImpl.fromJson;

  @override
  int get id;
  @override
  int get maxNo;
  @override
  String? get displayName;
  @override
  @JsonKey(ignore: true)
  _$$QuizRangeImplCopyWith<_$QuizRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
