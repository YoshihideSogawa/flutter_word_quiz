// Mocks generated by Mockito 5.4.3 from annotations
// in word_quiz/test/mock/generate_mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:hooks_riverpod/hooks_riverpod.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:state_notifier/state_notifier.dart' as _i9;
import 'package:word_quiz/model/quiz_info.dart' as _i7;
import 'package:word_quiz/model/quiz_page_info.dart' as _i3;
import 'package:word_quiz/model/quiz_range.dart' as _i8;
import 'package:word_quiz/model/word_input.dart' as _i4;
import 'package:word_quiz/provider/quiz_info_provider.dart' as _i5;
import 'package:word_quiz/provider/quiz_page_provider.dart' as _i10;
import 'package:word_quiz/provider/word_input_provider.dart' as _i11;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAsyncValue_0<T> extends _i1.SmartFake implements _i2.AsyncValue<T> {
  _FakeAsyncValue_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeQuizPageInfo_1 extends _i1.SmartFake implements _i3.QuizPageInfo {
  _FakeQuizPageInfo_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWordInput_2 extends _i1.SmartFake implements _i4.WordInput {
  _FakeWordInput_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [QuizInfoNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockQuizInfoNotifier extends _i1.Mock implements _i5.QuizInfoNotifier {
  MockQuizInfoNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set onError(_i2.ErrorListener? _onError) => super.noSuchMethod(
        Invocation.setter(
          #onError,
          _onError,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get mounted => (super.noSuchMethod(
        Invocation.getter(#mounted),
        returnValue: false,
      ) as bool);

  @override
  _i6.Stream<_i2.AsyncValue<_i7.QuizInfo>> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i6.Stream<_i2.AsyncValue<_i7.QuizInfo>>.empty(),
      ) as _i6.Stream<_i2.AsyncValue<_i7.QuizInfo>>);

  @override
  _i2.AsyncValue<_i7.QuizInfo> get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeAsyncValue_0<_i7.QuizInfo>(
          this,
          Invocation.getter(#state),
        ),
      ) as _i2.AsyncValue<_i7.QuizInfo>);

  @override
  set state(_i2.AsyncValue<_i7.QuizInfo>? value) => super.noSuchMethod(
        Invocation.setter(
          #state,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i2.AsyncValue<_i7.QuizInfo> get debugState => (super.noSuchMethod(
        Invocation.getter(#debugState),
        returnValue: _FakeAsyncValue_0<_i7.QuizInfo>(
          this,
          Invocation.getter(#debugState),
        ),
      ) as _i2.AsyncValue<_i7.QuizInfo>);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  _i6.Future<void> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<bool> refreshDailyQuiz() => (super.noSuchMethod(
        Invocation.method(
          #refreshDailyQuiz,
          [],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);

  @override
  _i6.Future<void> startQuiz(
    String? seedText,
    _i8.QuizRange? quizRange,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #startQuiz,
          [
            seedText,
            quizRange,
          ],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> nextQuiz() => (super.noSuchMethod(
        Invocation.method(
          #nextQuiz,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> quitQuiz() => (super.noSuchMethod(
        Invocation.method(
          #quitQuiz,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> retireQuiz() => (super.noSuchMethod(
        Invocation.method(
          #retireQuiz,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> updateQuiz() => (super.noSuchMethod(
        Invocation.method(
          #updateQuiz,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  void updateQuizInfo(_i7.QuizInfo? quizInfo) => super.noSuchMethod(
        Invocation.method(
          #updateQuizInfo,
          [quizInfo],
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool updateShouldNotify(
    _i2.AsyncValue<_i7.QuizInfo>? old,
    _i2.AsyncValue<_i7.QuizInfo>? current,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateShouldNotify,
          [
            old,
            current,
          ],
        ),
        returnValue: false,
      ) as bool);

  @override
  _i2.RemoveListener addListener(
    _i9.Listener<_i2.AsyncValue<_i7.QuizInfo>>? listener, {
    bool? fireImmediately = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
          {#fireImmediately: fireImmediately},
        ),
        returnValue: () {},
      ) as _i2.RemoveListener);

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [QuizPageNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockQuizPageNotifier extends _i1.Mock implements _i10.QuizPageNotifier {
  MockQuizPageNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set onError(_i2.ErrorListener? _onError) => super.noSuchMethod(
        Invocation.setter(
          #onError,
          _onError,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get mounted => (super.noSuchMethod(
        Invocation.getter(#mounted),
        returnValue: false,
      ) as bool);

  @override
  _i6.Stream<_i3.QuizPageInfo> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i6.Stream<_i3.QuizPageInfo>.empty(),
      ) as _i6.Stream<_i3.QuizPageInfo>);

  @override
  _i3.QuizPageInfo get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeQuizPageInfo_1(
          this,
          Invocation.getter(#state),
        ),
      ) as _i3.QuizPageInfo);

  @override
  set state(_i3.QuizPageInfo? value) => super.noSuchMethod(
        Invocation.setter(
          #state,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.QuizPageInfo get debugState => (super.noSuchMethod(
        Invocation.getter(#debugState),
        returnValue: _FakeQuizPageInfo_1(
          this,
          Invocation.getter(#debugState),
        ),
      ) as _i3.QuizPageInfo);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  void showStatistics() => super.noSuchMethod(
        Invocation.method(
          #showStatistics,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dismissStatistics() => super.noSuchMethod(
        Invocation.method(
          #dismissStatistics,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void showAnswer() => super.noSuchMethod(
        Invocation.method(
          #showAnswer,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dismissAnswer() => super.noSuchMethod(
        Invocation.method(
          #dismissAnswer,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void updateKeyboard({required bool? isNormalKeyboard}) => super.noSuchMethod(
        Invocation.method(
          #updateKeyboard,
          [],
          {#isNormalKeyboard: isNormalKeyboard},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void showQuizSelection() => super.noSuchMethod(
        Invocation.method(
          #showQuizSelection,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dismissQuizSelection() => super.noSuchMethod(
        Invocation.method(
          #dismissQuizSelection,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void showResult() => super.noSuchMethod(
        Invocation.method(
          #showResult,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dismissResult() => super.noSuchMethod(
        Invocation.method(
          #dismissResult,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void showQuizChanged() => super.noSuchMethod(
        Invocation.method(
          #showQuizChanged,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dismissQuizChanged() => super.noSuchMethod(
        Invocation.method(
          #dismissQuizChanged,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool updateShouldNotify(
    _i3.QuizPageInfo? old,
    _i3.QuizPageInfo? current,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateShouldNotify,
          [
            old,
            current,
          ],
        ),
        returnValue: false,
      ) as bool);

  @override
  _i2.RemoveListener addListener(
    _i9.Listener<_i3.QuizPageInfo>? listener, {
    bool? fireImmediately = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
          {#fireImmediately: fireImmediately},
        ),
        returnValue: () {},
      ) as _i2.RemoveListener);

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [WordInputNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockWordInputNotifier extends _i1.Mock implements _i11.WordInputNotifier {
  MockWordInputNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set onError(_i2.ErrorListener? _onError) => super.noSuchMethod(
        Invocation.setter(
          #onError,
          _onError,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get mounted => (super.noSuchMethod(
        Invocation.getter(#mounted),
        returnValue: false,
      ) as bool);

  @override
  _i6.Stream<_i4.WordInput> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i6.Stream<_i4.WordInput>.empty(),
      ) as _i6.Stream<_i4.WordInput>);

  @override
  _i4.WordInput get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeWordInput_2(
          this,
          Invocation.getter(#state),
        ),
      ) as _i4.WordInput);

  @override
  set state(_i4.WordInput? value) => super.noSuchMethod(
        Invocation.setter(
          #state,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.WordInput get debugState => (super.noSuchMethod(
        Invocation.getter(#debugState),
        returnValue: _FakeWordInput_2(
          this,
          Invocation.getter(#debugState),
        ),
      ) as _i4.WordInput);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  _i6.Future<void> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> inputWord(String? text) => (super.noSuchMethod(
        Invocation.method(
          #inputWord,
          [text],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> deleteWord() => (super.noSuchMethod(
        Invocation.method(
          #deleteWord,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<_i11.SubmitResult> submit() => (super.noSuchMethod(
        Invocation.method(
          #submit,
          [],
        ),
        returnValue:
            _i6.Future<_i11.SubmitResult>.value(_i11.SubmitResult.success),
      ) as _i6.Future<_i11.SubmitResult>);

  @override
  _i6.Future<void> reset() => (super.noSuchMethod(
        Invocation.method(
          #reset,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  bool updateShouldNotify(
    _i4.WordInput? old,
    _i4.WordInput? current,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateShouldNotify,
          [
            old,
            current,
          ],
        ),
        returnValue: false,
      ) as bool);

  @override
  _i2.RemoveListener addListener(
    _i9.Listener<_i4.WordInput>? listener, {
    bool? fireImmediately = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
          {#fireImmediately: fireImmediately},
        ),
        returnValue: () {},
      ) as _i2.RemoveListener);

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
