import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/provider/statistics_provider.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/repository/quiz_repository.dart';

/// データ設定のProviderです。
final dataSettingsProvider =
    Provider.family<DataSettings, QuizTypes>(DataSettings.new);

class DataSettings {
  DataSettings(this._ref, this._quizType);

  /// [Ref]
  final Ref _ref;

  /// [QuizTypes]
  final QuizTypes _quizType;

  /// [QuizTypes]にひもづく全データを削除します。
  Future<void> deleteAll() async {
    // 保存されているデータを削除
    await _ref.watch(quizRepositoryProvider(_quizType)).deleteAll();
    // キャッシュされているデータを削除
    _ref
      ..invalidate(quizInfoProvider(_quizType))
      ..invalidate(quizPageProvider(_quizType))
      ..invalidate(statisticsProvider(_quizType))
      ..invalidate(wordInputNotifierProvider(_quizType));
  }
}
