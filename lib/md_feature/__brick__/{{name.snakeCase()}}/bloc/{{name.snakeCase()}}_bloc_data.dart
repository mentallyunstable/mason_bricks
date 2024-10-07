part of '{{name.snakeCase()}}_bloc.dart';

final class {{name.pascalCase()}}BlocData extends Base{{name.pascalCase()}}BlocData {
  const {{name.pascalCase()}}BlocData();

  factory {{name.pascalCase()}}BlocData.empty() => const {{name.pascalCase()}}BlocData();

  @override
  Base{{name.pascalCase()}}BlocData copyWith() {
    return const {{name.pascalCase()}}BlocData();
  }
}

abstract class Base{{name.pascalCase()}}BlocData {
  const Base{{name.pascalCase()}}BlocData();

  Base{{name.pascalCase()}}BlocData copyWith();
}