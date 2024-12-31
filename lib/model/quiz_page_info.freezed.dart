// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_page_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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

  /// Serializes this QuizPageInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizPageInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizPageInfoCopyWith<QuizPageInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizPageInfoCopyWith<$Res> {
  factory $QuizPageInfoCopyWith(
          QuizPageInfo value, $Res Function(QuizPageInfo) then) =
      _$QuizPageInfoCopyWithImpl<$Res, QuizPageInfo>;
  @useResult
  $Res call(
      {bool showAnswer,
      bool showStatistics,
      bool normalKeyboard,
      bool showQuizSelection,
      bool showResult,
      bool showQuizChanged});
}

/// @nodoc
class _$QuizPageInfoCopyWithImpl<$Res, $Val extends QuizPageInfo>
    implements $QuizPageInfoCopyWith<$Res> {
  _$QuizPageInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizPageInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showAnswer = null,
    Object? showStatistics = null,
    Object? normalKeyboard = null,
    Object? showQuizSelection = null,
    Object? showResult = null,
    Object? showQuizChanged = null,
  }) {
    return _then(_value.copyWith(
      showAnswer: null == showAnswer
          ? _value.showAnswer
          : showAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      showStatistics: null == showStatistics
          ? _value.showStatistics
          : showStatistics // ignore: cast_nullable_to_non_nullable
              as bool,
      normalKeyboard: null == normalKeyboard
          ? _value.normalKeyboard
          : normalKeyboard // ignore: cast_nullable_to_non_nullable
              as bool,
      showQuizSelection: null == showQuizSelection
          ? _value.showQuizSelection
          : showQuizSelection // ignore: cast_nullable_to_non_nullable
              as bool,
      showResult: null == showResult
          ? _value.showResult
          : showResult // ignore: cast_nullable_to_non_nullable
              as bool,
      showQuizChanged: null == showQuizChanged
          ? _value.showQuizChanged
          : showQuizChanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizPageInfoImplCopyWith<$Res>
    implements $QuizPageInfoCopyWith<$Res> {
  factory _$$QuizPageInfoImplCopyWith(
          _$QuizPageInfoImpl value, $Res Function(_$QuizPageInfoImpl) then) =
      __$$QuizPageInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool showAnswer,
      bool showStatistics,
      bool normalKeyboard,
      bool showQuizSelection,
      bool showResult,
      bool showQuizChanged});
}

/// @nodoc
class __$$QuizPageInfoImplCopyWithImpl<$Res>
    extends _$QuizPageInfoCopyWithImpl<$Res, _$QuizPageInfoImpl>
    implements _$$QuizPageInfoImplCopyWith<$Res> {
  __$$QuizPageInfoImplCopyWithImpl(
      _$QuizPageInfoImpl _value, $Res Function(_$QuizPageInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizPageInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showAnswer = null,
    Object? showStatistics = null,
    Object? normalKeyboard = null,
    Object? showQuizSelection = null,
    Object? showResult = null,
    Object? showQuizChanged = null,
  }) {
    return _then(_$QuizPageInfoImpl(
      showAnswer: null == showAnswer
          ? _value.showAnswer
          : showAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      showStatistics: null == showStatistics
          ? _value.showStatistics
          : showStatistics // ignore: cast_nullable_to_non_nullable
              as bool,
      normalKeyboard: null == normalKeyboard
          ? _value.normalKeyboard
          : normalKeyboard // ignore: cast_nullable_to_non_nullable
              as bool,
      showQuizSelection: null == showQuizSelection
          ? _value.showQuizSelection
          : showQuizSelection // ignore: cast_nullable_to_non_nullable
              as bool,
      showResult: null == showResult
          ? _value.showResult
          : showResult // ignore: cast_nullable_to_non_nullable
              as bool,
      showQuizChanged: null == showQuizChanged
          ? _value.showQuizChanged
          : showQuizChanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizPageInfoImpl with DiagnosticableTreeMixin implements _QuizPageInfo {
  const _$QuizPageInfoImpl(
      {this.showAnswer = false,
      this.showStatistics = false,
      this.normalKeyboard = true,
      this.showQuizSelection = false,
      this.showResult = false,
      this.showQuizChanged = false});

  factory _$QuizPageInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizPageInfoImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizPageInfoImpl &&
            (identical(other.showAnswer, showAnswer) ||
                other.showAnswer == showAnswer) &&
            (identical(other.showStatistics, showStatistics) ||
                other.showStatistics == showStatistics) &&
            (identical(other.normalKeyboard, normalKeyboard) ||
                other.normalKeyboard == normalKeyboard) &&
            (identical(other.showQuizSelection, showQuizSelection) ||
                other.showQuizSelection == showQuizSelection) &&
            (identical(other.showResult, showResult) ||
                other.showResult == showResult) &&
            (identical(other.showQuizChanged, showQuizChanged) ||
                other.showQuizChanged == showQuizChanged));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, showAnswer, showStatistics,
      normalKeyboard, showQuizSelection, showResult, showQuizChanged);

  /// Create a copy of QuizPageInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizPageInfoImplCopyWith<_$QuizPageInfoImpl> get copyWith =>
      __$$QuizPageInfoImplCopyWithImpl<_$QuizPageInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizPageInfoImplToJson(
      this,
    );
  }
}

abstract class _QuizPageInfo implements QuizPageInfo {
  const factory _QuizPageInfo(
      {final bool showAnswer,
      final bool showStatistics,
      final bool normalKeyboard,
      final bool showQuizSelection,
      final bool showResult,
      final bool showQuizChanged}) = _$QuizPageInfoImpl;

  factory _QuizPageInfo.fromJson(Map<String, dynamic> json) =
      _$QuizPageInfoImpl.fromJson;

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

  /// Create a copy of QuizPageInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizPageInfoImplCopyWith<_$QuizPageInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
