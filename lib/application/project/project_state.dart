import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hello_world/domain/project/project.dart';

part 'project_state.freezed.dart';

@freezed
abstract class ProjectState with _$ProjectState {
  const factory ProjectState({
    required List<Project> project,
    required String newProject,
  }) = _ProjectState;
}
