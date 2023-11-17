import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hive_box_provider.g.dart';

/// [Box]を取得します。
@riverpod
Future<Box<dynamic>> hiveBox(HiveBoxRef ref, String boxName) async {
  if (!Hive.isBoxOpen(boxName)) {
    await Hive.openBox<dynamic>(boxName);
  }

  return Hive.box(boxName);
}
