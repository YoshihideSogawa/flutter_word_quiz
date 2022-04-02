import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/repository/app_property_repository.dart';

// ペアレンタルコントロールのProviderです。
final parentalControlProvider =
    Provider<ParentalControl>((ref) => ParentalControl(ref.read));

class ParentalControl {
  ParentalControl(this._reader);

  /// [Reader]
  final Reader _reader;

  /// ペアレンタルコントロールをチェックします。
  bool isParentalControl() =>
      _reader(appPropertyRepositoryProvider).parentalControl() ?? true;
}
