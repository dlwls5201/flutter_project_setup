import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:project_setup/router.dart';

import 'firebase_options.dart';

void main() async {
  runApp(const MyApp());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mode Tracker',
      routerConfig: myGoRouter,
      themeMode: ThemeMode.system,
      theme: FlexThemeData.light(
        scheme: FlexScheme.amber,
        bottomAppBarElevation: 0,
        scaffoldBackground: Colors.orangeAccent,
        surface: Colors.orangeAccent,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.amber,
        bottomAppBarElevation: 0,
      ),
    );
  }
}
