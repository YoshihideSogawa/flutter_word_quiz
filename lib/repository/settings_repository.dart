import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/constant/box_names.dart';

/// 設定リポジトリのためのProviderです。
final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return _LocalSettingsRepository();
});

/// 設定のリポジトリです。
abstract class SettingsRepository {
  /// 問題の出題範囲を取得します。
  int? quizRangeId();

  /// 問題の出題範囲を保存します。
  Future<void> saveQuizRangeId(int quizRangeId);
}

/// 設定のリポジトリ(ローカル保存)です。
class _LocalSettingsRepository extends SettingsRepository {
  _LocalSettingsRepository() {
    _settingBox = Hive.box<dynamic>(settingsBoxName);
  }

  /// [Box]
  late final Box<dynamic> _settingBox;

  @override
  int? quizRangeId() => _settingBox.get(_quizRangeKey) as int?;

  @override
  Future<void> saveQuizRangeId(int quizRangeId) async {
    await _settingBox.put(_quizRangeKey, quizRangeId);
  }
}

/// キーボードレイアウトの保存キー
const _quizRangeKey = 'quiz_range';
