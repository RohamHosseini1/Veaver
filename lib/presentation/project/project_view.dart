import 'package:flutter/material.dart';
import 'package:hello_world/domain/project/project.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:yeet/yeet.dart';
import 'package:hello_world/application/project/project_bloc.dart';

class ProjectView extends HookWidget {
  final String id;

  ProjectView(this.id);

  @override
  Widget build(BuildContext context) {
    final projectBloc = useProvider(projectBlocProvider);
    final projectState = useProvider(projectBlocProvider.state);
    final project =
        projectState.project.where((element) => element.id == id).first;
    final titleController = useTextEditingController(text: project.title);
    final contentController = useTextEditingController(text: project.content);
    return GestureDetector(
        onTap: () {
          projectBloc.projectSaved(
            id,
            titleController.text,
            contentController.text,
          );
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextField(
                          controller: titleController,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        TextField(
                          controller: contentController,
                          minLines: null,
                          maxLines: null,
                          decoration: InputDecoration(border: InputBorder.none),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

class ContentSelectMenu extends StatefulWidget {
  const ContentSelectMenu({Key? key}) : super(key: key);

  @override
  _ContentSelectMenu createState() => _ContentSelectMenu();
}

class _ContentSelectMenu extends State<ContentSelectMenu> {
  String dropdownValue = 'Category';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black54),
      underline: Container(
        height: 2,
        color: Colors.black38,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Blog', 'Video', 'Podcast', 'Other']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
