import 'package:flutter/material.dart';
import 'package:hello_world/domain/project/project.dart';
import 'package:yeet/yeet.dart';

class ProjectView extends StatelessWidget {
  final int id;

  ProjectView(this.id);

  @override
  Widget build(BuildContext context) {
    final project = Project(
      id: id,
      content: 'project #$id content',
      title: 'project #$id',
      status: ProjectStatus.todo,
    );
    return GestureDetector(
      onTap: () {
        context.yeet();
      },
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: GestureDetector(
            onTap: () {},
            child: Hero(
              tag: 'project $id',
              child: Card(
                child: Center(
                  child: Text(project.content),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
