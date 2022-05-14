// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quiz_page_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizPageInfo _$QuizPageInfoFromJson(Map<String, dynamic> json) {
  return _QuizPageInfo.fromJson(json);
}

/// @nodoc
class _$QuizPageInfoTearOff {
  const _$QuizPageInfoTearOff();

  _QuizPageInfo call(
      {bool showAnswer = false,
      bool showStatistics = false,
      bool normalKeyboard = true,
      bool showQuizSelection = false,
      bool showResult = false,
      bool showQuizChanged = false}) {
    return _QuizPageInfo(
      showAnswer: showAnswer,
      showStatistics: showStatistics,
      normalKeyboard: normalKeyboard,
      showQuizSelection: showQuizSelection,
      showResult: showResult,
      showQuizChanged: showQuizChanged,
    );
  }

  QuizPageInfo fromJson(Map<String, Object?> json) {
    return QuizPageInfo.fromJson(json);
  }
}

/// @nodoc
const $QuizPageInfo = _$QuizPageInfoTearOff();

/// @nodoc
mixin _$QuizPageInfo {
  bool get showAnswer => throw _privateConstructorUsedError;
  bool get showStatistics => throw _privateConstructorUsedError;
  bool get normalKeyboard => throw _privateConstructorUsedError;
  bool get showQuizSelection => throw _privateConstructorUsedError;
  bool get showResult => throw _privateConstructorUsedError;
  bool get showQuizChanged => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizPageInfoCopyWith<QuizPageInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizPageInfoCopyWith<$Res> {
  factory $QuizPageInfoCopyWith(
          QuizPageInfo value, $Res Function(QuizPageInfo) then) =
      _$QuizPageInfoCopyWithImpl<$Res>;
  $Res call(
      {bool showAnswer,
      bool showStatistics,
      bool normalKeyboard,
      bool showQuizSelection,
      bool showResult,
      bool showQuizChanged});
}

/// @nodoc
class _$QuizPageInfoCopyWithImpl<$Res> implements $QuizPageInfoCopyWith<$Res> {
  _$QuizPageInfoCopyWithImpl(this._value, this._then);

  final QuizPageInfo _value;
  // ignore: unused_field
  final $Res Function(QuizPageInfo) _then;

  @override
  $Res call({
    Object? showAnswer = freezed,
    Object? showStatistics = freezed,
    Object? normalKeyboard = freezed,
    Object? showQuizSelection = freezed,
    Object? showResult = freezed,
    Object? showQuizChanged = freezed,
  }) {
    return _then(_value.copyWith(
      showAnswer: showAnswer == freezed
          ? _value.showAnswer
          : showAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      showStatistics: showStatistics == freezed
          ? _value.showStatistics
          : showStatistics // ignore: cast_nullable_to_non_nullable
              as bool,
      normalKeyboard: normalKeyboard == freezed
          ? _value.normalKeyboard
          : normalKeyboard // ignore: cast_nullable_to_non_nullable
              as bool,
      showQuizSelection: showQuizSelection == freezed
          ? _value.showQuizSelection
          : showQuizSelection // ignore: cast_nullable_to_non_nullable
              as bool,
      showResult: showResult == freezed
          ? _value.showResult
          : showResult // ignore: cast_nullable_to_non_nullable
              as bool,
      showQuizChanged: showQuizChanged == freezed
          ? _value.showQuizChanged
          : showQuizChanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$QuizPageInfoCopyWith<$Res>
    implements $QuizPageInfoCopyWith<$Res> {
  factory _$QuizPageInfoCopyWith(
          _QuizPageInfo value, $Res Function(_QuizPageInfo) then) =
      __$QuizPageInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool showAnswer,
      bool showStatistics,
      bool normalKeyboard,
      bool showQuizSelection,
      bool showResult,
      bool showQuizChanged});
}

/// @nodoc
class __$QuizPageInfoCopyWithImpl<$Res> extends _$QuizPageInfoCopyWithImpl<$Res>
    implements _$QuizPageInfoCopyWith<$Res> {
  __$QuizPageInfoCopyWithImpl(
      _QuizPageInfo _value, $Res Function(_QuizPageInfo) _then)
      : super(_value, (v) => _then(v as _QuizPageInfo));

  @override
  _QuizPageInfo get _value => super._value as _QuizPageInfo;

  @override
  $Res call({
    Object? showAnswer = freezed,
    Object? showStatistics = freezed,
    Object? normalKeyboard = freezed,
    Object? showQuizSelection = freezed,
    Object? showResult = freezed,
    Object? showQuizChanged = freezed,
  }) {
    return _then(_QuizPageInfo(
      showAnswer: showAnswer == freezed
          ? _value.showAnswer
          : showAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      showStatistics: showStatistics == freezed
          ? _value.showStatistics
          : showStatistics // ignore: cast_nullable_to_non_nullable
              as bool,
      normalKeyboard: normalKeyboard == freezed
          ? _value.normalKeyboard
          : normalKeyboard // ignore: cast_nullable_to_non_nullable
              as bool,
      showQuizSelection: showQuizSelection == freezed
          ? _value.showQuizSelection
          : showQuizSelection // ignore: cast_nullable_to_non_nullable
              as bool,
      showResult: showResult == freezed
          ? _value.showResult
          : showResult // ignore: cast_nullable_to_non_nullable
              as bool,
      showQuizChanged: showQuizChanged == freezed
          ? _value.showQuizChanged
          : showQuizChanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizPageInfo with DiagnosticableTreeMixin implements _QuizPageInfo {
  const _$_QuizPageInfo(
      {this.showAnswer = false,
      this.showStatistics = false,
      this.normalKeyboard = true,
      this.showQuizSelection = false,
      this.showResult = false,
      this.showQuizChanged = false});

  factory _$_QuizPageInfo.fromJson(Map<String, dynamic> json) =>
      _$$_QuizPageInfoFromJson(json);

  @JsonKey()
  @override
  final bool showAnswer;
  @JsonKey()
  @override
  final bool showStatistics;
  @JsonKey()
  @override
  final bool normalKeyboard;
  @JsonKey()
  @override
  final bool showQuizSelection;
  @JsonKey()
  @override
  final bool showResult;
  @JsonKey()
  @override
  final bool showQuizChanged;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuizPageInfo(showAnswer: $showAnswer, showStatistics: $showStatistics, normalKeyboard: $normalKeyboard, showQuizSelection: $showQuizSelection, showResult: $showResult, showQuizChanged: $showQuizChanged)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuizPageInfo'))
      ..add(DiagnosticsProperty('showAnswer', showAnswer))
      ..add(DiagnosticsProperty('showStatistics', showStatistics))
      ..add(DiagnosticsProperty('normalKeyboard', normalKeyboard))
      ..add(DiagnosticsProperty('showQuizSelection', showQuizSelection))
      ..add(DiagnosticsProperty('showResult', showResult))
      ..add(DiagnosticsProperty('showQuizChanged', showQuizChanged));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizPageInfo &&
            const DeepCollectionEquality()
                .equals(other.showAnswer, showAnswer) &&
            const DeepCollectionEquality()
                .equals(other.showStatistics, showStatistics) &&
            const DeepCollectionEquality()
                .equals(other.normalKeyboard, normalKeyboard) &&
            const DeepCollectionEquality()
                .equals(other.showQuizSelection, showQuizSelection) &&
            const DeepCollectionEquality()
                .equals(other.showResult, showResult) &&
            const DeepCollectionEquality()
                .equals(other.showQuizChanged, showQuizChanged));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(showAnswer),
      const DeepCollectionEquality().hash(showStatistics),
      const DeepCollectionEquality().hash(normalKeyboard),
      const DeepCollectionEquality().hash(showQuizSelection),
      const DeepCollectionEquality().hash(showResult),
      const DeepCollectionEquality().hash(showQuizChanged));

  @JsonKey(ignore: true)
  @override
  _$QuizPageInfoCopyWith<_QuizPageInfo> get copyWith =>
      __$QuizPageInfoCopyWithImpl<_QuizPageInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizPageInfoToJson(this);
  }
}

abstract class _QuizPageInfo implements QuizPageInfo {
  const factory _QuizPageInfo(
      {bool showAnswer,
      bool showStatistics,
      bool normalKeyboard,
      bool showQuizSelection,
      bool showResult,
      bool showQuizChanged}) = _$_QuizPageInfo;

  factory _QuizPageInfo.fromJson(Map<String, dynamic> json) =
      _$_QuizPageInfo.fromJson;

  @override
  bool get showAnswer;
  @override
  bool get showStatistics;
  @override
  bool get normalKeyboard;
  @override
  bool get showQuizSelection;
  @override
  bool get showResult;
  @override
  bool get showQuizChanged;
  @override
  @JsonKey(ignore: true)
  _$QuizPageInfoCopyWith<_QuizPageInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
