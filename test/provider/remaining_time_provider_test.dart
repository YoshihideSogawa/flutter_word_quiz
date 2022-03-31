import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/provider/remaining_time_provider.dart';

void main() {
  test('remainingTimeProvider', () {
    fakeAsync((fakeClock) {
      final container = ProviderContainer();

      // autoDisposeなのでlisten
      final remainingTimerNotifier = container
          .listen(remainingTimeProvider.notifier, (previous, next) {})
          .read();
      // 2秒経過させる
      fakeClock.elapse(const Duration(seconds: 2));

      // time
      final remainingTime = container.read(remainingTimeProvider);
      expect(remainingTime.length, 8);

      // dispose
      expect(remainingTimerNotifier.dispose, returnsNormally);
    });
  });
}
