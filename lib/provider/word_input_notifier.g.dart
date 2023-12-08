// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_input_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$wordInputNotifierHash() => r'd69d53b849c165af50158da927500a1dd868f474';

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

abstract class _$WordInputNotifier
    extends BuildlessAutoDisposeAsyncNotifier<WordInput> {
  late final QuizTypes quizType;

  FutureOr<WordInput> build(
    QuizTypes quizType,
  );
}

/// 文字入力に関する処理を行います。
///
/// Copied from [WordInputNotifier].
@ProviderFor(WordInputNotifier)
const wordInputNotifierProvider = WordInputNotifierFamily();

/// 文字入力に関する処理を行います。
///
/// Copied from [WordInputNotifier].
class WordInputNotifierFamily extends Family<AsyncValue<WordInput>> {
  /// 文字入力に関する処理を行います。
  ///
  /// Copied from [WordInputNotifier].
  const WordInputNotifierFamily();

  /// 文字入力に関する処理を行います。
  ///
  /// Copied from [WordInputNotifier].
  WordInputNotifierProvider call(
    QuizTypes quizType,
  ) {
    return WordInputNotifierProvider(
      quizType,
    );
  }

  @override
  WordInputNotifierProvider getProviderOverride(
    covariant WordInputNotifierProvider provider,
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
  String? get name => r'wordInputNotifierProvider';
}

/// 文字入力に関する処理を行います。
///
/// Copied from [WordInputNotifier].
class WordInputNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<WordInputNotifier, WordInput> {
  /// 文字入力に関する処理を行います。
  ///
  /// Copied from [WordInputNotifier].
  WordInputNotifierProvider(
    QuizTypes quizType,
  ) : this._internal(
          () => WordInputNotifier()..quizType = quizType,
          from: wordInputNotifierProvider,
          name: r'wordInputNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$wordInputNotifierHash,
          dependencies: WordInputNotifierFamily._dependencies,
          allTransitiveDependencies:
              WordInputNotifierFamily._allTransitiveDependencies,
          quizType: quizType,
        );

  WordInputNotifierProvider._internal(
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
  FutureOr<WordInput> runNotifierBuild(
    covariant WordInputNotifier notifier,
  ) {
    return notifier.build(
      quizType,
    );
  }

  @override
  Override overrideWith(WordInputNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: WordInputNotifierProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<WordInputNotifier, WordInput>
      createElement() {
    return _WordInputNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WordInputNotifierProvider && other.quizType == quizType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quizType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WordInputNotifierRef on AutoDisposeAsyncNotifierProviderRef<WordInput> {
  /// The parameter `quizType` of this provider.
  QuizTypes get quizType;
}

class _WordInputNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<WordInputNotifier,
        WordInput> with WordInputNotifierRef {
  _WordInputNotifierProviderElement(super.provider);

  @override
  QuizTypes get quizType => (origin as WordInputNotifierProvider).quizType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
