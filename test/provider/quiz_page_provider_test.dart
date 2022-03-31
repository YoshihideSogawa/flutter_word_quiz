import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';

void main() {
  test('showStatistics/dismissStatistics', () {
    final container = ProviderContainer();
    final quizPageNotifier = container
        .read(quizPageProvider(QuizTypes.daily).notifier)
      ..showStatistics();

    var quizPage = container.read(quizPageProvider(QuizTypes.daily));
    expect(quizPage.showStatistics, isTrue);

    quizPageNotifier.dismissStatistics();
    quizPage = container.read(quizPageProvider(QuizTypes.daily));
    expect(quizPage.showStatistics, isFalse);
  });

  test('showAnswer/dismissAnswer', () {
    final container = ProviderContainer();
    final quizPageNotifier = container
        .read(quizPageProvider(QuizTypes.daily).notifier)
      ..showAnswer();

    var quizPage = container.read(quizPageProvider(QuizTypes.daily));
    expect(quizPage.showAnswer, isTrue);

    quizPageNotifier.dismissAnswer();
    quizPage = container.read(quizPageProvider(QuizTypes.daily));
    expect(quizPage.showAnswer, isFalse);
  });

  test('showQuizSelection/dismissQuizSelection', () {
    final container = ProviderContainer();
    final quizPageNotifier = container
        .read(quizPageProvider(QuizTypes.daily).notifier)
      ..showQuizSelection();

    var quizPage = container.read(quizPageProvider(QuizTypes.daily));
    expect(quizPage.showQuizSelection, isTrue);

    quizPageNotifier.dismissQuizSelection();
    quizPage = container.read(quizPageProvider(QuizTypes.daily));
    expect(quizPage.showQuizSelection, isFalse);
  });

  test('showResult/dismissResult', () {
    final container = ProviderContainer();
    final quizPageNotifier = container
        .read(quizPageProvider(QuizTypes.daily).notifier)
      ..showResult();

    var quizPage = container.read(quizPageProvider(QuizTypes.daily));
    expect(quizPage.showResult, isTrue);

    quizPageNotifier.dismissResult();
    quizPage = container.read(quizPageProvider(QuizTypes.daily));
    expect(quizPage.showResult, isFalse);
  });

  test('showResult/dismissResult', () {
    final container = ProviderContainer();
    final quizPageNotifier = container
        .read(quizPageProvider(QuizTypes.daily).notifier)
      ..showQuizChanged();

    var quizPage = container.read(quizPageProvider(QuizTypes.daily));
    expect(quizPage.showQuizChanged, isTrue);

    quizPageNotifier.dismissQuizChanged();
    quizPage = container.read(quizPageProvider(QuizTypes.daily));
    expect(quizPage.showQuizChanged, isFalse);
  });

  test('updateKeyboard', () {
    final container = ProviderContainer();
    final quizPageNotifier = container
        .read(quizPageProvider(QuizTypes.daily).notifier)
      ..updateKeyboard(isNormalKeyboard: true);

    var quizPage = container.read(quizPageProvider(QuizTypes.daily));
    expect(quizPage.normalKeyboard, isTrue);

    quizPageNotifier.updateKeyboard(isNormalKeyboard: false);
    quizPage = container.read(quizPageProvider(QuizTypes.daily));
    expect(quizPage.normalKeyboard, isFalse);
  });
}
