import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_range.dart';
import 'package:word_quiz/model/quiz_statistics.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/repository/app_property/app_property_keys.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';
import 'package:word_quiz/repository/quiz/quiz_keys.dart';
import 'package:word_quiz/repository/settings/settings_keys.dart';

import 'mock_hive_box.dart';

Override appPropertyOverride({
  bool? parentalControl,
  bool? alreadyLaunched,
}) =>
    appPropertyOverrideAndBox(
      parentalControl: parentalControl,
      alreadyLaunched: alreadyLaunched,
    ).override;

OverrideAndBox appPropertyOverrideAndBox({
  bool? parentalControl,
  bool? alreadyLaunched,
}) {
  final box = MockHiveBox<dynamic>(
    initData: {
      if (parentalControl != null) parentalControlKey: parentalControl,
      if (alreadyLaunched != null) alreadyLaunchedKey: alreadyLaunched,
    },
  );
  final override =
      hiveBoxProvider(appPropertyBoxName).overrideWith((ref) => box);
  return (override: override, box: box);
}

Override settingsOverride({
  InputTypes? inputType,
  QuizRange? quizRange,
}) =>
    settingsOverrideAndBox(
      inputType: inputType,
      quizRange: quizRange,
    ).override;

OverrideAndBox settingsOverrideAndBox({
  InputTypes? inputType,
  QuizRange? quizRange,
}) {
  final box = MockHiveBox<dynamic>(
    initData: {
      if (inputType != null) inputTypeKey: inputType.typeId,
      if (quizRange != null) quizRangeKey: quizRange.id,
    },
  );
  final override = hiveBoxProvider(settingsBoxName).overrideWith((ref) => box);
  return (override: override, box: box);
}

Override quizOverride({
  required QuizTypes quizType,
  QuizStatistics? statistics,
  QuizInfo? quizInfo,
  WordInput? wordInput,
}) =>
    quizOverrideAndBox(
      quizType: quizType,
      statistics: statistics,
      quizInfo: quizInfo,
      wordInput: wordInput,
    ).override;

OverrideAndBox quizOverrideAndBox({
  required QuizTypes quizType,
  QuizStatistics? statistics,
  QuizInfo? quizInfo,
  WordInput? wordInput,
}) {
  final box = MockHiveBox<dynamic>(
    initData: {
      if (statistics != null) statisticsKey: jsonEncode(statistics),
      if (quizInfo != null) quizInfoKey: jsonEncode(quizInfo),
      if (wordInput != null) wordInputKey: jsonEncode(wordInput),
    },
  );
  final override = hiveBoxProvider(quizType.boxName).overrideWith((ref) => box);
  return (override: override, box: box);
}

QuizStatistics? parseQuizStatistics(MockHiveBox<dynamic> box) {
  if (!box.data.containsKey(statisticsKey)) {
    return null;
  }

  return QuizStatistics.fromJson(
    jsonDecode(box.data[statisticsKey] as String) as Map<String, dynamic>,
  );
}

QuizInfo? parseQuizInfo(MockHiveBox<dynamic> box) {
  if (!box.data.containsKey(quizInfoKey)) {
    return null;
  }

  return QuizInfo.fromJson(
    jsonDecode(box.data[quizInfoKey] as String) as Map<String, dynamic>,
  );
}

WordInput? parseWordInput(MockHiveBox<dynamic> box) {
  if (!box.data.containsKey(wordInputKey)) {
    return null;
  }

  return WordInput.fromJson(
    jsonDecode(box.data[wordInputKey] as String) as Map<String, dynamic>,
  );
}

typedef OverrideAndBox = ({Override override, MockHiveBox<dynamic> box});
