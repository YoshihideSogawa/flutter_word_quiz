// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_input_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$wordInputRepositoryHash() =>
    r'f5c016b976a80f3b47007a45370fa10b96e31c76';

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

abstract class _$WordInputRepository
    extends BuildlessAutoDisposeAsyncNotifier<WordInput?> {
  late final QuizTypes quizType;

  FutureOr<WordInput?> build(
    QuizTypes quizType,
  );
}

/// 回答の入力データを扱います。
///
/// Copied from [WordInputRepository].
@ProviderFor(WordInputRepository)
const wordInputRepositoryProvider = WordInputRepositoryFamily();

/// 回答の入力データを扱います。
///
/// Copied from [WordInputRepository].
class WordInputRepositoryFamily extends Family<AsyncValue<WordInput?>> {
  /// 回答の入力データを扱います。
  ///
  /// Copied from [WordInputRepository].
  const WordInputRepositoryFamily();

  /// 回答の入力データを扱います。
  ///
  /// Copied from [WordInputRepository].
  WordInputRepositoryProvider call(
    QuizTypes quizType,
  ) {
    return WordInputRepositoryProvider(
      quizType,
    );
  }

  @override
  WordInputRepositoryProvider getProviderOverride(
    covariant WordInputRepositoryProvider provider,
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
  String? get name => r'wordInputRepositoryProvider';
}

/// 回答の入力データを扱います。
///
/// Copied from [WordInputRepository].
class WordInputRepositoryProvider extends AutoDisposeAsyncNotifierProviderImpl<
    WordInputRepository, WordInput?> {
  /// 回答の入力データを扱います。
  ///
  /// Copied from [WordInputRepository].
  WordInputRepositoryProvider(
    QuizTypes quizType,
  ) : this._internal(
          () => WordInputRepository()..quizType = quizType,
          from: wordInputRepositoryProvider,
          name: r'wordInputRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$wordInputRepositoryHash,
          dependencies: WordInputRepositoryFamily._dependencies,
          allTransitiveDependencies:
              WordInputRepositoryFamily._allTransitiveDependencies,
          quizType: quizType,
        );

  WordInputRepositoryProvider._internal(
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
  FutureOr<WordInput?> runNotifierBuild(
    covariant WordInputRepository notifier,
  ) {
    return notifier.build(
      quizType,
    );
  }

  @override
  Override overrideWith(WordInputRepository Function() create) {
    return ProviderOverride(
      origin: this,
      override: WordInputRepositoryProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<WordInputRepository, WordInput?>
      createElement() {
    return _WordInputRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WordInputRepositoryProvider && other.quizType == quizType;
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
mixin WordInputRepositoryRef
    on AutoDisposeAsyncNotifierProviderRef<WordInput?> {
  /// The parameter `quizType` of this provider.
  QuizTypes get quizType;
}

class _WordInputRepositoryProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<WordInputRepository,
        WordInput?> with WordInputRepositoryRef {
  _WordInputRepositoryProviderElement(super.provider);

  @override
  QuizTypes get quizType => (origin as WordInputRepositoryProvider).quizType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
