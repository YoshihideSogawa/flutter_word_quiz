import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/repository/app_property/app_property_keys.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';

part 'already_launched.g.dart';

/// すでに起動済みか取得します。
@riverpod
Future<bool?> alreadyLaunched(AlreadyLaunchedRef ref) async {
  final appPropertyBox =
      await ref.read(hiveBoxProvider(appPropertyBoxName).future);
  return appPropertyBox.get(alreadyLaunchedKey) as bool?;
}
