// Mocks generated by Mockito 5.1.0 from annotations
// in word_quiz/test/mock/generate_mocks.dart.
// Do not manually edit this file.

import 'dart:async' as _i9;

import 'package:hooks_riverpod/hooks_riverpod.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:state_notifier/state_notifier.dart' as _i16;
import 'package:word_quiz/model/monster.dart' as _i2;
import 'package:word_quiz/model/quiz_info.dart' as _i15;
import 'package:word_quiz/model/quiz_page_info.dart' as _i4;
import 'package:word_quiz/model/quiz_range.dart' as _i5;
import 'package:word_quiz/model/quiz_statistics.dart' as _i6;
import 'package:word_quiz/model/word_input.dart' as _i7;
import 'package:word_quiz/provider/data_settings_provider.dart' as _i10;
import 'package:word_quiz/provider/monster_picker_provider.dart' as _i11;
import 'package:word_quiz/provider/parental_control_provider.dart' as _i13;
import 'package:word_quiz/provider/quiz_info_provider.dart' as _i14;
import 'package:word_quiz/provider/quiz_page_provider.dart' as _i17;
import 'package:word_quiz/provider/settings_input_type_provider.dart' as _i19;
import 'package:word_quiz/provider/settings_quiz_range_provider.dart' as _i20;
import 'package:word_quiz/provider/statistics_provider.dart' as _i22;
import 'package:word_quiz/provider/word_input_provider.dart' as _i23;
import 'package:word_quiz/repository/app_property_repository.dart' as _i8;
import 'package:word_quiz/repository/monster_repository.dart' as _i12;
import 'package:word_quiz/repository/quiz_repository.dart' as _i18;
import 'package:word_quiz/repository/settings_repository.dart' as _i21;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeMonster_0 extends _i1.Fake implements _i2.Monster {}

class _FakeAsyncValue_1<T> extends _i1.Fake implements _i3.AsyncValue<T> {}

class _FakeQuizPageInfo_2 extends _i1.Fake implements _i4.QuizPageInfo {}

class _FakeQuizRange_3 extends _i1.Fake implements _i5.QuizRange {}

class _FakeQuizStatistics_4 extends _i1.Fake implements _i6.QuizStatistics {}

class _FakeWordInput_5 extends _i1.Fake implements _i7.WordInput {}

/// A class which mocks [AppPropertyRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppPropertyRepository extends _i1.Mock
    implements _i8.AppPropertyRepository {
  MockAppPropertyRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool alreadyLaunched() =>
      (super.noSuchMethod(Invocation.method(#alreadyLaunched, []),
          returnValue: false) as bool);
  @override
  _i9.Future<void> saveLaunched() =>
      (super.noSuchMethod(Invocation.method(#saveLaunched, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<void> saveParentalControl({bool? parentalControl}) =>
      (super.noSuchMethod(
          Invocation.method(
              #saveParentalControl, [], {#parentalControl: parentalControl}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
}

/// A class which mocks [DataSettings].
///
/// See the documentation for Mockito's code generation for more information.
class MockDataSettings extends _i1.Mock implements _i10.DataSettings {
  MockDataSettings() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<void> deleteAll() =>
      (super.noSuchMethod(Invocation.method(#deleteAll, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
}

/// A class which mocks [MonsterPicker].
///
/// See the documentation for Mockito's code generation for more information.
class MockMonsterPicker extends _i1.Mock implements _i11.MonsterPicker {
  MockMonsterPicker() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i2.Monster> pick({_i5.QuizRange? range, int? seed}) =>
      (super.noSuchMethod(
              Invocation.method(#pick, [], {#range: range, #seed: seed}),
              returnValue: Future<_i2.Monster>.value(_FakeMonster_0()))
          as _i9.Future<_i2.Monster>);
}

/// A class which mocks [MonsterRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMonsterRepository extends _i1.Mock implements _i12.MonsterRepository {
  MockMonsterRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<List<_i2.Monster>> load() =>
      (super.noSuchMethod(Invocation.method(#load, []),
              returnValue: Future<List<_i2.Monster>>.value(<_i2.Monster>[]))
          as _i9.Future<List<_i2.Monster>>);
}

/// A class which mocks [ParentalControl].
///
/// See the documentation for Mockito's code generation for more information.
class MockParentalControl extends _i1.Mock implements _i13.ParentalControl {
  MockParentalControl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool isParentalControl() =>
      (super.noSuchMethod(Invocation.method(#isParentalControl, []),
          returnValue: false) as bool);
}

/// A class which mocks [QuizInfoNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockQuizInfoNotifier extends _i1.Mock implements _i14.QuizInfoNotifier {
  MockQuizInfoNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set onError(_i3.ErrorListener? _onError) =>
      super.noSuchMethod(Invocation.setter(#onError, _onError),
          returnValueForMissingStub: null);
  @override
  bool get mounted =>
      (super.noSuchMethod(Invocation.getter(#mounted), returnValue: false)
          as bool);
  @override
  _i9.Stream<_i3.AsyncValue<_i15.QuizInfo>> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
              returnValue: Stream<_i3.AsyncValue<_i15.QuizInfo>>.empty())
          as _i9.Stream<_i3.AsyncValue<_i15.QuizInfo>>);
  @override
  _i3.AsyncValue<_i15.QuizInfo> get state =>
      (super.noSuchMethod(Invocation.getter(#state),
              returnValue: _FakeAsyncValue_1<_i15.QuizInfo>())
          as _i3.AsyncValue<_i15.QuizInfo>);
  @override
  set state(_i3.AsyncValue<_i15.QuizInfo>? value) =>
      super.noSuchMethod(Invocation.setter(#state, value),
          returnValueForMissingStub: null);
  @override
  _i3.AsyncValue<_i15.QuizInfo> get debugState =>
      (super.noSuchMethod(Invocation.getter(#debugState),
              returnValue: _FakeAsyncValue_1<_i15.QuizInfo>())
          as _i3.AsyncValue<_i15.QuizInfo>);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  _i9.Future<void> init() => (super.noSuchMethod(Invocation.method(#init, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<bool> refreshDailyQuiz() =>
      (super.noSuchMethod(Invocation.method(#refreshDailyQuiz, []),
          returnValue: Future<bool>.value(false)) as _i9.Future<bool>);
  @override
  _i9.Future<void> startQuiz(String? seedText, _i5.QuizRange? quizRange) =>
      (super.noSuchMethod(Invocation.method(#startQuiz, [seedText, quizRange]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<void> nextQuiz() =>
      (super.noSuchMethod(Invocation.method(#nextQuiz, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<void> quitQuiz() =>
      (super.noSuchMethod(Invocation.method(#quitQuiz, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<void> retireQuiz() =>
      (super.noSuchMethod(Invocation.method(#retireQuiz, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<void> updateQuiz() =>
      (super.noSuchMethod(Invocation.method(#updateQuiz, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  void updateQuizInfo(_i15.QuizInfo? quizInfo) =>
      super.noSuchMethod(Invocation.method(#updateQuizInfo, [quizInfo]),
          returnValueForMissingStub: null);
  @override
  bool updateShouldNotify(_i3.AsyncValue<_i15.QuizInfo>? old,
          _i3.AsyncValue<_i15.QuizInfo>? current) =>
      (super.noSuchMethod(
          Invocation.method(#updateShouldNotify, [old, current]),
          returnValue: false) as bool);
  @override
  _i3.RemoveListener addListener(
          _i16.Listener<_i3.AsyncValue<_i15.QuizInfo>>? listener,
          {bool? fireImmediately = true}) =>
      (super.noSuchMethod(
          Invocation.method(
              #addListener, [listener], {#fireImmediately: fireImmediately}),
          returnValue: () {}) as _i3.RemoveListener);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
}

/// A class which mocks [QuizPageNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockQuizPageNotifier extends _i1.Mock implements _i17.QuizPageNotifier {
  MockQuizPageNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set onError(_i3.ErrorListener? _onError) =>
      super.noSuchMethod(Invocation.setter(#onError, _onError),
          returnValueForMissingStub: null);
  @override
  bool get mounted =>
      (super.noSuchMethod(Invocation.getter(#mounted), returnValue: false)
          as bool);
  @override
  _i9.Stream<_i4.QuizPageInfo> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
              returnValue: Stream<_i4.QuizPageInfo>.empty())
          as _i9.Stream<_i4.QuizPageInfo>);
  @override
  _i4.QuizPageInfo get state => (super.noSuchMethod(Invocation.getter(#state),
      returnValue: _FakeQuizPageInfo_2()) as _i4.QuizPageInfo);
  @override
  set state(_i4.QuizPageInfo? value) =>
      super.noSuchMethod(Invocation.setter(#state, value),
          returnValueForMissingStub: null);
  @override
  _i4.QuizPageInfo get debugState =>
      (super.noSuchMethod(Invocation.getter(#debugState),
          returnValue: _FakeQuizPageInfo_2()) as _i4.QuizPageInfo);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  void showStatistics() =>
      super.noSuchMethod(Invocation.method(#showStatistics, []),
          returnValueForMissingStub: null);
  @override
  void dismissStatistics() =>
      super.noSuchMethod(Invocation.method(#dismissStatistics, []),
          returnValueForMissingStub: null);
  @override
  void showAnswer() => super.noSuchMethod(Invocation.method(#showAnswer, []),
      returnValueForMissingStub: null);
  @override
  void dismissAnswer() =>
      super.noSuchMethod(Invocation.method(#dismissAnswer, []),
          returnValueForMissingStub: null);
  @override
  void updateKeyboard({bool? isNormalKeyboard}) => super.noSuchMethod(
      Invocation.method(
          #updateKeyboard, [], {#isNormalKeyboard: isNormalKeyboard}),
      returnValueForMissingStub: null);
  @override
  void showQuizSelection() =>
      super.noSuchMethod(Invocation.method(#showQuizSelection, []),
          returnValueForMissingStub: null);
  @override
  void dismissQuizSelection() =>
      super.noSuchMethod(Invocation.method(#dismissQuizSelection, []),
          returnValueForMissingStub: null);
  @override
  void showResult() => super.noSuchMethod(Invocation.method(#showResult, []),
      returnValueForMissingStub: null);
  @override
  void dismissResult() =>
      super.noSuchMethod(Invocation.method(#dismissResult, []),
          returnValueForMissingStub: null);
  @override
  void showQuizChanged() =>
      super.noSuchMethod(Invocation.method(#showQuizChanged, []),
          returnValueForMissingStub: null);
  @override
  void dismissQuizChanged() =>
      super.noSuchMethod(Invocation.method(#dismissQuizChanged, []),
          returnValueForMissingStub: null);
  @override
  bool updateShouldNotify(_i4.QuizPageInfo? old, _i4.QuizPageInfo? current) =>
      (super.noSuchMethod(
          Invocation.method(#updateShouldNotify, [old, current]),
          returnValue: false) as bool);
  @override
  _i3.RemoveListener addListener(_i16.Listener<_i4.QuizPageInfo>? listener,
          {bool? fireImmediately = true}) =>
      (super.noSuchMethod(
          Invocation.method(
              #addListener, [listener], {#fireImmediately: fireImmediately}),
          returnValue: () {}) as _i3.RemoveListener);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
}

/// A class which mocks [QuizRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockQuizRepository extends _i1.Mock implements _i18.QuizRepository {
  MockQuizRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<void> saveQuizInfo(_i15.QuizInfo? quizInfo) =>
      (super.noSuchMethod(Invocation.method(#saveQuizInfo, [quizInfo]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<void> saveWordInput(_i7.WordInput? wordInput) =>
      (super.noSuchMethod(Invocation.method(#saveWordInput, [wordInput]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<void> saveStatistics(_i6.QuizStatistics? statistics) =>
      (super.noSuchMethod(Invocation.method(#saveStatistics, [statistics]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<int> deleteAll() =>
      (super.noSuchMethod(Invocation.method(#deleteAll, []),
          returnValue: Future<int>.value(0)) as _i9.Future<int>);
}

/// A class which mocks [SettingsInputTypeNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockSettingsInputTypeNotifier extends _i1.Mock
    implements _i19.SettingsInputTypeNotifier {
  MockSettingsInputTypeNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set onError(_i3.ErrorListener? _onError) =>
      super.noSuchMethod(Invocation.setter(#onError, _onError),
          returnValueForMissingStub: null);
  @override
  bool get mounted =>
      (super.noSuchMethod(Invocation.getter(#mounted), returnValue: false)
          as bool);
  @override
  _i9.Stream<int> get stream => (super.noSuchMethod(Invocation.getter(#stream),
      returnValue: Stream<int>.empty()) as _i9.Stream<int>);
  @override
  int get state =>
      (super.noSuchMethod(Invocation.getter(#state), returnValue: 0) as int);
  @override
  set state(int? value) => super.noSuchMethod(Invocation.setter(#state, value),
      returnValueForMissingStub: null);
  @override
  int get debugState =>
      (super.noSuchMethod(Invocation.getter(#debugState), returnValue: 0)
          as int);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  void init() => super.noSuchMethod(Invocation.method(#init, []),
      returnValueForMissingStub: null);
  @override
  void updateInputType(int? value) =>
      super.noSuchMethod(Invocation.method(#updateInputType, [value]),
          returnValueForMissingStub: null);
  @override
  bool updateShouldNotify(int? old, int? current) => (super.noSuchMethod(
      Invocation.method(#updateShouldNotify, [old, current]),
      returnValue: false) as bool);
  @override
  _i3.RemoveListener addListener(_i16.Listener<int>? listener,
          {bool? fireImmediately = true}) =>
      (super.noSuchMethod(
          Invocation.method(
              #addListener, [listener], {#fireImmediately: fireImmediately}),
          returnValue: () {}) as _i3.RemoveListener);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
}

/// A class which mocks [SettingsQuizRangeNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockSettingsQuizRangeNotifier extends _i1.Mock
    implements _i20.SettingsQuizRangeNotifier {
  MockSettingsQuizRangeNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set onError(_i3.ErrorListener? _onError) =>
      super.noSuchMethod(Invocation.setter(#onError, _onError),
          returnValueForMissingStub: null);
  @override
  bool get mounted =>
      (super.noSuchMethod(Invocation.getter(#mounted), returnValue: false)
          as bool);
  @override
  _i9.Stream<_i5.QuizRange> get stream => (super.noSuchMethod(
      Invocation.getter(#stream),
      returnValue: Stream<_i5.QuizRange>.empty()) as _i9.Stream<_i5.QuizRange>);
  @override
  _i5.QuizRange get state => (super.noSuchMethod(Invocation.getter(#state),
      returnValue: _FakeQuizRange_3()) as _i5.QuizRange);
  @override
  set state(_i5.QuizRange? value) =>
      super.noSuchMethod(Invocation.setter(#state, value),
          returnValueForMissingStub: null);
  @override
  _i5.QuizRange get debugState =>
      (super.noSuchMethod(Invocation.getter(#debugState),
          returnValue: _FakeQuizRange_3()) as _i5.QuizRange);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  void init() => super.noSuchMethod(Invocation.method(#init, []),
      returnValueForMissingStub: null);
  @override
  void updateQuizRange(_i5.QuizRange? quizRange) =>
      super.noSuchMethod(Invocation.method(#updateQuizRange, [quizRange]),
          returnValueForMissingStub: null);
  @override
  bool updateShouldNotify(_i5.QuizRange? old, _i5.QuizRange? current) => (super
      .noSuchMethod(Invocation.method(#updateShouldNotify, [old, current]),
          returnValue: false) as bool);
  @override
  _i3.RemoveListener addListener(_i16.Listener<_i5.QuizRange>? listener,
          {bool? fireImmediately = true}) =>
      (super.noSuchMethod(
          Invocation.method(
              #addListener, [listener], {#fireImmediately: fireImmediately}),
          returnValue: () {}) as _i3.RemoveListener);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
}

/// A class which mocks [SettingsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSettingsRepository extends _i1.Mock
    implements _i21.SettingsRepository {
  MockSettingsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<void> saveInputType(int? inputType) =>
      (super.noSuchMethod(Invocation.method(#saveInputType, [inputType]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<void> saveQuizRangeId(int? quizRangeId) =>
      (super.noSuchMethod(Invocation.method(#saveQuizRangeId, [quizRangeId]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
}

/// A class which mocks [StatisticsNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockStatisticsNotifier extends _i1.Mock
    implements _i22.StatisticsNotifier {
  MockStatisticsNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set onError(_i3.ErrorListener? _onError) =>
      super.noSuchMethod(Invocation.setter(#onError, _onError),
          returnValueForMissingStub: null);
  @override
  bool get mounted =>
      (super.noSuchMethod(Invocation.getter(#mounted), returnValue: false)
          as bool);
  @override
  _i9.Stream<_i6.QuizStatistics> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
              returnValue: Stream<_i6.QuizStatistics>.empty())
          as _i9.Stream<_i6.QuizStatistics>);
  @override
  _i6.QuizStatistics get state => (super.noSuchMethod(Invocation.getter(#state),
      returnValue: _FakeQuizStatistics_4()) as _i6.QuizStatistics);
  @override
  set state(_i6.QuizStatistics? value) =>
      super.noSuchMethod(Invocation.setter(#state, value),
          returnValueForMissingStub: null);
  @override
  _i6.QuizStatistics get debugState =>
      (super.noSuchMethod(Invocation.getter(#debugState),
          returnValue: _FakeQuizStatistics_4()) as _i6.QuizStatistics);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  void init() => super.noSuchMethod(Invocation.method(#init, []),
      returnValueForMissingStub: null);
  @override
  void startQuiz() => super.noSuchMethod(Invocation.method(#startQuiz, []),
      returnValueForMissingStub: null);
  @override
  void nextQuiz() => super.noSuchMethod(Invocation.method(#nextQuiz, []),
      returnValueForMissingStub: null);
  @override
  void successQuiz() => super.noSuchMethod(Invocation.method(#successQuiz, []),
      returnValueForMissingStub: null);
  @override
  void finishQuiz() => super.noSuchMethod(Invocation.method(#finishQuiz, []),
      returnValueForMissingStub: null);
  @override
  bool updateShouldNotify(
          _i6.QuizStatistics? old, _i6.QuizStatistics? current) =>
      (super.noSuchMethod(
          Invocation.method(#updateShouldNotify, [old, current]),
          returnValue: false) as bool);
  @override
  _i3.RemoveListener addListener(_i16.Listener<_i6.QuizStatistics>? listener,
          {bool? fireImmediately = true}) =>
      (super.noSuchMethod(
          Invocation.method(
              #addListener, [listener], {#fireImmediately: fireImmediately}),
          returnValue: () {}) as _i3.RemoveListener);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
}

/// A class which mocks [WordInputNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockWordInputNotifier extends _i1.Mock implements _i23.WordInputNotifier {
  MockWordInputNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set onError(_i3.ErrorListener? _onError) =>
      super.noSuchMethod(Invocation.setter(#onError, _onError),
          returnValueForMissingStub: null);
  @override
  bool get mounted =>
      (super.noSuchMethod(Invocation.getter(#mounted), returnValue: false)
          as bool);
  @override
  _i9.Stream<_i7.WordInput> get stream => (super.noSuchMethod(
      Invocation.getter(#stream),
      returnValue: Stream<_i7.WordInput>.empty()) as _i9.Stream<_i7.WordInput>);
  @override
  _i7.WordInput get state => (super.noSuchMethod(Invocation.getter(#state),
      returnValue: _FakeWordInput_5()) as _i7.WordInput);
  @override
  set state(_i7.WordInput? value) =>
      super.noSuchMethod(Invocation.setter(#state, value),
          returnValueForMissingStub: null);
  @override
  _i7.WordInput get debugState =>
      (super.noSuchMethod(Invocation.getter(#debugState),
          returnValue: _FakeWordInput_5()) as _i7.WordInput);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  void inputWord(String? text) =>
      super.noSuchMethod(Invocation.method(#inputWord, [text]),
          returnValueForMissingStub: null);
  @override
  void deleteWord() => super.noSuchMethod(Invocation.method(#deleteWord, []),
      returnValueForMissingStub: null);
  @override
  _i9.Future<_i23.SubmitResult> submit() =>
      (super.noSuchMethod(Invocation.method(#submit, []),
              returnValue:
                  Future<_i23.SubmitResult>.value(_i23.SubmitResult.success))
          as _i9.Future<_i23.SubmitResult>);
  @override
  void reset() => super.noSuchMethod(Invocation.method(#reset, []),
      returnValueForMissingStub: null);
  @override
  bool updateShouldNotify(_i7.WordInput? old, _i7.WordInput? current) => (super
      .noSuchMethod(Invocation.method(#updateShouldNotify, [old, current]),
          returnValue: false) as bool);
  @override
  _i3.RemoveListener addListener(_i16.Listener<_i7.WordInput>? listener,
          {bool? fireImmediately = true}) =>
      (super.noSuchMethod(
          Invocation.method(
              #addListener, [listener], {#fireImmediately: fireImmediately}),
          returnValue: () {}) as _i3.RemoveListener);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
}
