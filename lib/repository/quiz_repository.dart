import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_statistics.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/word_input.dart';

/// 問題データ全体に関するProviderです。
final quizRepositoryProvider = Provider.family<QuizRepository, QuizTypes>(
  (ref, quizType) => _LocalQuizRepository(quizType),
);

/// 問題データのリポジトリです。
abstract class QuizRepository {
  /// [QuizInfo]を読み込みます。
  QuizInfo? loadQuizInfo();

  /// [QuizInfo]を保存します。
  Future<void> saveQuizInfo(QuizInfo? quizInfo);

  /// [WordInput]を読み込みます。
  WordInput? loadWordInput();

  /// [WordInput]を保存します。
  Future<void> saveWordInput(WordInput? wordInput);

  /// [QuizStatistics]を読み込みます。
  QuizStatistics? loadStatistics();

  /// [QuizStatistics]を保存します。
  Future<void> saveStatistics(QuizStatistics? statistics);

  // 全データを削除します。
  Future<int> deleteAll();
}

/// 問題データのリポジトリ(ローカル)です。
class _LocalQuizRepository extends QuizRepository {
  _LocalQuizRepository(QuizTypes quizType) {
    switch (quizType) {
      case QuizTypes.daily:
        _settingBox = Hive.box<dynamic>(dailyBoxName);
        break;
      case QuizTypes.endless:
        _settingBox = Hive.box<dynamic>(endlessBoxName);
        break;
    }
  }

  /// [Box]
  late final Box<dynamic> _settingBox;

  @override
  QuizInfo? loadQuizInfo() {
    final quizInfoJson = _settingBox.get(keyQuizInfo) as String?;
    if (quizInfoJson == null) {
      return null;
    }

    // NOTE: QuizInfoの形式が変わったらマイグレーションコードを書く
    return QuizInfo.fromJson(jsonDecode(quizInfoJson) as Map<String, dynamic>);
  }

  @override
  Future<void> saveQuizInfo(QuizInfo? quizInfo) async {
    if (quizInfo == null) {
      return;
    }

    await _settingBox.put(keyQuizInfo, jsonEncode(quizInfo));
  }

  @override
  WordInput? loadWordInput() {
    final wordInputJson = _settingBox.get(keyWordInput) as String?;
    if (wordInputJson == null) {
      return null;
    }

    return WordInput.fromJson(
      jsonDecode(wordInputJson) as Map<String, dynamic>,
    );
  }

  @override
  Future<void> saveWordInput(WordInput? wordInput) async {
    if (wordInput == null) {
      return;
    }

    await _settingBox.put(keyWordInput, jsonEncode(wordInput));
  }

  @override
  QuizStatistics? loadStatistics() {
    final statisticsJson = _settingBox.get(keyStatistics) as String?;
    if (statisticsJson == null) {
      return null;
    }

    return QuizStatistics.fromJson(
      jsonDecode(statisticsJson) as Map<String, dynamic>,
    );
  }

  @override
  Future<void> saveStatistics(QuizStatistics? statistics) async {
    if (statistics == null) {
      return;
    }

    await _settingBox.put(keyStatistics, jsonEncode(statistics));
  }

  @override
  Future<int> deleteAll() async {
    return _settingBox.clear();
  }
}

/// [QuizInfo]の保存キー
const String keyQuizInfo = 'quiz_info';

/// [WordInput]の保存キー
const String keyWordInput = 'wordInput';

/// [QuizStatistics]の保存キー
const String keyStatistics = 'statistics';
