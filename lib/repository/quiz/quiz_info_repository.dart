import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';
import 'package:word_quiz/repository/quiz/quiz_keys.dart';

part 'quiz_info_repository.g.dart';

@riverpod
class QuizInfoRepository extends _$QuizInfoRepository {
  @override
  Future<QuizInfo?> build(QuizTypes quizType) async {
    final quizBox = await ref.watch(hiveBoxProvider(quizType.boxName).future);
    final quizInfoJson = quizBox.get(quizInfoKey) as String?;
    if (quizInfoJson == null) {
      return null;
    }

    // NOTE: QuizInfoの形式が変わったらマイグレーションコードを書く
    return QuizInfo.fromJson(jsonDecode(quizInfoJson) as Map<String, dynamic>);
  }

  /// [QuizInfo]を保存します。
  Future<void> saveQuizInfo(QuizInfo? quizInfo) async {
    if (quizInfo == null) {
      return;
    }

    final quizBox = await ref.read(hiveBoxProvider(quizType.boxName).future);
    await quizBox.put(quizInfoKey, jsonEncode(quizInfo));
    ref.invalidateSelf();
  }
}

@visibleForTesting
class MockQuizInfoRepository extends _$QuizInfoRepository
    with Mock
    implements QuizInfoRepository {}
