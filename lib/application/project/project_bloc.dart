import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hello_world/application/project/project_state.dart';
import 'package:hello_world/domain/project/project.dart';
import 'package:hello_world/domain/project/project_repo.dart';

class ProjectBloc extends StateNotifier<ProjectState> {
  final ProjectsRepo projectsRepo;

  ProjectBloc(List<Project> project, this.projectsRepo)
      : super(ProjectState(project: project, newProject: ''));

  void projectContentChanged(String content) {
    state = state.copyWith(newProject: content);
  }

  void addButtonPressed() {
    projectsRepo.project(
        'Roham', 'G3UdIicOBIZX8V2iWKXS', state.newProject, DateTime.now());
  }

  void projectButtonPressed() {}
}

final projectStreamProvider = StreamProvider<List<Project>>((ref) {
  final projectsRepo = ref.watch(projectsRepoProvider);
  return projectsRepo.watchProjects();
});

final projectBlocProvider = StateNotifierProvider<ProjectBloc>((ref) {
  final projectsRepo = ref.watch(projectsRepoProvider);
  final project = ref.watch(projectStreamProvider);
  print(project);
  return project.when(
    data: (data) {
      print(data);
      return ProjectBloc(data, projectsRepo);
    },
    loading: () => ProjectBloc([], projectsRepo),
    error: (e, __) {
      print(e);
      return ProjectBloc([], projectsRepo);
    },
  );
});
