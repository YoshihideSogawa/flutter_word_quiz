// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_info_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$quizInfoNotifierHash() => r'807e42a1283f070a7626c092cd89763ef826a461';

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

abstract class _$QuizInfoNotifier
    extends BuildlessAutoDisposeAsyncNotifier<QuizInfo> {
  late final QuizTypes quizType;

  FutureOr<QuizInfo> build(
    QuizTypes quizType,
  );
}

/// 問題情報に関するNotifierです。
///
/// Copied from [QuizInfoNotifier].
@ProviderFor(QuizInfoNotifier)
const quizInfoNotifierProvider = QuizInfoNotifierFamily();

/// 問題情報に関するNotifierです。
///
/// Copied from [QuizInfoNotifier].
class QuizInfoNotifierFamily extends Family<AsyncValue<QuizInfo>> {
  /// 問題情報に関するNotifierです。
  ///
  /// Copied from [QuizInfoNotifier].
  const QuizInfoNotifierFamily();

  /// 問題情報に関するNotifierです。
  ///
  /// Copied from [QuizInfoNotifier].
  QuizInfoNotifierProvider call(
    QuizTypes quizType,
  ) {
    return QuizInfoNotifierProvider(
      quizType,
    );
  }

  @override
  QuizInfoNotifierProvider getProviderOverride(
    covariant QuizInfoNotifierProvider provider,
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
  String? get name => r'quizInfoNotifierProvider';
}

/// 問題情報に関するNotifierです。
///
/// Copied from [QuizInfoNotifier].
class QuizInfoNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<QuizInfoNotifier, QuizInfo> {
  /// 問題情報に関するNotifierです。
  ///
  /// Copied from [QuizInfoNotifier].
  QuizInfoNotifierProvider(
    QuizTypes quizType,
  ) : this._internal(
          () => QuizInfoNotifier()..quizType = quizType,
          from: quizInfoNotifierProvider,
          name: r'quizInfoNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$quizInfoNotifierHash,
          dependencies: QuizInfoNotifierFamily._dependencies,
          allTransitiveDependencies:
              QuizInfoNotifierFamily._allTransitiveDependencies,
          quizType: quizType,
        );

  QuizInfoNotifierProvider._internal(
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
  FutureOr<QuizInfo> runNotifierBuild(
    covariant QuizInfoNotifier notifier,
  ) {
    return notifier.build(
      quizType,
    );
  }

  @override
  Override overrideWith(QuizInfoNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: QuizInfoNotifierProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<QuizInfoNotifier, QuizInfo>
      createElement() {
    return _QuizInfoNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuizInfoNotifierProvider && other.quizType == quizType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quizType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin QuizInfoNotifierRef on AutoDisposeAsyncNotifierProviderRef<QuizInfo> {
  /// The parameter `quizType` of this provider.
  QuizTypes get quizType;
}

class _QuizInfoNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<QuizInfoNotifier, QuizInfo>
    with QuizInfoNotifierRef {
  _QuizInfoNotifierProviderElement(super.provider);

  @override
  QuizTypes get quizType => (origin as QuizInfoNotifierProvider).quizType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
