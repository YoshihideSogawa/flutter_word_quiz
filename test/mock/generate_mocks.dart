import 'package:mockito/annotations.dart';
import 'package:word_quiz/provider/data_settings_provider.dart';
import 'package:word_quiz/provider/monster_picker_provider.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/provider/settings_quiz_range_provider.dart';
import 'package:word_quiz/provider/statistics_provider.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/repository/monster_repository.dart';
import 'package:word_quiz/repository/quiz_repository.dart';
import 'package:word_quiz/repository/settings_repository.dart';

@GenerateMocks([
  DataSettings,
  MonsterPicker,
  MonsterRepository,
  QuizInfoNotifier,
  QuizPageNotifier,
  QuizRepository,
  SettingsQuizRangeNotifier,
  SettingsRepository,
  StatisticsNotifier,
  WordInputNotifier,
])
void main() {}
