import '../../data/models/responses/path.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/contractors/i_path_repository.dart';

part 'paths_state.dart';

class PathsCubit extends Cubit<PathsState> {
  PathsCubit(this.pathRepository) : super(PathsInitial());

  final IPathRepository pathRepository;

  void getPaths() async {
    emit(PathsInProgress());

    final result = await pathRepository.getAllPaths();

    if (result.isSuccess()) {
      emit(PathsSuccess(result.getSuccess()!));
    } else if (result.isError()) {
      emit(PathsFailure());
    }
  }
}
