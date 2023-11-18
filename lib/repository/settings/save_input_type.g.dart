// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_input_type.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$saveInputTypeHash() => r'42fe1afb03f5ea0bd70a3917773ad1e1b3b2823e';

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

/// 入力タイプを保存します。
///
/// Copied from [saveInputType].
@ProviderFor(saveInputType)
const saveInputTypeProvider = SaveInputTypeFamily();

/// 入力タイプを保存します。
///
/// Copied from [saveInputType].
class SaveInputTypeFamily extends Family<AsyncValue<void>> {
  /// 入力タイプを保存します。
  ///
  /// Copied from [saveInputType].
  const SaveInputTypeFamily();

  /// 入力タイプを保存します。
  ///
  /// Copied from [saveInputType].
  SaveInputTypeProvider call(
    InputTypes inputType,
  ) {
    return SaveInputTypeProvider(
      inputType,
    );
  }

  @override
  SaveInputTypeProvider getProviderOverride(
    covariant SaveInputTypeProvider provider,
  ) {
    return call(
      provider.inputType,
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
  String? get name => r'saveInputTypeProvider';
}

/// 入力タイプを保存します。
///
/// Copied from [saveInputType].
class SaveInputTypeProvider extends AutoDisposeFutureProvider<void> {
  /// 入力タイプを保存します。
  ///
  /// Copied from [saveInputType].
  SaveInputTypeProvider(
    InputTypes inputType,
  ) : this._internal(
          (ref) => saveInputType(
            ref as SaveInputTypeRef,
            inputType,
          ),
          from: saveInputTypeProvider,
          name: r'saveInputTypeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveInputTypeHash,
          dependencies: SaveInputTypeFamily._dependencies,
          allTransitiveDependencies:
              SaveInputTypeFamily._allTransitiveDependencies,
          inputType: inputType,
        );

  SaveInputTypeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.inputType,
  }) : super.internal();

  final InputTypes inputType;

  @override
  Override overrideWith(
    FutureOr<void> Function(SaveInputTypeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveInputTypeProvider._internal(
        (ref) => create(ref as SaveInputTypeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        inputType: inputType,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SaveInputTypeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveInputTypeProvider && other.inputType == inputType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, inputType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SaveInputTypeRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `inputType` of this provider.
  InputTypes get inputType;
}

class _SaveInputTypeProviderElement
    extends AutoDisposeFutureProviderElement<void> with SaveInputTypeRef {
  _SaveInputTypeProviderElement(super.provider);

  @override
  InputTypes get inputType => (origin as SaveInputTypeProvider).inputType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
