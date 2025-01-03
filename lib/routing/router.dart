import 'package:go_router/go_router.dart';
import 'package:word_quiz/routing/routes.dart';
import 'package:word_quiz/ui/how_to_play/how_to_play_page.dart';
import 'package:word_quiz/ui/parental_gate/parental_gate_page.dart';
import 'package:word_quiz/ui/quiz/quiz_page.dart';
import 'package:word_quiz/ui/settings/settings_page.dart';
import 'package:word_quiz/ui/splash/splash_page.dart';

/// [GoRouter]を取得します。
final router = GoRouter(
      initialLocation: Routes.root,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: Routes.root,
          builder: (_, __) => const SplashPage(),
        ),
        GoRoute(
          path: Routes.quiz,
          builder: (_, __) => const QuizPage(),
        ),
        GoRoute(
          path: Routes.parentalGate,
          builder: (_, __) => const ParentalGatePage(),
        ),
        GoRoute(
          path: Routes.settings,
          builder: (_, __) => const SettingsPage(),
        ),
        GoRoute(
          path: Routes.howToPlay,
          builder: (_, __) => const HowToPlayPage(),
        ),
      ],
    );
