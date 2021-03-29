import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';

enum ProjectStatus { todo, doing, done }

@freezed
abstract class Project with _$Project {
  const factory Project({
    required String id,
    required String title,
    required String content,
    required ProjectStatus status,
  }) = _Project;
}
