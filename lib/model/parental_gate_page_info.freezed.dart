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
  int get maxAnswerNum => throw _privateConstructorUsedError;
  List<ParentalGateData> get parentalGateDataList =>
      throw _privateConstructorUsedError;

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
  $Res call({int maxAnswerNum, List<ParentalGateData> parentalGateDataList});
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
    Object? maxAnswerNum = null,
    Object? parentalGateDataList = null,
  }) {
    return _then(_value.copyWith(
      maxAnswerNum: null == maxAnswerNum
          ? _value.maxAnswerNum
          : maxAnswerNum // ignore: cast_nullable_to_non_nullable
              as int,
      parentalGateDataList: null == parentalGateDataList
          ? _value.parentalGateDataList
          : parentalGateDataList // ignore: cast_nullable_to_non_nullable
              as List<ParentalGateData>,
    ) as $Val);
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
  $Res call({int maxAnswerNum, List<ParentalGateData> parentalGateDataList});
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
    Object? maxAnswerNum = null,
    Object? parentalGateDataList = null,
  }) {
    return _then(_$ParentalGatePageInfoImpl(
      maxAnswerNum: null == maxAnswerNum
          ? _value.maxAnswerNum
          : maxAnswerNum // ignore: cast_nullable_to_non_nullable
              as int,
      parentalGateDataList: null == parentalGateDataList
          ? _value._parentalGateDataList
          : parentalGateDataList // ignore: cast_nullable_to_non_nullable
              as List<ParentalGateData>,
    ));
  }
}

/// @nodoc

class _$ParentalGatePageInfoImpl
    with DiagnosticableTreeMixin
    implements _ParentalGatePageInfo {
  const _$ParentalGatePageInfoImpl(
      {this.maxAnswerNum = 0,
      final List<ParentalGateData> parentalGateDataList = const []})
      : _parentalGateDataList = parentalGateDataList;

  @override
  @JsonKey()
  final int maxAnswerNum;
  final List<ParentalGateData> _parentalGateDataList;
  @override
  @JsonKey()
  List<ParentalGateData> get parentalGateDataList {
    if (_parentalGateDataList is EqualUnmodifiableListView)
      return _parentalGateDataList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parentalGateDataList);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ParentalGatePageInfo(maxAnswerNum: $maxAnswerNum, parentalGateDataList: $parentalGateDataList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ParentalGatePageInfo'))
      ..add(DiagnosticsProperty('maxAnswerNum', maxAnswerNum))
      ..add(DiagnosticsProperty('parentalGateDataList', parentalGateDataList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParentalGatePageInfoImpl &&
            (identical(other.maxAnswerNum, maxAnswerNum) ||
                other.maxAnswerNum == maxAnswerNum) &&
            const DeepCollectionEquality()
                .equals(other._parentalGateDataList, _parentalGateDataList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, maxAnswerNum,
      const DeepCollectionEquality().hash(_parentalGateDataList));

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
          {final int maxAnswerNum,
          final List<ParentalGateData> parentalGateDataList}) =
      _$ParentalGatePageInfoImpl;

  @override
  int get maxAnswerNum;
  @override
  List<ParentalGateData> get parentalGateDataList;
  @override
  @JsonKey(ignore: true)
  _$$ParentalGatePageInfoImplCopyWith<_$ParentalGatePageInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
