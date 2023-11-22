import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_range.dart';
import 'package:word_quiz/model/quiz_statistics.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/settings_input_type.dart';
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
}) =>
    quizOverrideAndBox(
      quizType: quizType,
      statistics: statistics,
      quizInfo: quizInfo,
    ).override;

OverrideAndBox quizOverrideAndBox({
  required QuizTypes quizType,
  QuizStatistics? statistics,
  QuizInfo? quizInfo,
}) {
  final box = MockHiveBox<dynamic>(
    initData: {
      if (statistics != null) statisticsKey: jsonEncode(statistics),
      if (quizInfo != null) quizInfoKey: jsonEncode(quizInfo),
    },
  );
  final override = hiveBoxProvider(quizType.boxName).overrideWith((ref) => box);
  return (override: override, box: box);
}

typedef OverrideAndBox = ({Override override, MockHiveBox<dynamic> box});
