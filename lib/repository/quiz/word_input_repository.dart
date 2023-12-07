import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';
import 'package:word_quiz/repository/quiz/quiz_keys.dart';

part 'word_input_repository.g.dart';

/// 回答の入力データを扱います。
@riverpod
class WordInputRepository extends _$WordInputRepository {
  @override
  Future<WordInput?> build(QuizTypes quizType) async {
    final quizBox = await ref.watch(hiveBoxProvider(quizType.boxName).future);
    final wordInputJson = quizBox.get(wordInputKey) as String?;
    if (wordInputJson == null) {
      return null;
    }

    return WordInput.fromJson(
      jsonDecode(wordInputJson) as Map<String, dynamic>,
    );
  }

  /// [WordInput]を保存します。
  Future<void> saveWordInput(WordInput? wordInput) async {
    if (wordInput == null) {
      return;
    }

    final quizBox = await ref.watch(hiveBoxProvider(quizType.boxName).future);
    await quizBox.put(wordInputKey, jsonEncode(wordInput));

    ref.invalidateSelf();
  }

  /// [WordInput]を削除します。
  Future<void> deleteWordInput() async {
    final quizBox = await ref.watch(hiveBoxProvider(quizType.boxName).future);
    await quizBox.delete(wordInputKey);

    ref.invalidateSelf();
  }
}

@visibleForTesting
class MockWordInputRepository extends _$WordInputRepository
    with Mock
    implements WordInputRepository {}
