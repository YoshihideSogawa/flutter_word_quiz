import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:word_quiz/routing/router.dart';

/// WordQuizアプリです。
class WordQuiz extends StatelessWidget {
  const WordQuiz({
    super.key,
  }); // coverage:ignore-line

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ワードクイズ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
        useMaterial3: false,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: false,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja', 'JP'),
      ],
      routerConfig: router,
    );
  }
}
