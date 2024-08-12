part of '{{name.snakeCase()}}_bloc.dart';

abstract base class {{name.pascalCase()}}BlocEvent extends _{{name.pascalCase()}}BlocEvent with _${{name.pascalCase()}}BlocEvent {
  const {{name.pascalCase()}}BlocEvent();
}

abstract class _{{name.pascalCase()}}BlocEvent {
  const _{{name.pascalCase()}}BlocEvent();
}

typedef _{{name.pascalCase()}}BlocEventMatcher<T, E extends _{{name.pascalCase()}}BlocEvent> = T Function(E event);

mixin _${{name.pascalCase()}}BlocEvent on _{{name.pascalCase()}}BlocEvent {
  T map<T>() {
    return switch (this) {
      final _ => throw ArgumentError(),
    };
  }
}