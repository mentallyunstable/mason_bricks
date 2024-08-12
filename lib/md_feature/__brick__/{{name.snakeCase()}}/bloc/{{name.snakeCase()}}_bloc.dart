import 'package:flutter_bloc/flutter_bloc.dart';

part '{{name.snakeCase()}}_bloc_data.dart';
part '{{name.snakeCase()}}_bloc_event.dart';
part '{{name.snakeCase()}}_bloc_state.dart';

final class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}BlocEvent, {{name.pascalCase()}}BlocState> {
  {{name.pascalCase()}}Bloc() : super({{name.pascalCase()}}BlocState.empty()) {
    on<{{name.pascalCase()}}BlocEvent>((event, emit) => event.map());
  }
}
