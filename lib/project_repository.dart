import 'dart:async';
import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hello_world/home_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yeet/yeet.dart';
import 'package:provider/provider.dart';
import 'package:hello_world/mock_auth_repository.dart';

import 'domain/project/project.dart';

enum DoneStatus {
  Done,
  Pause,
  Delete,
  none,
}

// class Project {
//   int id;

//   DoneStatus doneStatus;

//   Project(
//     e, {
//     required this.id,
//     this.doneStatus = DoneStatus.none,
//   });
// }

abstract class ProjectRepository {
  Future<List<Project>> getAllProjects();
  Stream<List<Project>> showAllProjects();
  Future<bool> done(int id);
  Future<bool> pause(int id);
  Future<bool> delete(int id);
}

abstract class MockProjectRepository implements ProjectRepository {
  final AuthRepository authRepository;

  MockProjectRepository({required this.authRepository});

  final project = <Project>[];

  @override
  Future<List<Project>> getAllProjects() async {
    await Future.delayed(Duration(seconds: 0));
    return project;
  }

  // @override
  // Future<bool> done(int id) async {
  //   project[id].doneStatus = DoneStatus.Done;
  //   return true;
  // }

  // @override
  // Future<bool> pause(int id) async {
  //   project[id].doneStatus = DoneStatus.Pause;
  //   return true;
  // }

  // @override
  // Future<bool> delete(int id) async {
  //   project[id].doneStatus = DoneStatus.Delete;
  //   return true;
  // }

  @override
  Stream<List<Project>> watchAllProjects() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 3));
      // project.add(Project(id: project.length));
      yield project;
    }
  }
}
