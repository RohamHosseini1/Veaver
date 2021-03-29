import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hello_world/infrastructure/db/firestore.dart';

import 'project.dart';

class ProjectsRepo {
  final FirebaseFirestore firestore;

  ProjectsRepo(this.firestore);

  Future<void> project(
    String authorName,
    String authorId,
    String content,
    DateTime createdAt,
  ) {
    return firestore.collection('projects').add({
      'author_name': authorName,
      'author_id': authorId,
      'content': content,
      'created_at': createdAt.toIso8601String(),
    });
  }

  Stream<List<Project>> watchProjects() {
    try {
      return firestore
          .collection('projects')
          .orderBy('created_at', descending: true)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => Project(
                    id: doc.id,
                    title: '',
                    content: doc['content'],
                    status: ProjectStatus.todo,
                  ))
              .toList());
    } catch (e) {
      print('error is $e');
    }
    return Stream.value([]);
  }
}

final projectsRepoProvider = Provider<ProjectsRepo>((ref) {
  final firestore = ref.watch(firestoreProvider);
  return ProjectsRepo(firestore);
});
