import 'package:mockito/annotations.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/provider/statistics_provider.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/repository/quiz_repository.dart';

@GenerateMocks([
  QuizInfoNotifier,
  QuizPageNotifier,
  QuizRepository,
  StatisticsNotifier,
  WordInputNotifier,
])
void main() {}
