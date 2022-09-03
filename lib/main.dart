// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/ui/word_quiz.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // リリースビルドはdebugPrintを無効
  if (const bool.fromEnvironment('dart.vm.product')) {
    debugPrint = (_, {wrapWidth}) {};
  }

  await Hive.initFlutter();
  await Hive.openBox<dynamic>(settingsBoxName);
  await Hive.openBox<dynamic>(dailyBoxName);
  await Hive.openBox<dynamic>(endlessBoxName);
  await Hive.openBox<dynamic>(appPropertyBoxName);

  // 縦画面固定
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    const ProviderScope(
      child: WordQuiz(),
    ),
  );
}
