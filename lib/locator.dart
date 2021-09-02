import 'package:get_it/get_it.dart';

import 'data/data_sources/auth_data_source.dart';
import 'data/data_sources/path_data_source.dart';
import 'data/data_sources/dio_configuration.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<AuthDataSource>(() => AuthDataSource());
  getIt.registerLazySingleton<PathDataSource>(() => PathDataSource(crudDio));
}
