// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quiz_statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizStatistics _$QuizStatisticsFromJson(Map<String, dynamic> json) {
  return _QuizStatistics.fromJson(json);
}

/// @nodoc
class _$QuizStatisticsTearOff {
  const _$QuizStatisticsTearOff();

  _QuizStatistics call(
      {int clearCount = 0,
      int currentChain = 0,
      int lastChain = 0,
      int maxChain = 0,
      int playCount = 0}) {
    return _QuizStatistics(
      clearCount: clearCount,
      currentChain: currentChain,
      lastChain: lastChain,
      maxChain: maxChain,
      playCount: playCount,
    );
  }

  QuizStatistics fromJson(Map<String, Object?> json) {
    return QuizStatistics.fromJson(json);
  }
}

/// @nodoc
const $QuizStatistics = _$QuizStatisticsTearOff();

/// @nodoc
mixin _$QuizStatistics {
  int get clearCount => throw _privateConstructorUsedError;
  int get currentChain => throw _privateConstructorUsedError;
  int get lastChain => throw _privateConstructorUsedError;
  int get maxChain => throw _privateConstructorUsedError;
  int get playCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizStatisticsCopyWith<QuizStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizStatisticsCopyWith<$Res> {
  factory $QuizStatisticsCopyWith(
          QuizStatistics value, $Res Function(QuizStatistics) then) =
      _$QuizStatisticsCopyWithImpl<$Res>;
  $Res call(
      {int clearCount,
      int currentChain,
      int lastChain,
      int maxChain,
      int playCount});
}

/// @nodoc
class _$QuizStatisticsCopyWithImpl<$Res>
    implements $QuizStatisticsCopyWith<$Res> {
  _$QuizStatisticsCopyWithImpl(this._value, this._then);

  final QuizStatistics _value;
  // ignore: unused_field
  final $Res Function(QuizStatistics) _then;

  @override
  $Res call({
    Object? clearCount = freezed,
    Object? currentChain = freezed,
    Object? lastChain = freezed,
    Object? maxChain = freezed,
    Object? playCount = freezed,
  }) {
    return _then(_value.copyWith(
      clearCount: clearCount == freezed
          ? _value.clearCount
          : clearCount // ignore: cast_nullable_to_non_nullable
              as int,
      currentChain: currentChain == freezed
          ? _value.currentChain
          : currentChain // ignore: cast_nullable_to_non_nullable
              as int,
      lastChain: lastChain == freezed
          ? _value.lastChain
          : lastChain // ignore: cast_nullable_to_non_nullable
              as int,
      maxChain: maxChain == freezed
          ? _value.maxChain
          : maxChain // ignore: cast_nullable_to_non_nullable
              as int,
      playCount: playCount == freezed
          ? _value.playCount
          : playCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$QuizStatisticsCopyWith<$Res>
    implements $QuizStatisticsCopyWith<$Res> {
  factory _$QuizStatisticsCopyWith(
          _QuizStatistics value, $Res Function(_QuizStatistics) then) =
      __$QuizStatisticsCopyWithImpl<$Res>;
  @override
  $Res call(
      {int clearCount,
      int currentChain,
      int lastChain,
      int maxChain,
      int playCount});
}

/// @nodoc
class __$QuizStatisticsCopyWithImpl<$Res>
    extends _$QuizStatisticsCopyWithImpl<$Res>
    implements _$QuizStatisticsCopyWith<$Res> {
  __$QuizStatisticsCopyWithImpl(
      _QuizStatistics _value, $Res Function(_QuizStatistics) _then)
      : super(_value, (v) => _then(v as _QuizStatistics));

  @override
  _QuizStatistics get _value => super._value as _QuizStatistics;

  @override
  $Res call({
    Object? clearCount = freezed,
    Object? currentChain = freezed,
    Object? lastChain = freezed,
    Object? maxChain = freezed,
    Object? playCount = freezed,
  }) {
    return _then(_QuizStatistics(
      clearCount: clearCount == freezed
          ? _value.clearCount
          : clearCount // ignore: cast_nullable_to_non_nullable
              as int,
      currentChain: currentChain == freezed
          ? _value.currentChain
          : currentChain // ignore: cast_nullable_to_non_nullable
              as int,
      lastChain: lastChain == freezed
          ? _value.lastChain
          : lastChain // ignore: cast_nullable_to_non_nullable
              as int,
      maxChain: maxChain == freezed
          ? _value.maxChain
          : maxChain // ignore: cast_nullable_to_non_nullable
              as int,
      playCount: playCount == freezed
          ? _value.playCount
          : playCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizStatistics
    with DiagnosticableTreeMixin
    implements _QuizStatistics {
  const _$_QuizStatistics(
      {this.clearCount = 0,
      this.currentChain = 0,
      this.lastChain = 0,
      this.maxChain = 0,
      this.playCount = 0});

  factory _$_QuizStatistics.fromJson(Map<String, dynamic> json) =>
      _$$_QuizStatisticsFromJson(json);

  @JsonKey()
  @override
  final int clearCount;
  @JsonKey()
  @override
  final int currentChain;
  @JsonKey()
  @override
  final int lastChain;
  @JsonKey()
  @override
  final int maxChain;
  @JsonKey()
  @override
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizStatistics &&
            const DeepCollectionEquality()
                .equals(other.clearCount, clearCount) &&
            const DeepCollectionEquality()
                .equals(other.currentChain, currentChain) &&
            const DeepCollectionEquality().equals(other.lastChain, lastChain) &&
            const DeepCollectionEquality().equals(other.maxChain, maxChain) &&
            const DeepCollectionEquality().equals(other.playCount, playCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(clearCount),
      const DeepCollectionEquality().hash(currentChain),
      const DeepCollectionEquality().hash(lastChain),
      const DeepCollectionEquality().hash(maxChain),
      const DeepCollectionEquality().hash(playCount));

  @JsonKey(ignore: true)
  @override
  _$QuizStatisticsCopyWith<_QuizStatistics> get copyWith =>
      __$QuizStatisticsCopyWithImpl<_QuizStatistics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizStatisticsToJson(this);
  }
}

abstract class _QuizStatistics implements QuizStatistics {
  const factory _QuizStatistics(
      {int clearCount,
      int currentChain,
      int lastChain,
      int maxChain,
      int playCount}) = _$_QuizStatistics;

  factory _QuizStatistics.fromJson(Map<String, dynamic> json) =
      _$_QuizStatistics.fromJson;

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
  @override
  @JsonKey(ignore: true)
  _$QuizStatisticsCopyWith<_QuizStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}
