import 'package:flutter/material.dart';
import 'package:hello_world/domain/db/db_repo.dart';
import 'package:hello_world/project_repository.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yeet/yeet.dart';
import 'domain/project/project.dart';
import 'package:hello_world/application/auth/auth_bloc.dart';
import 'package:hello_world/application/auth/auth_state.dart';
import 'package:hello_world/application/project/project_bloc.dart';
import 'package:hello_world/domain/auth/auth_repo.dart';
import 'package:hello_world/domain/project/project_repo.dart';

class HomeView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final authRepo = useProvider(authRepoProvider);
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'In Progress',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                Container(
                  child: ProjectRowWidget(ProjectStatus.doing),
                  color: Colors.white70,
                  height: 200,
                  width: 800,
                ),
                Text(
                  'To Do',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                Container(
                  child: ProjectRowWidget(ProjectStatus.todo),
                  color: Colors.white70,
                  height: 200,
                  width: 800,
                ),
                Text(
                  'Done',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                Container(
                  child: ProjectRowWidget(ProjectStatus.done),
                  color: Colors.white70,
                  height: 200,
                  width: 800,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectRowWidget extends HookWidget {
  final ProjectStatus status;

  ProjectRowWidget(this.status);

  @override
  Widget build(BuildContext context) {
    final projectBloc = useProvider(projectBlocProvider);
    final state = useProvider(projectBlocProvider.state);
    print(state);
    final projects = state.project.where((element) => element.status == status);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: TextField(
              onChanged: (value) {
                projectBloc.projectContentChanged(value);
              },
              decoration: InputDecoration(hintText: 'Add project'),
            ),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              projectBloc.addButtonPressed(status);
            },
          ),
          SizedBox(height: 16),
          if (state.project.isEmpty)
            CircularProgressIndicator()
          else
            ...projects.map((e) => ProjectWidget(project: e)).toList(),
        ],
      ),
    );
  }
}

class ProjectWidget extends HookWidget {
  final Project project;

  ProjectWidget({required this.project});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          context.yeet('/project/${project.id}');
        },
        child: Hero(
          tag: 'project ${project.id}',
          child: Card(
            elevation: 5,
            child: Column(
              children: [
                SizedBox(height: 16),
                Row(
                    //children: ,
                    ),
                SizedBox(height: 16),
                Container(
                  child: Text(project.title),
                  color: Colors.white,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.done_rounded,
                        color: Colors.green,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.pause,
                        color: Colors.yellow,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
