import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part '{{name.snakeCase()}}_remote_data_source.g.dart';

@RestApi()
abstract class {{name.pascalCase()}}RemoteDataSource {
  factory {{name.pascalCase()}}RemoteDataSource(Dio dio, {String baseUrl}) = _{{name.pascalCase()}}RemoteDataSource;
}
