import 'package:dio/dio.dart';

final dio = Dio()
  ..options = BaseOptions(
    baseUrl: 'https://id.edway.org',
    contentType: 'application/json',
  );
