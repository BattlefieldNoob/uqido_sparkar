// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'effect_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getEffectByIdHash() => r'ac699e83ada105f126275523a629d6de6ce1c42f';

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

typedef GetEffectByIdRef = AutoDisposeProviderRef<Effect?>;

/// See also [getEffectById].
@ProviderFor(getEffectById)
const getEffectByIdProvider = GetEffectByIdFamily();

/// See also [getEffectById].
class GetEffectByIdFamily extends Family<Effect?> {
  /// See also [getEffectById].
  const GetEffectByIdFamily();

  /// See also [getEffectById].
  GetEffectByIdProvider call(
    String id,
  ) {
    return GetEffectByIdProvider(
      id,
    );
  }

  @override
  GetEffectByIdProvider getProviderOverride(
    covariant GetEffectByIdProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'getEffectByIdProvider';
}

/// See also [getEffectById].
class GetEffectByIdProvider extends AutoDisposeProvider<Effect?> {
  /// See also [getEffectById].
  GetEffectByIdProvider(
    this.id,
  ) : super.internal(
          (ref) => getEffectById(
            ref,
            id,
          ),
          from: getEffectByIdProvider,
          name: r'getEffectByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getEffectByIdHash,
          dependencies: GetEffectByIdFamily._dependencies,
          allTransitiveDependencies:
              GetEffectByIdFamily._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is GetEffectByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
