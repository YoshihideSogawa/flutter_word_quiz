import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/repository/app_property/app_property_box.dart';
import 'package:word_quiz/repository/app_property/app_property_keys.dart';

part 'already_launched.g.dart';

/// すでに起動済みか取得します。
@riverpod
Future<bool?> alreadyLaunched(AlreadyLaunchedRef ref) async {
  final appPropertyBox = ref.read(appPropertyBoxProvider);
  return appPropertyBox.get(alreadyLaunchedKey) as bool?;
}
