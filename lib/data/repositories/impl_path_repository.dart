import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';

import '../contractors/i_path_repository.dart';
import '../models/responses/path.dart';
import '../../locator.dart';
import '../data_sources/path_data_source.dart';
import '../failures.dart';

class ImplPathRepository implements IPathRepository {
  final _pathDataSource = getIt.get<PathDataSource>();

  @override
  Future<Result<Failure, List<EdwayPath>>> getAllPaths() async {
    try {
      final result = await _pathDataSource.fetchAllPaths();
      return Success(result);
    } on DioError catch (_) {
      return Error(Failure());
    } catch (_) {
      return Error(Failure());
    }
  }

  @override
  Future<void> addPath(Map<String, dynamic> data) {
    // TODO: implement addPath
    throw UnimplementedError();
  }
}
