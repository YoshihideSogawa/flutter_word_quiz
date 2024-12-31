import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';

part 'clear_quiz_data_repository.g.dart';

/// 問題データを削除します。
@riverpod
Future<void> clearQuizData(Ref ref, QuizTypes quizType) async {
  final box = await ref.read(hiveBoxProvider(quizType.boxName).future);
  await box.clear();
  // Hiveをリフレッシュ
  ref.invalidate(hiveBoxProvider(quizType.boxName));
}
