import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/constant/box_names.dart';

/// アプリプロパティのリポジトリのためのProviderです。
final appPropertyBoxProvider =
    Provider<Box<dynamic>>((ref) => Hive.box<dynamic>(appPropertyBoxName));
