// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clear_quiz_data_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clearQuizDataHash() => r'bb873a89cfc3d77af6a0d69ce572504e2a3a71d7';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// 問題データを削除します。
///
/// Copied from [clearQuizData].
@ProviderFor(clearQuizData)
const clearQuizDataProvider = ClearQuizDataFamily();

/// 問題データを削除します。
///
/// Copied from [clearQuizData].
class ClearQuizDataFamily extends Family<AsyncValue<void>> {
  /// 問題データを削除します。
  ///
  /// Copied from [clearQuizData].
  const ClearQuizDataFamily();

  /// 問題データを削除します。
  ///
  /// Copied from [clearQuizData].
  ClearQuizDataProvider call(
    QuizTypes quizType,
  ) {
    return ClearQuizDataProvider(
      quizType,
    );
  }

  @override
  ClearQuizDataProvider getProviderOverride(
    covariant ClearQuizDataProvider provider,
  ) {
    return call(
      provider.quizType,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'clearQuizDataProvider';
}

/// 問題データを削除します。
///
/// Copied from [clearQuizData].
class ClearQuizDataProvider extends AutoDisposeFutureProvider<void> {
  /// 問題データを削除します。
  ///
  /// Copied from [clearQuizData].
  ClearQuizDataProvider(
    QuizTypes quizType,
  ) : this._internal(
          (ref) => clearQuizData(
            ref as ClearQuizDataRef,
            quizType,
          ),
          from: clearQuizDataProvider,
          name: r'clearQuizDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$clearQuizDataHash,
          dependencies: ClearQuizDataFamily._dependencies,
          allTransitiveDependencies:
              ClearQuizDataFamily._allTransitiveDependencies,
          quizType: quizType,
        );

  ClearQuizDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.quizType,
  }) : super.internal();

  final QuizTypes quizType;

  @override
  Override overrideWith(
    FutureOr<void> Function(ClearQuizDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ClearQuizDataProvider._internal(
        (ref) => create(ref as ClearQuizDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        quizType: quizType,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ClearQuizDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ClearQuizDataProvider && other.quizType == quizType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quizType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ClearQuizDataRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `quizType` of this provider.
  QuizTypes get quizType;
}

class _ClearQuizDataProviderElement
    extends AutoDisposeFutureProviderElement<void> with ClearQuizDataRef {
  _ClearQuizDataProviderElement(super.provider);

  @override
  QuizTypes get quizType => (origin as ClearQuizDataProvider).quizType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
