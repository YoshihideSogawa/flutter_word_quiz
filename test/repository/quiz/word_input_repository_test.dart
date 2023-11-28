import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/model/word_keyboard_state.dart';
import 'package:word_quiz/model/word_name_state.dart';
import 'package:word_quiz/repository/quiz/word_input_repository.dart';

import '../../mock/mock_box_data.dart';

void main() {
  test('WordInput(save/load)', () async {
    const quizType = QuizTypes.endless;
    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType),
      ],
    );

    const wordInput = WordInput(
      wordsList: [
        ['テ', 'ス', 'ト'],
      ],
      wordsResultList: [
        [WordNameState.notMatch, WordNameState.hit, WordNameState.match],
      ],
      keyResultList: {
        'テ': WordKeyboardInfo.notMatch,
        'ス': WordKeyboardInfo.hit,
        'ト': WordKeyboardInfo.match,
      },
      inputIndex: 1,
      isWordChecking: true,
    );

    // 保存
    await container
        .read(wordInputRepositoryProvider(quizType).notifier)
        .saveWordInput(wordInput);

    // 読み込み
    final targetWordInfo =
        await container.read(wordInputRepositoryProvider(quizType).future);

    expect(targetWordInfo!.wordsList, wordInput.wordsList);
    expect(targetWordInfo.wordsResultList, wordInput.wordsResultList);
    expect(targetWordInfo.keyResultList, wordInput.keyResultList);
    expect(targetWordInfo.inputIndex, wordInput.inputIndex);
    expect(targetWordInfo.isWordChecking, wordInput.isWordChecking);
  });
}
