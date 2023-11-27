import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/repository/quiz/quiz_keys.dart';

/// 問題データ全体に関するProviderです。
final quizRepositoryProvider = Provider.family<QuizRepository, QuizTypes>(
  (ref, quizType) => _LocalQuizRepository(quizType),
);

/// 問題データのリポジトリです。
abstract class QuizRepository {
  /// [WordInput]を読み込みます。
  WordInput? loadWordInput();

  /// [WordInput]を保存します。
  Future<void> saveWordInput(WordInput? wordInput);
}

/// 問題データのリポジトリ(ローカル)です。
class _LocalQuizRepository extends QuizRepository {
  _LocalQuizRepository(QuizTypes quizType) {
    switch (quizType) {
      case QuizTypes.daily:
        _settingBox = Hive.box<dynamic>(dailyBoxName);
      case QuizTypes.endless:
        _settingBox = Hive.box<dynamic>(endlessBoxName);
    }
  }

  /// [Box]
  late final Box<dynamic> _settingBox;

  @override
  WordInput? loadWordInput() {
    final wordInputJson = _settingBox.get(wordInputKey) as String?;
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

    await _settingBox.put(wordInputKey, jsonEncode(wordInput));
  }
}
