import 'package:multiple_result/multiple_result.dart';

import '../models/responses/path.dart';
import '../failures.dart';

abstract class IPathRepository {
  Future<Result<Failure, List<EdwayPath>>> getAllPaths();

  Future<void> addPath(Map<String, dynamic> data);
}
