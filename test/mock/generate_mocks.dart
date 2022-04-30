import 'package:mockito/annotations.dart';
import 'package:word_quiz/provider/data_settings_provider.dart';
import 'package:word_quiz/provider/monster_picker_provider.dart';
import 'package:word_quiz/provider/parental_control_provider.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/provider/settings_input_type_provider.dart';
import 'package:word_quiz/provider/settings_quiz_range_provider.dart';
import 'package:word_quiz/provider/statistics_provider.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/repository/app_property_repository.dart';
import 'package:word_quiz/repository/monster_repository.dart';
import 'package:word_quiz/repository/quiz_repository.dart';
import 'package:word_quiz/repository/settings_repository.dart';

@GenerateMocks([
  AppPropertyRepository,
  DataSettings,
  MonsterPicker,
  MonsterRepository,
  ParentalControl,
  QuizInfoNotifier,
  QuizPageNotifier,
  QuizRepository,
  SettingsInputTypeNotifier,
  SettingsQuizRangeNotifier,
  SettingsRepository,
  StatisticsNotifier,
  WordInputNotifier,
])
void main() {}
