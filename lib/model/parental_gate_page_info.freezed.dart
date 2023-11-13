// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parental_gate_page_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ParentalGatePageInfo {
  int get answerNum => throw _privateConstructorUsedError;
  int get maxAnswerNum => throw _privateConstructorUsedError;
  ParentalGateData? get targetData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ParentalGatePageInfoCopyWith<ParentalGatePageInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParentalGatePageInfoCopyWith<$Res> {
  factory $ParentalGatePageInfoCopyWith(ParentalGatePageInfo value,
          $Res Function(ParentalGatePageInfo) then) =
      _$ParentalGatePageInfoCopyWithImpl<$Res, ParentalGatePageInfo>;
  @useResult
  $Res call({int answerNum, int maxAnswerNum, ParentalGateData? targetData});

  $ParentalGateDataCopyWith<$Res>? get targetData;
}

/// @nodoc
class _$ParentalGatePageInfoCopyWithImpl<$Res,
        $Val extends ParentalGatePageInfo>
    implements $ParentalGatePageInfoCopyWith<$Res> {
  _$ParentalGatePageInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answerNum = null,
    Object? maxAnswerNum = null,
    Object? targetData = freezed,
  }) {
    return _then(_value.copyWith(
      answerNum: null == answerNum
          ? _value.answerNum
          : answerNum // ignore: cast_nullable_to_non_nullable
              as int,
      maxAnswerNum: null == maxAnswerNum
          ? _value.maxAnswerNum
          : maxAnswerNum // ignore: cast_nullable_to_non_nullable
              as int,
      targetData: freezed == targetData
          ? _value.targetData
          : targetData // ignore: cast_nullable_to_non_nullable
              as ParentalGateData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ParentalGateDataCopyWith<$Res>? get targetData {
    if (_value.targetData == null) {
      return null;
    }

    return $ParentalGateDataCopyWith<$Res>(_value.targetData!, (value) {
      return _then(_value.copyWith(targetData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ParentalGatePageInfoImplCopyWith<$Res>
    implements $ParentalGatePageInfoCopyWith<$Res> {
  factory _$$ParentalGatePageInfoImplCopyWith(_$ParentalGatePageInfoImpl value,
          $Res Function(_$ParentalGatePageInfoImpl) then) =
      __$$ParentalGatePageInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int answerNum, int maxAnswerNum, ParentalGateData? targetData});

  @override
  $ParentalGateDataCopyWith<$Res>? get targetData;
}

/// @nodoc
class __$$ParentalGatePageInfoImplCopyWithImpl<$Res>
    extends _$ParentalGatePageInfoCopyWithImpl<$Res, _$ParentalGatePageInfoImpl>
    implements _$$ParentalGatePageInfoImplCopyWith<$Res> {
  __$$ParentalGatePageInfoImplCopyWithImpl(_$ParentalGatePageInfoImpl _value,
      $Res Function(_$ParentalGatePageInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answerNum = null,
    Object? maxAnswerNum = null,
    Object? targetData = freezed,
  }) {
    return _then(_$ParentalGatePageInfoImpl(
      answerNum: null == answerNum
          ? _value.answerNum
          : answerNum // ignore: cast_nullable_to_non_nullable
              as int,
      maxAnswerNum: null == maxAnswerNum
          ? _value.maxAnswerNum
          : maxAnswerNum // ignore: cast_nullable_to_non_nullable
              as int,
      targetData: freezed == targetData
          ? _value.targetData
          : targetData // ignore: cast_nullable_to_non_nullable
              as ParentalGateData?,
    ));
  }
}

/// @nodoc

class _$ParentalGatePageInfoImpl
    with DiagnosticableTreeMixin
    implements _ParentalGatePageInfo {
  const _$ParentalGatePageInfoImpl(
      {this.answerNum = 0, this.maxAnswerNum = 0, this.targetData});

  @override
  @JsonKey()
  final int answerNum;
  @override
  @JsonKey()
  final int maxAnswerNum;
  @override
  final ParentalGateData? targetData;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ParentalGatePageInfo(answerNum: $answerNum, maxAnswerNum: $maxAnswerNum, targetData: $targetData)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ParentalGatePageInfo'))
      ..add(DiagnosticsProperty('answerNum', answerNum))
      ..add(DiagnosticsProperty('maxAnswerNum', maxAnswerNum))
      ..add(DiagnosticsProperty('targetData', targetData));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParentalGatePageInfoImpl &&
            (identical(other.answerNum, answerNum) ||
                other.answerNum == answerNum) &&
            (identical(other.maxAnswerNum, maxAnswerNum) ||
                other.maxAnswerNum == maxAnswerNum) &&
            (identical(other.targetData, targetData) ||
                other.targetData == targetData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, answerNum, maxAnswerNum, targetData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParentalGatePageInfoImplCopyWith<_$ParentalGatePageInfoImpl>
      get copyWith =>
          __$$ParentalGatePageInfoImplCopyWithImpl<_$ParentalGatePageInfoImpl>(
              this, _$identity);
}

abstract class _ParentalGatePageInfo implements ParentalGatePageInfo {
  const factory _ParentalGatePageInfo(
      {final int answerNum,
      final int maxAnswerNum,
      final ParentalGateData? targetData}) = _$ParentalGatePageInfoImpl;

  @override
  int get answerNum;
  @override
  int get maxAnswerNum;
  @override
  ParentalGateData? get targetData;
  @override
  @JsonKey(ignore: true)
  _$$ParentalGatePageInfoImplCopyWith<_$ParentalGatePageInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
