import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/repository/app_property_repository.dart';

// ペアレンタルコントロールのProviderです。
final parentalControlProvider = Provider<ParentalControl>(ParentalControl.new);

class ParentalControl {
  ParentalControl(this._ref);

  /// [Ref]
  final Ref _ref;

  /// ペアレンタルコントロールをチェックします。
  bool isParentalControl() =>
      _ref.read(appPropertyRepositoryProvider).parentalControl() ?? true;
}
