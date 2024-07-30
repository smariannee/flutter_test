import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/model/project_model.dart';
import 'package:flutter_application_2/presentation/cubits/project_state.dart';
import 'package:flutter_application_2/repository/project_repository.dart';

class ProjectCubit extends Cubit<ProjectState> {
  final ProjectRepository projectRepository;
  
  ProjectCubit({required this.projectRepository}): super(ProjectInitial());

  Future<void> createProject(Project project) async {
    try {
      emit(ProjectLoading());
      await projectRepository.createProject(project);
      final projects = await projectRepository.getProjects();
      emit(ProjectSuccess(projects: projects));
    } catch (e) {
      emit(ProjectError(message: e.toString()));
    }
  }

  Future<void> getProject(String id) async {
    try {
      emit(ProjectLoading());      
      final project = await projectRepository.getProject(id);
      emit(ProjectSuccess(projects: [project]));
    } catch (e) {
      emit(ProjectError(message: e.toString()));
    }
  }

  Future<void> getProjects() async {
    try {
      emit(ProjectLoading());      
      final projects = await projectRepository.getProjects();
      emit(ProjectSuccess(projects: projects));
    } catch (e) {
      emit(ProjectError(message: e.toString()));
    }
  }
}