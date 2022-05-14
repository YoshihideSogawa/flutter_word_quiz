import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/provider/word_input_provider.dart';

class FakeWordInputNotifier extends StateNotifier<WordInput>
    implements WordInputNotifier {
  FakeWordInputNotifier(super.state);

  @override
  void deleteWord() {}

  @override
  void inputWord(String text) {}

  @override
  void reset() {}

  @override
  Future<SubmitResult> submit() async {
    return SubmitResult.success;
  }
}
