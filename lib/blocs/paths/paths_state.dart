part of 'paths_bloc.dart';

abstract class PathsState {}

class PathsInitial extends PathsState {}

class PathsInProgress extends PathsState {}

class PathsSuccess extends PathsState {
  final List<EdwayPath> paths;

  PathsSuccess(this.paths);
}

class PathsFailure extends PathsState {
  final String? message;

  PathsFailure([this.message]);
}
