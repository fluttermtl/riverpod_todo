// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredTodosHash() => r'be67f10ea42de9055cda967617f9148d467eefd1';

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

typedef FilteredTodosRef = AutoDisposeProviderRef<List<Todo>>;

/// See also [filteredTodos].
@ProviderFor(filteredTodos)
const filteredTodosProvider = FilteredTodosFamily();

/// See also [filteredTodos].
class FilteredTodosFamily extends Family<List<Todo>> {
  /// See also [filteredTodos].
  const FilteredTodosFamily();

  /// See also [filteredTodos].
  FilteredTodosProvider call(
    TodoFilter filter,
  ) {
    return FilteredTodosProvider(
      filter,
    );
  }

  @override
  FilteredTodosProvider getProviderOverride(
    covariant FilteredTodosProvider provider,
  ) {
    return call(
      provider.filter,
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
  String? get name => r'filteredTodosProvider';
}

/// See also [filteredTodos].
class FilteredTodosProvider extends AutoDisposeProvider<List<Todo>> {
  /// See also [filteredTodos].
  FilteredTodosProvider(
    this.filter,
  ) : super.internal(
          (ref) => filteredTodos(
            ref,
            filter,
          ),
          from: filteredTodosProvider,
          name: r'filteredTodosProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filteredTodosHash,
          dependencies: FilteredTodosFamily._dependencies,
          allTransitiveDependencies:
              FilteredTodosFamily._allTransitiveDependencies,
        );

  final TodoFilter filter;

  @override
  bool operator ==(Object other) {
    return other is FilteredTodosProvider && other.filter == filter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filter.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$todosHash() => r'8ce6104d92023c5f7e21d4166af4b7dcf2c75de7';

/// See also [Todos].
@ProviderFor(Todos)
final todosProvider = AutoDisposeNotifierProvider<Todos, List<Todo>>.internal(
  Todos.new,
  name: r'todosProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Todos = AutoDisposeNotifier<List<Todo>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
