// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$ParentalGatePageInfoCopyWithImpl<$Res>;
  $Res call({int answerNum, int maxAnswerNum, ParentalGateData? targetData});

  $ParentalGateDataCopyWith<$Res>? get targetData;
}

/// @nodoc
class _$ParentalGatePageInfoCopyWithImpl<$Res>
    implements $ParentalGatePageInfoCopyWith<$Res> {
  _$ParentalGatePageInfoCopyWithImpl(this._value, this._then);

  final ParentalGatePageInfo _value;
  // ignore: unused_field
  final $Res Function(ParentalGatePageInfo) _then;

  @override
  $Res call({
    Object? answerNum = freezed,
    Object? maxAnswerNum = freezed,
    Object? targetData = freezed,
  }) {
    return _then(_value.copyWith(
      answerNum: answerNum == freezed
          ? _value.answerNum
          : answerNum // ignore: cast_nullable_to_non_nullable
              as int,
      maxAnswerNum: maxAnswerNum == freezed
          ? _value.maxAnswerNum
          : maxAnswerNum // ignore: cast_nullable_to_non_nullable
              as int,
      targetData: targetData == freezed
          ? _value.targetData
          : targetData // ignore: cast_nullable_to_non_nullable
              as ParentalGateData?,
    ));
  }

  @override
  $ParentalGateDataCopyWith<$Res>? get targetData {
    if (_value.targetData == null) {
      return null;
    }

    return $ParentalGateDataCopyWith<$Res>(_value.targetData!, (value) {
      return _then(_value.copyWith(targetData: value));
    });
  }
}

/// @nodoc
abstract class _$$_ParentalGatePageInfoCopyWith<$Res>
    implements $ParentalGatePageInfoCopyWith<$Res> {
  factory _$$_ParentalGatePageInfoCopyWith(_$_ParentalGatePageInfo value,
          $Res Function(_$_ParentalGatePageInfo) then) =
      __$$_ParentalGatePageInfoCopyWithImpl<$Res>;
  @override
  $Res call({int answerNum, int maxAnswerNum, ParentalGateData? targetData});

  @override
  $ParentalGateDataCopyWith<$Res>? get targetData;
}

/// @nodoc
class __$$_ParentalGatePageInfoCopyWithImpl<$Res>
    extends _$ParentalGatePageInfoCopyWithImpl<$Res>
    implements _$$_ParentalGatePageInfoCopyWith<$Res> {
  __$$_ParentalGatePageInfoCopyWithImpl(_$_ParentalGatePageInfo _value,
      $Res Function(_$_ParentalGatePageInfo) _then)
      : super(_value, (v) => _then(v as _$_ParentalGatePageInfo));

  @override
  _$_ParentalGatePageInfo get _value => super._value as _$_ParentalGatePageInfo;

  @override
  $Res call({
    Object? answerNum = freezed,
    Object? maxAnswerNum = freezed,
    Object? targetData = freezed,
  }) {
    return _then(_$_ParentalGatePageInfo(
      answerNum: answerNum == freezed
          ? _value.answerNum
          : answerNum // ignore: cast_nullable_to_non_nullable
              as int,
      maxAnswerNum: maxAnswerNum == freezed
          ? _value.maxAnswerNum
          : maxAnswerNum // ignore: cast_nullable_to_non_nullable
              as int,
      targetData: targetData == freezed
          ? _value.targetData
          : targetData // ignore: cast_nullable_to_non_nullable
              as ParentalGateData?,
    ));
  }
}

/// @nodoc

class _$_ParentalGatePageInfo
    with DiagnosticableTreeMixin
    implements _ParentalGatePageInfo {
  const _$_ParentalGatePageInfo(
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
            other is _$_ParentalGatePageInfo &&
            const DeepCollectionEquality().equals(other.answerNum, answerNum) &&
            const DeepCollectionEquality()
                .equals(other.maxAnswerNum, maxAnswerNum) &&
            const DeepCollectionEquality()
                .equals(other.targetData, targetData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(answerNum),
      const DeepCollectionEquality().hash(maxAnswerNum),
      const DeepCollectionEquality().hash(targetData));

  @JsonKey(ignore: true)
  @override
  _$$_ParentalGatePageInfoCopyWith<_$_ParentalGatePageInfo> get copyWith =>
      __$$_ParentalGatePageInfoCopyWithImpl<_$_ParentalGatePageInfo>(
          this, _$identity);
}

abstract class _ParentalGatePageInfo implements ParentalGatePageInfo {
  const factory _ParentalGatePageInfo(
      {final int answerNum,
      final int maxAnswerNum,
      final ParentalGateData? targetData}) = _$_ParentalGatePageInfo;

  @override
  int get answerNum => throw _privateConstructorUsedError;
  @override
  int get maxAnswerNum => throw _privateConstructorUsedError;
  @override
  ParentalGateData? get targetData => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ParentalGatePageInfoCopyWith<_$_ParentalGatePageInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
