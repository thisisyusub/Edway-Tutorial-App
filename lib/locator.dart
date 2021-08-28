import 'package:get_it/get_it.dart';

import 'data/data_sources/auth_data_source.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<AuthDataSource>(() => AuthDataSource());
}
