import 'package:{{project_name.snakeCase()}}{{{path_to_feature}}}/{{name.snakeCase()}}/domain/interface/i_{{name.snakeCase()}}_repository.dart';
import 'package:{{project_name.snakeCase()}}{{{path_to_feature}}}/{{name.snakeCase()}}/data/data_source/{{name.snakeCase()}}_remote_data_source.dart';

final class {{name.pascalCase()}}RepositoryImpl extends I{{name.pascalCase()}}Repository {
  final {{name.pascalCase()}}RemoteDataSource _remoteDataSource;

  const {{name.pascalCase()}}RepositoryImpl({required {{name.pascalCase()}}RemoteDataSource remoteDataSource}) : _remoteDataSource = remoteDataSource;
}