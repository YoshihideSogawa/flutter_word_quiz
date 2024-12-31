// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuizStatistics _$QuizStatisticsFromJson(Map<String, dynamic> json) {
  return _QuizStatistics.fromJson(json);
}

/// @nodoc
mixin _$QuizStatistics {
  int get clearCount => throw _privateConstructorUsedError;
  int get currentChain => throw _privateConstructorUsedError;
  int get lastChain => throw _privateConstructorUsedError;
  int get maxChain => throw _privateConstructorUsedError;
  int get playCount => throw _privateConstructorUsedError;

  /// Serializes this QuizStatistics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizStatisticsCopyWith<QuizStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizStatisticsCopyWith<$Res> {
  factory $QuizStatisticsCopyWith(
          QuizStatistics value, $Res Function(QuizStatistics) then) =
      _$QuizStatisticsCopyWithImpl<$Res, QuizStatistics>;
  @useResult
  $Res call(
      {int clearCount,
      int currentChain,
      int lastChain,
      int maxChain,
      int playCount});
}

/// @nodoc
class _$QuizStatisticsCopyWithImpl<$Res, $Val extends QuizStatistics>
    implements $QuizStatisticsCopyWith<$Res> {
  _$QuizStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clearCount = null,
    Object? currentChain = null,
    Object? lastChain = null,
    Object? maxChain = null,
    Object? playCount = null,
  }) {
    return _then(_value.copyWith(
      clearCount: null == clearCount
          ? _value.clearCount
          : clearCount // ignore: cast_nullable_to_non_nullable
              as int,
      currentChain: null == currentChain
          ? _value.currentChain
          : currentChain // ignore: cast_nullable_to_non_nullable
              as int,
      lastChain: null == lastChain
          ? _value.lastChain
          : lastChain // ignore: cast_nullable_to_non_nullable
              as int,
      maxChain: null == maxChain
          ? _value.maxChain
          : maxChain // ignore: cast_nullable_to_non_nullable
              as int,
      playCount: null == playCount
          ? _value.playCount
          : playCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizStatisticsImplCopyWith<$Res>
    implements $QuizStatisticsCopyWith<$Res> {
  factory _$$QuizStatisticsImplCopyWith(_$QuizStatisticsImpl value,
          $Res Function(_$QuizStatisticsImpl) then) =
      __$$QuizStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int clearCount,
      int currentChain,
      int lastChain,
      int maxChain,
      int playCount});
}

/// @nodoc
class __$$QuizStatisticsImplCopyWithImpl<$Res>
    extends _$QuizStatisticsCopyWithImpl<$Res, _$QuizStatisticsImpl>
    implements _$$QuizStatisticsImplCopyWith<$Res> {
  __$$QuizStatisticsImplCopyWithImpl(
      _$QuizStatisticsImpl _value, $Res Function(_$QuizStatisticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clearCount = null,
    Object? currentChain = null,
    Object? lastChain = null,
    Object? maxChain = null,
    Object? playCount = null,
  }) {
    return _then(_$QuizStatisticsImpl(
      clearCount: null == clearCount
          ? _value.clearCount
          : clearCount // ignore: cast_nullable_to_non_nullable
              as int,
      currentChain: null == currentChain
          ? _value.currentChain
          : currentChain // ignore: cast_nullable_to_non_nullable
              as int,
      lastChain: null == lastChain
          ? _value.lastChain
          : lastChain // ignore: cast_nullable_to_non_nullable
              as int,
      maxChain: null == maxChain
          ? _value.maxChain
          : maxChain // ignore: cast_nullable_to_non_nullable
              as int,
      playCount: null == playCount
          ? _value.playCount
          : playCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizStatisticsImpl
    with DiagnosticableTreeMixin
    implements _QuizStatistics {
  const _$QuizStatisticsImpl(
      {this.clearCount = 0,
      this.currentChain = 0,
      this.lastChain = 0,
      this.maxChain = 0,
      this.playCount = 0});

  factory _$QuizStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizStatisticsImplFromJson(json);

  @override
  @JsonKey()
  final int clearCount;
  @override
  @JsonKey()
  final int currentChain;
  @override
  @JsonKey()
  final int lastChain;
  @override
  @JsonKey()
  final int maxChain;
  @override
  @JsonKey()
  final int playCount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuizStatistics(clearCount: $clearCount, currentChain: $currentChain, lastChain: $lastChain, maxChain: $maxChain, playCount: $playCount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuizStatistics'))
      ..add(DiagnosticsProperty('clearCount', clearCount))
      ..add(DiagnosticsProperty('currentChain', currentChain))
      ..add(DiagnosticsProperty('lastChain', lastChain))
      ..add(DiagnosticsProperty('maxChain', maxChain))
      ..add(DiagnosticsProperty('playCount', playCount));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizStatisticsImpl &&
            (identical(other.clearCount, clearCount) ||
                other.clearCount == clearCount) &&
            (identical(other.currentChain, currentChain) ||
                other.currentChain == currentChain) &&
            (identical(other.lastChain, lastChain) ||
                other.lastChain == lastChain) &&
            (identical(other.maxChain, maxChain) ||
                other.maxChain == maxChain) &&
            (identical(other.playCount, playCount) ||
                other.playCount == playCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, clearCount, currentChain, lastChain, maxChain, playCount);

  /// Create a copy of QuizStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizStatisticsImplCopyWith<_$QuizStatisticsImpl> get copyWith =>
      __$$QuizStatisticsImplCopyWithImpl<_$QuizStatisticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizStatisticsImplToJson(
      this,
    );
  }
}

abstract class _QuizStatistics implements QuizStatistics {
  const factory _QuizStatistics(
      {final int clearCount,
      final int currentChain,
      final int lastChain,
      final int maxChain,
      final int playCount}) = _$QuizStatisticsImpl;

  factory _QuizStatistics.fromJson(Map<String, dynamic> json) =
      _$QuizStatisticsImpl.fromJson;

  @override
  int get clearCount;
  @override
  int get currentChain;
  @override
  int get lastChain;
  @override
  int get maxChain;
  @override
  int get playCount;

  /// Create a copy of QuizStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizStatisticsImplCopyWith<_$QuizStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
