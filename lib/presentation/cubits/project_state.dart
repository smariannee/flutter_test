import '../../model/project_model.dart';
import 'package:equatable/equatable.dart';

abstract class ProjectState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProjectInitial extends ProjectState {}

class ProjectLoading extends ProjectState {}

class ProjectSuccess extends ProjectState {
  final List<Project> projects;

  ProjectSuccess({required this.projects});

  @override
  List<Object?> get props => [projects];
}

class ProjectError extends ProjectState {
  final String message;

  ProjectError({required this.message});

  @override
  List<Object?> get props => [message];
}
