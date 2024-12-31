import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/model/monster_series.dart';
import 'package:word_quiz/model/quiz_range.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';
import 'package:word_quiz/repository/settings/settings_keys.dart';

part 'quiz_range_repository.g.dart';

/// クイズの出題範囲の処理を行います。
@riverpod
class QuizRangeRepository extends _$QuizRangeRepository {
  @override
  Future<QuizRange> build() async {
    final settingsBox =
        await ref.watch(hiveBoxProvider(settingsBoxName).future);
    final quizRangeId = settingsBox.get(quizRangeKey) as int?;
    final quizRange =
        quizRangeList.firstWhereOrNull((element) => element.id == quizRangeId);
    return quizRange ?? diamondPearl;
  }

  /// 出題範囲を更新します。
  Future<void> updateQuizRange(QuizRange quizRange) async {
    final settingsBox = await ref.read(hiveBoxProvider(settingsBoxName).future);
    await settingsBox.put(quizRangeKey, quizRange.id);
    ref.invalidateSelf();
  }
}
