import 'package:mockito/annotations.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/provider/word_input_provider.dart';

@GenerateMocks([
  QuizInfoNotifier,
  QuizPageNotifier,
  WordInputNotifier,
])
void main() {}
