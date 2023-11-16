import 'dart:io';
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// テスト用のパス
final _dirBasePath = '${Directory.current.path}/.dart_tool/test';

/// Hiveのテスト用の初期化を行います。
void setUpHive() {
  // タイミングによって衝突が発生するのでランダムな名称のフォルダとする
  final dirForTest = Directory('$_dirBasePath/${Random().nextInt(1000000000)}');
  // ディレクトリを一度削除して作成
  if (dirForTest.existsSync()) {
    dirForTest.deleteSync(recursive: true);
  }
  dirForTest.createSync(recursive: true);

  Hive.init(dirForTest.path);
}

/// Hiveのテスト用の削除を行います。
Future<void> tearDownHive() async {
  await Hive.deleteFromDisk();
}

extension HiveTestExtension on WidgetTester {
  Future<void> setHiveMockInitialValues(
    String boxName,
    Map<String, dynamic> values,
  ) async {
    await runAsync(() async {
      final Box<dynamic> box;
      if (Hive.isBoxOpen(boxName)) {
        box = Hive.box<dynamic>(boxName);
      } else {
        box = await Hive.openBox<dynamic>(boxName);
      }

      for (final entry in values.entries) {
        await box.put(entry.key, entry.value);
      }
    });
  }
}
