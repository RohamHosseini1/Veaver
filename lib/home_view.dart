import 'package:flutter/material.dart';
import 'package:hello_world/project_repository.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yeet/yeet.dart';

import 'domain/project/project.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Veaver'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text('Dashboard'),
                    onPressed: () {},
                  ),
                  ElevatedButton(
                    child: Text('Project Flow'),
                    onPressed: () {},
                  ),
                  ElevatedButton(
                    child: Text('Content Calendar'),
                    onPressed: () {},
                  ),
                  ElevatedButton(
                    child: Text('Analytics'),
                    onPressed: () {},
                  ),
                ],
              ),
              Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: Text(
                          'Event one',
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: Text(
                          'Event one',
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: Text(
                          'Event one',
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: LibraryWidget(),
                    color: Colors.grey,
                    height: 200,
                    width: 800,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class LibraryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProjectWidget(1),
          ProjectWidget(2),
          ProjectWidget(3),
          ProjectWidget(4),
          ProjectWidget(5),
        ],
      ),
    );
  }
}

// class FeedWidget extends HookWidget {
//   @override
//   Widget build(BuildContext context) {
//     final state = useProvider(homePageBlocProvider.state);

//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(height: 16),
//         if (state.isLoading)
//           CircularProgressIndicator()
//         else
//           Row(
//             children:
//                 state.projects.map((e) => ProjectWidget(Project(e))).toList(),
//           ),
//       ],
//     );
//   }
// }

class ProjectWidget extends StatelessWidget {
  final int id;

  ProjectWidget(this.id);

  @override
  Widget build(BuildContext context) {
    final project = Project(
      id: id,
      content: 'project #$id content',
      title: 'project #$id',
      status: ProjectStatus.todo,
    );
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          context.yeet('/project/$id');
        },
        child: Hero(
          tag: 'project $id',
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

class DatePickerWidget extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePickerWidget> {
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "${selectedDate.toLocal()}".split(' ')[0],
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            RaisedButton(
              onPressed: () => _selectDate(context),
              child: Text(
                'Select date',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              color: Colors.greenAccent,
            ),
          ],
        ),
      ),
    );
  }
}
