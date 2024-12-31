// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_info_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$quizInfoRepositoryHash() =>
    r'e1cf345cf378fc7cb4f2eaa079786ddaf5529baa';

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

abstract class _$QuizInfoRepository
    extends BuildlessAutoDisposeAsyncNotifier<QuizInfo?> {
  late final QuizTypes quizType;

  FutureOr<QuizInfo?> build(
    QuizTypes quizType,
  );
}

/// See also [QuizInfoRepository].
@ProviderFor(QuizInfoRepository)
const quizInfoRepositoryProvider = QuizInfoRepositoryFamily();

/// See also [QuizInfoRepository].
class QuizInfoRepositoryFamily extends Family<AsyncValue<QuizInfo?>> {
  /// See also [QuizInfoRepository].
  const QuizInfoRepositoryFamily();

  /// See also [QuizInfoRepository].
  QuizInfoRepositoryProvider call(
    QuizTypes quizType,
  ) {
    return QuizInfoRepositoryProvider(
      quizType,
    );
  }

  @override
  QuizInfoRepositoryProvider getProviderOverride(
    covariant QuizInfoRepositoryProvider provider,
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
  String? get name => r'quizInfoRepositoryProvider';
}

/// See also [QuizInfoRepository].
class QuizInfoRepositoryProvider extends AutoDisposeAsyncNotifierProviderImpl<
    QuizInfoRepository, QuizInfo?> {
  /// See also [QuizInfoRepository].
  QuizInfoRepositoryProvider(
    QuizTypes quizType,
  ) : this._internal(
          () => QuizInfoRepository()..quizType = quizType,
          from: quizInfoRepositoryProvider,
          name: r'quizInfoRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$quizInfoRepositoryHash,
          dependencies: QuizInfoRepositoryFamily._dependencies,
          allTransitiveDependencies:
              QuizInfoRepositoryFamily._allTransitiveDependencies,
          quizType: quizType,
        );

  QuizInfoRepositoryProvider._internal(
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
  FutureOr<QuizInfo?> runNotifierBuild(
    covariant QuizInfoRepository notifier,
  ) {
    return notifier.build(
      quizType,
    );
  }

  @override
  Override overrideWith(QuizInfoRepository Function() create) {
    return ProviderOverride(
      origin: this,
      override: QuizInfoRepositoryProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<QuizInfoRepository, QuizInfo?>
      createElement() {
    return _QuizInfoRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuizInfoRepositoryProvider && other.quizType == quizType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quizType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin QuizInfoRepositoryRef on AutoDisposeAsyncNotifierProviderRef<QuizInfo?> {
  /// The parameter `quizType` of this provider.
  QuizTypes get quizType;
}

class _QuizInfoRepositoryProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<QuizInfoRepository,
        QuizInfo?> with QuizInfoRepositoryRef {
  _QuizInfoRepositoryProviderElement(super.provider);

  @override
  QuizTypes get quizType => (origin as QuizInfoRepositoryProvider).quizType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
