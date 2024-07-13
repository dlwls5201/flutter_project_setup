import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:project_setup/router.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 라우터 이동 시, web url 변경 할 수 있게 해주는 함수
  GoRouter.optionURLReflectsImperativeAPIs = true;

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Mode Tracker',
      routerConfig: ref.watch(routerProvider),
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
