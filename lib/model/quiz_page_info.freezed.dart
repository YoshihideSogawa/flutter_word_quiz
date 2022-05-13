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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizPageInfo _$QuizPageInfoFromJson(Map<String, dynamic> json) {
  return _QuizPageInfo.fromJson(json);
}

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
abstract class _$$_QuizPageInfoCopyWith<$Res>
    implements $QuizPageInfoCopyWith<$Res> {
  factory _$$_QuizPageInfoCopyWith(
          _$_QuizPageInfo value, $Res Function(_$_QuizPageInfo) then) =
      __$$_QuizPageInfoCopyWithImpl<$Res>;
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
class __$$_QuizPageInfoCopyWithImpl<$Res>
    extends _$QuizPageInfoCopyWithImpl<$Res>
    implements _$$_QuizPageInfoCopyWith<$Res> {
  __$$_QuizPageInfoCopyWithImpl(
      _$_QuizPageInfo _value, $Res Function(_$_QuizPageInfo) _then)
      : super(_value, (v) => _then(v as _$_QuizPageInfo));

  @override
  _$_QuizPageInfo get _value => super._value as _$_QuizPageInfo;

  @override
  $Res call({
    Object? showAnswer = freezed,
    Object? showStatistics = freezed,
    Object? normalKeyboard = freezed,
    Object? showQuizSelection = freezed,
    Object? showResult = freezed,
    Object? showQuizChanged = freezed,
  }) {
    return _then(_$_QuizPageInfo(
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

  @override
  @JsonKey()
  final bool showAnswer;
  @override
  @JsonKey()
  final bool showStatistics;
  @override
  @JsonKey()
  final bool normalKeyboard;
  @override
  @JsonKey()
  final bool showQuizSelection;
  @override
  @JsonKey()
  final bool showResult;
  @override
  @JsonKey()
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
            other is _$_QuizPageInfo &&
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

  @JsonKey(ignore: true)
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
  _$$_QuizPageInfoCopyWith<_$_QuizPageInfo> get copyWith =>
      __$$_QuizPageInfoCopyWithImpl<_$_QuizPageInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizPageInfoToJson(this);
  }
}

abstract class _QuizPageInfo implements QuizPageInfo {
  const factory _QuizPageInfo(
      {final bool showAnswer,
      final bool showStatistics,
      final bool normalKeyboard,
      final bool showQuizSelection,
      final bool showResult,
      final bool showQuizChanged}) = _$_QuizPageInfo;

  factory _QuizPageInfo.fromJson(Map<String, dynamic> json) =
      _$_QuizPageInfo.fromJson;

  @override
  bool get showAnswer => throw _privateConstructorUsedError;
  @override
  bool get showStatistics => throw _privateConstructorUsedError;
  @override
  bool get normalKeyboard => throw _privateConstructorUsedError;
  @override
  bool get showQuizSelection => throw _privateConstructorUsedError;
  @override
  bool get showResult => throw _privateConstructorUsedError;
  @override
  bool get showQuizChanged => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_QuizPageInfoCopyWith<_$_QuizPageInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
