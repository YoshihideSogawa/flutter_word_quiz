// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$statisticsNotifierHash() =>
    r'53f018c8a42c81a61f1a7fa03f016f0dcaa1733b';

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

abstract class _$StatisticsNotifier
    extends BuildlessAutoDisposeAsyncNotifier<QuizStatistics> {
  late final QuizTypes quizType;

  FutureOr<QuizStatistics> build(
    QuizTypes quizType,
  );
}

/// See also [StatisticsNotifier].
@ProviderFor(StatisticsNotifier)
const statisticsNotifierProvider = StatisticsNotifierFamily();

/// See also [StatisticsNotifier].
class StatisticsNotifierFamily extends Family<AsyncValue<QuizStatistics>> {
  /// See also [StatisticsNotifier].
  const StatisticsNotifierFamily();

  /// See also [StatisticsNotifier].
  StatisticsNotifierProvider call(
    QuizTypes quizType,
  ) {
    return StatisticsNotifierProvider(
      quizType,
    );
  }

  @override
  StatisticsNotifierProvider getProviderOverride(
    covariant StatisticsNotifierProvider provider,
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
  String? get name => r'statisticsNotifierProvider';
}

/// See also [StatisticsNotifier].
class StatisticsNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    StatisticsNotifier, QuizStatistics> {
  /// See also [StatisticsNotifier].
  StatisticsNotifierProvider(
    QuizTypes quizType,
  ) : this._internal(
          () => StatisticsNotifier()..quizType = quizType,
          from: statisticsNotifierProvider,
          name: r'statisticsNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$statisticsNotifierHash,
          dependencies: StatisticsNotifierFamily._dependencies,
          allTransitiveDependencies:
              StatisticsNotifierFamily._allTransitiveDependencies,
          quizType: quizType,
        );

  StatisticsNotifierProvider._internal(
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
  FutureOr<QuizStatistics> runNotifierBuild(
    covariant StatisticsNotifier notifier,
  ) {
    return notifier.build(
      quizType,
    );
  }

  @override
  Override overrideWith(StatisticsNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: StatisticsNotifierProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<StatisticsNotifier, QuizStatistics>
      createElement() {
    return _StatisticsNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StatisticsNotifierProvider && other.quizType == quizType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quizType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StatisticsNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<QuizStatistics> {
  /// The parameter `quizType` of this provider.
  QuizTypes get quizType;
}

class _StatisticsNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<StatisticsNotifier,
        QuizStatistics> with StatisticsNotifierRef {
  _StatisticsNotifierProviderElement(super.provider);

  @override
  QuizTypes get quizType => (origin as StatisticsNotifierProvider).quizType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
