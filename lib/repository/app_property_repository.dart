import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/constant/box_names.dart';

/// アプリプロパティのリポジトリのためのProviderです。
final appPropertyRepositoryProvider = Provider<AppPropertyRepository>((ref) {
  return _LocalAppPropertyRepository();
});

/// アプリプロパティのリポジトリです。
abstract class AppPropertyRepository {
  /// すでに起動済みか取得します。
  bool alreadyLaunched();

  /// 起動済みであることを保存します。
  Future<void> saveLaunched();
}

/// アプリプロパティ（ローカル保存）です。
class _LocalAppPropertyRepository implements AppPropertyRepository {
  _LocalAppPropertyRepository() {
    _appPropertyBox = Hive.box<dynamic>(appPropertyBoxName);
  }

  /// [Box]
  late final Box<dynamic> _appPropertyBox;

  @override
  bool alreadyLaunched() {
    return _appPropertyBox.get(_launchFirstTimeKey, defaultValue: false)
        as bool;
  }

  @override
  Future<void> saveLaunched() async {
    await _appPropertyBox.put(_launchFirstTimeKey, true);
  }
}

/// 初回起動の保存キー
const _launchFirstTimeKey = 'launch_first_time';
