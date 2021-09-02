import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../models/responses/path.dart';

part 'path_data_source.g.dart';

@RestApi(baseUrl: "https://api.edway.org/supervisor")
abstract class PathDataSource {
  factory PathDataSource(Dio dio, {String baseUrl}) = _PathDataSource;

  @GET('/api/paths')
  Future<List<EdwayPath>> fetchAllPaths([
    @Query('offset') int offset = 0,
    @Query('limit') int limit = 50,
  ]);

  @POST('/api/paths/add')
  Future<void> addPath(@Body() Map<String, dynamic> body);
}
