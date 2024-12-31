// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_page_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SplashPageInfo _$SplashPageInfoFromJson(Map<String, dynamic> json) {
  return _SplashPageInfo.fromJson(json);
}

/// @nodoc
mixin _$SplashPageInfo {
  bool get showRule => throw _privateConstructorUsedError;

  /// Serializes this SplashPageInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SplashPageInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SplashPageInfoCopyWith<SplashPageInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashPageInfoCopyWith<$Res> {
  factory $SplashPageInfoCopyWith(
          SplashPageInfo value, $Res Function(SplashPageInfo) then) =
      _$SplashPageInfoCopyWithImpl<$Res, SplashPageInfo>;
  @useResult
  $Res call({bool showRule});
}

/// @nodoc
class _$SplashPageInfoCopyWithImpl<$Res, $Val extends SplashPageInfo>
    implements $SplashPageInfoCopyWith<$Res> {
  _$SplashPageInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplashPageInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showRule = null,
  }) {
    return _then(_value.copyWith(
      showRule: null == showRule
          ? _value.showRule
          : showRule // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SplashPageInfoImplCopyWith<$Res>
    implements $SplashPageInfoCopyWith<$Res> {
  factory _$$SplashPageInfoImplCopyWith(_$SplashPageInfoImpl value,
          $Res Function(_$SplashPageInfoImpl) then) =
      __$$SplashPageInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool showRule});
}

/// @nodoc
class __$$SplashPageInfoImplCopyWithImpl<$Res>
    extends _$SplashPageInfoCopyWithImpl<$Res, _$SplashPageInfoImpl>
    implements _$$SplashPageInfoImplCopyWith<$Res> {
  __$$SplashPageInfoImplCopyWithImpl(
      _$SplashPageInfoImpl _value, $Res Function(_$SplashPageInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplashPageInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showRule = null,
  }) {
    return _then(_$SplashPageInfoImpl(
      showRule: null == showRule
          ? _value.showRule
          : showRule // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SplashPageInfoImpl
    with DiagnosticableTreeMixin
    implements _SplashPageInfo {
  const _$SplashPageInfoImpl({this.showRule = false});

  factory _$SplashPageInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SplashPageInfoImplFromJson(json);

  @override
  @JsonKey()
  final bool showRule;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SplashPageInfo(showRule: $showRule)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SplashPageInfo'))
      ..add(DiagnosticsProperty('showRule', showRule));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashPageInfoImpl &&
            (identical(other.showRule, showRule) ||
                other.showRule == showRule));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, showRule);

  /// Create a copy of SplashPageInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashPageInfoImplCopyWith<_$SplashPageInfoImpl> get copyWith =>
      __$$SplashPageInfoImplCopyWithImpl<_$SplashPageInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SplashPageInfoImplToJson(
      this,
    );
  }
}

abstract class _SplashPageInfo implements SplashPageInfo {
  const factory _SplashPageInfo({final bool showRule}) = _$SplashPageInfoImpl;

  factory _SplashPageInfo.fromJson(Map<String, dynamic> json) =
      _$SplashPageInfoImpl.fromJson;

  @override
  bool get showRule;

  /// Create a copy of SplashPageInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplashPageInfoImplCopyWith<_$SplashPageInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
