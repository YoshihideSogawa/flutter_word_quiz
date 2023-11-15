// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_parental_control.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$saveParentalControlHash() =>
    r'0591814129532a9719cdf2c7d2da30d62bd56439';

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

/// ペアレンタルコントロールを保存します。
///
/// Copied from [saveParentalControl].
@ProviderFor(saveParentalControl)
const saveParentalControlProvider = SaveParentalControlFamily();

/// ペアレンタルコントロールを保存します。
///
/// Copied from [saveParentalControl].
class SaveParentalControlFamily extends Family<AsyncValue<void>> {
  /// ペアレンタルコントロールを保存します。
  ///
  /// Copied from [saveParentalControl].
  const SaveParentalControlFamily();

  /// ペアレンタルコントロールを保存します。
  ///
  /// Copied from [saveParentalControl].
  SaveParentalControlProvider call({
    required bool parentalControl,
  }) {
    return SaveParentalControlProvider(
      parentalControl: parentalControl,
    );
  }

  @override
  SaveParentalControlProvider getProviderOverride(
    covariant SaveParentalControlProvider provider,
  ) {
    return call(
      parentalControl: provider.parentalControl,
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
  String? get name => r'saveParentalControlProvider';
}

/// ペアレンタルコントロールを保存します。
///
/// Copied from [saveParentalControl].
class SaveParentalControlProvider extends AutoDisposeFutureProvider<void> {
  /// ペアレンタルコントロールを保存します。
  ///
  /// Copied from [saveParentalControl].
  SaveParentalControlProvider({
    required bool parentalControl,
  }) : this._internal(
          (ref) => saveParentalControl(
            ref as SaveParentalControlRef,
            parentalControl: parentalControl,
          ),
          from: saveParentalControlProvider,
          name: r'saveParentalControlProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveParentalControlHash,
          dependencies: SaveParentalControlFamily._dependencies,
          allTransitiveDependencies:
              SaveParentalControlFamily._allTransitiveDependencies,
          parentalControl: parentalControl,
        );

  SaveParentalControlProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parentalControl,
  }) : super.internal();

  final bool parentalControl;

  @override
  Override overrideWith(
    FutureOr<void> Function(SaveParentalControlRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveParentalControlProvider._internal(
        (ref) => create(ref as SaveParentalControlRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        parentalControl: parentalControl,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SaveParentalControlProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveParentalControlProvider &&
        other.parentalControl == parentalControl;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, parentalControl.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SaveParentalControlRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `parentalControl` of this provider.
  bool get parentalControl;
}

class _SaveParentalControlProviderElement
    extends AutoDisposeFutureProviderElement<void> with SaveParentalControlRef {
  _SaveParentalControlProviderElement(super.provider);

  @override
  bool get parentalControl =>
      (origin as SaveParentalControlProvider).parentalControl;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
