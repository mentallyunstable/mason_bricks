part of '{{name.snakeCase()}}_bloc.dart';

abstract base class {{name.pascalCase()}}BlocState extends _{{name.pascalCase()}}BlocState with _${{name.pascalCase()}}BlocState {
  const {{name.pascalCase()}}BlocState({required super.data});

  factory {{name.pascalCase()}}BlocState.empty() => {{name.pascalCase()}}BlocState.initial(data: {{name.pascalCase()}}BlocData.empty());

  const factory {{name.pascalCase()}}BlocState.initial({
    required final Base{{name.pascalCase()}}BlocData data,
  }) = Initial{{name.pascalCase()}}BlocState;
}

final class Initial{{name.pascalCase()}}BlocState extends {{name.pascalCase()}}BlocState {
  const Initial{{name.pascalCase()}}BlocState({required super.data});
}

abstract class _{{name.pascalCase()}}BlocState {
  final Base{{name.pascalCase()}}BlocData data;

  const _{{name.pascalCase()}}BlocState({required this.data});
}

typedef _{{name.pascalCase()}}BlocStateMatcher<T, S extends _{{name.pascalCase()}}BlocState> = T Function(S state);

mixin _${{name.pascalCase()}}BlocState on _{{name.pascalCase()}}BlocState {
  T when<T>({
    required final _{{name.pascalCase()}}BlocStateMatcher<T, Initial{{name.pascalCase()}}BlocState> initial,
  }) {
    return switch (this) {
      final Initial{{name.pascalCase()}}BlocState s => initial(s),
      final _ => throw ArgumentError(),
    };
  }

  T maybeWhen<T>({
    required final T Function() orElse,
    final _{{name.pascalCase()}}BlocStateMatcher<T, Initial{{name.pascalCase()}}BlocState>? initial,
  }) {
    return when(
      initial: (state) => initial != null ? initial(state) : orElse(),
    );
  }
}
