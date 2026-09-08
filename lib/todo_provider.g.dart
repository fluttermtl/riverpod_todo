// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Todos)
final todosProvider = TodosProvider._();

final class TodosProvider extends $NotifierProvider<Todos, List<Todo>> {
  TodosProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todosProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todosHash();

  @$internal
  @override
  Todos create() => Todos();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Todo> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Todo>>(value),
    );
  }
}

String _$todosHash() => r'8ce6104d92023c5f7e21d4166af4b7dcf2c75de7';

abstract class _$Todos extends $Notifier<List<Todo>> {
  List<Todo> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<Todo>, List<Todo>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Todo>, List<Todo>>,
              List<Todo>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(filteredTodos)
final filteredTodosProvider = FilteredTodosFamily._();

final class FilteredTodosProvider
    extends $FunctionalProvider<List<Todo>, List<Todo>, List<Todo>>
    with $Provider<List<Todo>> {
  FilteredTodosProvider._({
    required FilteredTodosFamily super.from,
    required TodoFilter super.argument,
  }) : super(
         retry: null,
         name: r'filteredTodosProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$filteredTodosHash();

  @override
  String toString() {
    return r'filteredTodosProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<Todo>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Todo> create(Ref ref) {
    final argument = this.argument as TodoFilter;
    return filteredTodos(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Todo> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Todo>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredTodosProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$filteredTodosHash() => r'be67f10ea42de9055cda967617f9148d467eefd1';

final class FilteredTodosFamily extends $Family
    with $FunctionalFamilyOverride<List<Todo>, TodoFilter> {
  FilteredTodosFamily._()
    : super(
        retry: null,
        name: r'filteredTodosProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FilteredTodosProvider call(TodoFilter filter) =>
      FilteredTodosProvider._(argument: filter, from: this);

  @override
  String toString() => r'filteredTodosProvider';
}
