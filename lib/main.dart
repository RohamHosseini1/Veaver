import 'package:flutter/material.dart';
import 'package:hello_world/home_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_world/presentation/project/project_view.dart';
import 'package:yeet/yeet.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hello_world/presentation/auth/auth_view.dart';
import 'application/auth/auth_bloc.dart';
import 'home_view.dart';
import 'presentation/auth/auth_view.dart';

void main() {
  Hive.init('/hive');
  runApp(ProviderScope(child: MyApp()));
}

final yeet = Yeet(
  children: [
    Yeet(
      path: '/',
      builder: (_, __) => HomeView(),
      children: [
        Yeet(
          path: r'/project/:id',
          opaque: false,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
          builder: (params, _) {
            print(params);
            return ProjectView(
              params['id']!,
            );
          },
        ),
      ],
    ),
    Yeet(path: ':_(.*)', builder: (_, __) => Text('404')),
  ],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Veaver',
      theme: ThemeData(
        backgroundColor: Color.alphaBlend(Colors.grey, Colors.black),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      routeInformationParser: YeetInformationParser(),
      routerDelegate: YeeterDelegate(yeet: yeet),
    );
  }
}
