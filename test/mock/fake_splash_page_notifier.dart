import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/splash_page_info.dart';
import 'package:word_quiz/provider/splash_page_provider.dart';

class FakeSplashPageNotifier extends StateNotifier<AsyncValue<SplashPageInfo>>
    implements SplashPageNotifier {
  FakeSplashPageNotifier(AsyncValue<SplashPageInfo> state) : super(state);

  @override
  Future<void> init() async {}
}
