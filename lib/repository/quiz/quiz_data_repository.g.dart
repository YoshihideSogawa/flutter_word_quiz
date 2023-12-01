// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_data_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$quizDataRepositoryHash() =>
    r'6fd33a85c98ec7c211ed29ffdc2cab153c00140e';

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

abstract class _$QuizDataRepository
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final QuizTypes quizType;

  FutureOr<void> build(
    QuizTypes quizType,
  );
}

/// 問題データの処理をおこないます。
///
/// Copied from [QuizDataRepository].
@ProviderFor(QuizDataRepository)
const quizDataRepositoryProvider = QuizDataRepositoryFamily();

/// 問題データの処理をおこないます。
///
/// Copied from [QuizDataRepository].
class QuizDataRepositoryFamily extends Family<AsyncValue<void>> {
  /// 問題データの処理をおこないます。
  ///
  /// Copied from [QuizDataRepository].
  const QuizDataRepositoryFamily();

  /// 問題データの処理をおこないます。
  ///
  /// Copied from [QuizDataRepository].
  QuizDataRepositoryProvider call(
    QuizTypes quizType,
  ) {
    return QuizDataRepositoryProvider(
      quizType,
    );
  }

  @override
  QuizDataRepositoryProvider getProviderOverride(
    covariant QuizDataRepositoryProvider provider,
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
  String? get name => r'quizDataRepositoryProvider';
}

/// 問題データの処理をおこないます。
///
/// Copied from [QuizDataRepository].
class QuizDataRepositoryProvider
    extends AutoDisposeAsyncNotifierProviderImpl<QuizDataRepository, void> {
  /// 問題データの処理をおこないます。
  ///
  /// Copied from [QuizDataRepository].
  QuizDataRepositoryProvider(
    QuizTypes quizType,
  ) : this._internal(
          () => QuizDataRepository()..quizType = quizType,
          from: quizDataRepositoryProvider,
          name: r'quizDataRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$quizDataRepositoryHash,
          dependencies: QuizDataRepositoryFamily._dependencies,
          allTransitiveDependencies:
              QuizDataRepositoryFamily._allTransitiveDependencies,
          quizType: quizType,
        );

  QuizDataRepositoryProvider._internal(
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
  FutureOr<void> runNotifierBuild(
    covariant QuizDataRepository notifier,
  ) {
    return notifier.build(
      quizType,
    );
  }

  @override
  Override overrideWith(QuizDataRepository Function() create) {
    return ProviderOverride(
      origin: this,
      override: QuizDataRepositoryProvider._internal(
        () => create()..quizType = quizType,
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
  AutoDisposeAsyncNotifierProviderElement<QuizDataRepository, void>
      createElement() {
    return _QuizDataRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuizDataRepositoryProvider && other.quizType == quizType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quizType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin QuizDataRepositoryRef on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `quizType` of this provider.
  QuizTypes get quizType;
}

class _QuizDataRepositoryProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<QuizDataRepository, void>
    with QuizDataRepositoryRef {
  _QuizDataRepositoryProviderElement(super.provider);

  @override
  QuizTypes get quizType => (origin as QuizDataRepositoryProvider).quizType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
