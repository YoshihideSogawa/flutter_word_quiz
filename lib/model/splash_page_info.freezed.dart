// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'splash_page_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SplashPageInfo _$SplashPageInfoFromJson(Map<String, dynamic> json) {
  return _SplashPageInfo.fromJson(json);
}

/// @nodoc
class _$SplashPageInfoTearOff {
  const _$SplashPageInfoTearOff();

  _SplashPageInfo call({bool showRule = false, bool showParentalGate = false}) {
    return _SplashPageInfo(
      showRule: showRule,
      showParentalGate: showParentalGate,
    );
  }

  SplashPageInfo fromJson(Map<String, Object?> json) {
    return SplashPageInfo.fromJson(json);
  }
}

/// @nodoc
const $SplashPageInfo = _$SplashPageInfoTearOff();

/// @nodoc
mixin _$SplashPageInfo {
  bool get showRule => throw _privateConstructorUsedError;
  bool get showParentalGate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SplashPageInfoCopyWith<SplashPageInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashPageInfoCopyWith<$Res> {
  factory $SplashPageInfoCopyWith(
          SplashPageInfo value, $Res Function(SplashPageInfo) then) =
      _$SplashPageInfoCopyWithImpl<$Res>;
  $Res call({bool showRule, bool showParentalGate});
}

/// @nodoc
class _$SplashPageInfoCopyWithImpl<$Res>
    implements $SplashPageInfoCopyWith<$Res> {
  _$SplashPageInfoCopyWithImpl(this._value, this._then);

  final SplashPageInfo _value;
  // ignore: unused_field
  final $Res Function(SplashPageInfo) _then;

  @override
  $Res call({
    Object? showRule = freezed,
    Object? showParentalGate = freezed,
  }) {
    return _then(_value.copyWith(
      showRule: showRule == freezed
          ? _value.showRule
          : showRule // ignore: cast_nullable_to_non_nullable
              as bool,
      showParentalGate: showParentalGate == freezed
          ? _value.showParentalGate
          : showParentalGate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$SplashPageInfoCopyWith<$Res>
    implements $SplashPageInfoCopyWith<$Res> {
  factory _$SplashPageInfoCopyWith(
          _SplashPageInfo value, $Res Function(_SplashPageInfo) then) =
      __$SplashPageInfoCopyWithImpl<$Res>;
  @override
  $Res call({bool showRule, bool showParentalGate});
}

/// @nodoc
class __$SplashPageInfoCopyWithImpl<$Res>
    extends _$SplashPageInfoCopyWithImpl<$Res>
    implements _$SplashPageInfoCopyWith<$Res> {
  __$SplashPageInfoCopyWithImpl(
      _SplashPageInfo _value, $Res Function(_SplashPageInfo) _then)
      : super(_value, (v) => _then(v as _SplashPageInfo));

  @override
  _SplashPageInfo get _value => super._value as _SplashPageInfo;

  @override
  $Res call({
    Object? showRule = freezed,
    Object? showParentalGate = freezed,
  }) {
    return _then(_SplashPageInfo(
      showRule: showRule == freezed
          ? _value.showRule
          : showRule // ignore: cast_nullable_to_non_nullable
              as bool,
      showParentalGate: showParentalGate == freezed
          ? _value.showParentalGate
          : showParentalGate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SplashPageInfo
    with DiagnosticableTreeMixin
    implements _SplashPageInfo {
  const _$_SplashPageInfo(
      {this.showRule = false, this.showParentalGate = false});

  factory _$_SplashPageInfo.fromJson(Map<String, dynamic> json) =>
      _$$_SplashPageInfoFromJson(json);

  @JsonKey()
  @override
  final bool showRule;
  @JsonKey()
  @override
  final bool showParentalGate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SplashPageInfo(showRule: $showRule, showParentalGate: $showParentalGate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SplashPageInfo'))
      ..add(DiagnosticsProperty('showRule', showRule))
      ..add(DiagnosticsProperty('showParentalGate', showParentalGate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SplashPageInfo &&
            const DeepCollectionEquality().equals(other.showRule, showRule) &&
            const DeepCollectionEquality()
                .equals(other.showParentalGate, showParentalGate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(showRule),
      const DeepCollectionEquality().hash(showParentalGate));

  @JsonKey(ignore: true)
  @override
  _$SplashPageInfoCopyWith<_SplashPageInfo> get copyWith =>
      __$SplashPageInfoCopyWithImpl<_SplashPageInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SplashPageInfoToJson(this);
  }
}

abstract class _SplashPageInfo implements SplashPageInfo {
  const factory _SplashPageInfo({bool showRule, bool showParentalGate}) =
      _$_SplashPageInfo;

  factory _SplashPageInfo.fromJson(Map<String, dynamic> json) =
      _$_SplashPageInfo.fromJson;

  @override
  bool get showRule;
  @override
  bool get showParentalGate;
  @override
  @JsonKey(ignore: true)
  _$SplashPageInfoCopyWith<_SplashPageInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
