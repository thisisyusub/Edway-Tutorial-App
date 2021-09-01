import 'package:dio/dio.dart';

import 'jwt_interceptor.dart';

final identityDio = Dio()
  ..options = BaseOptions(
    baseUrl: 'https://id.edway.org',
    contentType: 'application/json',
  );

late final crudDio = Dio()
  ..options = BaseOptions(
    baseUrl: 'https://api.edway.org/supervisor',
    contentType: 'application/json',
  )
  ..interceptors.add(
    JwtInterceptor(),
  );
