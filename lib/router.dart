import 'package:go_router/go_router.dart';

import 'main/main_naviagtion_screen.dart';

final GoRouter myGoRouter = GoRouter(
  initialLocation: "/home",
  routes: [
    GoRoute(
      name: MainNavigationScreen.routeName,
      path: "/:tab(home|write)",
      builder: (context, state) {
        final tab = state.pathParameters["tab"]!;
        return MainNavigationScreen(tab: tab);
      },
    ),
  ],
);
