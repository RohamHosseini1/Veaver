import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hello_world/infrastructure/db/firestore.dart';

import 'project.dart';

class ProjectsRepo {
  final FirebaseFirestore firestore;

  ProjectsRepo(this.firestore);

  // TODO: for fuck's sake, handle errors!

  Future<void> editProject(String id, String title, String content) async {
    final project =
        (await firestore.collection('projects').doc(id).get()).data();
    project?['title'] = title;
    project?['content'] = content;
    return firestore.collection('projects').doc(id).set(project!);
  }

  Future<void> addProject(Project project) {
    return firestore.collection('projects').add({
      'author_name': project.authorName,
      'author_id': project.authorId,
      'title': project.title,
      'content': project.content,
      'created_at': project.createdAt.toIso8601String(),
      'status': project.status.index,
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
                    title: doc['title'],
                    content: doc['content'],
                    status: ProjectStatus.values[doc['status']],
                    authorId: doc['author_id'],
                    authorName: doc['author_name'],
                    createdAt: DateTime.parse(doc['created_at']),
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
