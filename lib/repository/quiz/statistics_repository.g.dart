// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$statisticsRepositoryHash() =>
    r'1658f11d22bf5ffbcad45808b3e4a6ee08d921e6';

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

abstract class _$StatisticsRepository
    extends BuildlessAutoDisposeAsyncNotifier<QuizStatistics?> {
  late final QuizTypes quizType;

  FutureOr<QuizStatistics?> build(
    QuizTypes quizType,
  );
}

/// 問題の成績などを扱います。
///
/// Copied from [StatisticsRepository].
@ProviderFor(StatisticsRepository)
const statisticsRepositoryProvider = StatisticsRepositoryFamily();

/// 問題の成績などを扱います。
///
/// Copied from [StatisticsRepository].
class StatisticsRepositoryFamily extends Family<AsyncValue<QuizStatistics?>> {
  /// 問題の成績などを扱います。
  ///
  /// Copied from [StatisticsRepository].
  const StatisticsRepositoryFamily();

  /// 問題の成績などを扱います。
  ///
  /// Copied from [StatisticsRepository].
  StatisticsRepositoryProvider call(
    QuizTypes quizType,
  ) {
    return StatisticsRepositoryProvider(
      quizType,
    );
  }

  @override
  StatisticsRepositoryProvider getProviderOverride(
    covariant StatisticsRepositoryProvider provider,
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
  String? get name => r'statisticsRepositoryProvider';
}

/// 問題の成績などを扱います。
///
/// Copied from [StatisticsRepository].
class StatisticsRepositoryProvider extends AutoDisposeAsyncNotifierProviderImpl<
    StatisticsRepository, QuizStatistics?> {
  /// 問題の成績などを扱います。
  ///
  /// Copied from [StatisticsRepository].
  StatisticsRepositoryProvider(
    QuizTypes quizType,
  ) : this._internal(
          () => StatisticsRepository()..quizType = quizType,
          from: statisticsRepositoryProvider,
          name: r'statisticsRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$statisticsRepositoryHash,
          dependencies: StatisticsRepositoryFamily._dependencies,
          allTransitiveDependencies:
              StatisticsRepositoryFamily._allTransitiveDependencies,
          quizType: quizType,
        );

  StatisticsRepositoryProvider._internal(
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
  FutureOr<QuizStatistics?> runNotifierBuild(
    covariant StatisticsRepository notifier,
  ) {
    return notifier.build(
      quizType,
    );
  }

  @override
  Override overrideWith(StatisticsRepository Function() create) {
    return ProviderOverride(
      origin: this,
      override: StatisticsRepositoryProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<StatisticsRepository, QuizStatistics?>
      createElement() {
    return _StatisticsRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StatisticsRepositoryProvider && other.quizType == quizType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quizType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StatisticsRepositoryRef
    on AutoDisposeAsyncNotifierProviderRef<QuizStatistics?> {
  /// The parameter `quizType` of this provider.
  QuizTypes get quizType;
}

class _StatisticsRepositoryProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<StatisticsRepository,
        QuizStatistics?> with StatisticsRepositoryRef {
  _StatisticsRepositoryProviderElement(super.provider);

  @override
  QuizTypes get quizType => (origin as StatisticsRepositoryProvider).quizType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
