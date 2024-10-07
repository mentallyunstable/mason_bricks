import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name.snakeCase()}}{{{path_to_feature}}}/{{name.snakeCase()}}/domain/interface/i_{{name.snakeCase()}}_repository.dart';

part '{{name.snakeCase()}}_bloc_data.dart';
part '{{name.snakeCase()}}_bloc_event.dart';
part '{{name.snakeCase()}}_bloc_state.dart';

final class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}BlocEvent, {{name.pascalCase()}}BlocState> {
  final I{{name.pascalCase()}}Repository _repository;

  {{name.pascalCase()}}Bloc({
    required final I{{name.pascalCase()}}Repository repository,
  }) : _repository = repository, super({{name.pascalCase()}}BlocState.empty()) {
    on<{{name.pascalCase()}}BlocEvent>((event, emit) => event.when());
  }
}
