// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_box_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$hiveBoxHash() => r'ae5791ab13627cfa19fd27a31b9da519c1b22e99';

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

/// [Box]を取得します。
///
/// Copied from [hiveBox].
@ProviderFor(hiveBox)
const hiveBoxProvider = HiveBoxFamily();

/// [Box]を取得します。
///
/// Copied from [hiveBox].
class HiveBoxFamily extends Family<AsyncValue<Box<dynamic>>> {
  /// [Box]を取得します。
  ///
  /// Copied from [hiveBox].
  const HiveBoxFamily();

  /// [Box]を取得します。
  ///
  /// Copied from [hiveBox].
  HiveBoxProvider call(
    String boxName,
  ) {
    return HiveBoxProvider(
      boxName,
    );
  }

  @override
  HiveBoxProvider getProviderOverride(
    covariant HiveBoxProvider provider,
  ) {
    return call(
      provider.boxName,
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
  String? get name => r'hiveBoxProvider';
}

/// [Box]を取得します。
///
/// Copied from [hiveBox].
class HiveBoxProvider extends AutoDisposeFutureProvider<Box<dynamic>> {
  /// [Box]を取得します。
  ///
  /// Copied from [hiveBox].
  HiveBoxProvider(
    String boxName,
  ) : this._internal(
          (ref) => hiveBox(
            ref as HiveBoxRef,
            boxName,
          ),
          from: hiveBoxProvider,
          name: r'hiveBoxProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$hiveBoxHash,
          dependencies: HiveBoxFamily._dependencies,
          allTransitiveDependencies: HiveBoxFamily._allTransitiveDependencies,
          boxName: boxName,
        );

  HiveBoxProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.boxName,
  }) : super.internal();

  final String boxName;

  @override
  Override overrideWith(
    FutureOr<Box<dynamic>> Function(HiveBoxRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HiveBoxProvider._internal(
        (ref) => create(ref as HiveBoxRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        boxName: boxName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Box<dynamic>> createElement() {
    return _HiveBoxProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HiveBoxProvider && other.boxName == boxName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, boxName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin HiveBoxRef on AutoDisposeFutureProviderRef<Box<dynamic>> {
  /// The parameter `boxName` of this provider.
  String get boxName;
}

class _HiveBoxProviderElement
    extends AutoDisposeFutureProviderElement<Box<dynamic>> with HiveBoxRef {
  _HiveBoxProviderElement(super.provider);

  @override
  String get boxName => (origin as HiveBoxProvider).boxName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
