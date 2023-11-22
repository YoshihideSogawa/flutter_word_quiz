import 'package:flutter/foundation.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/provider/statistics_provider.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';

part 'quiz_data_repository.g.dart';

/// 問題データの処理をおこないます。
@riverpod
class QuizDataRepository extends _$QuizDataRepository {
  @override
  Future<void> build(QuizTypes quizType) async {
    // do nothing
  }

  // TODO(sogawa): おそらく最終的に別々のdeleteを呼ぶことになる。
  /// [QuizTypes]にひもづく全データを削除します。
  Future<void> deleteAll() async {
    final box = await ref.read(hiveBoxProvider(quizType.boxName).future);
    await box.clear();
    ref
      ..invalidateSelf()

      // TODO(sogawa): 一時的にこの処理を行う、全移行したら不要になる
      // キャッシュされているデータを削除
      ..invalidate(quizInfoProvider(quizType))
      ..invalidate(quizPageProvider(quizType))
      ..invalidate(statisticsProvider(quizType))
      ..invalidate(wordInputNotifierProvider(quizType));
  }
}

@visibleForTesting
class MockQuizDataRepository extends _$QuizDataRepository
    with Mock
    implements QuizDataRepository {}
