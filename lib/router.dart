import 'package:go_router/go_router.dart';
import 'package:project_setup/features/authentication/login_screen.dart';
import 'package:project_setup/features/authentication/signup_screen.dart';

import 'features/main/main_naviagtion_screen.dart';

final GoRouter myGoRouter = GoRouter(
  //TODO initialLocation: "/home",
  initialLocation: LoginScreen.routeURL,
  routes: [
    GoRoute(
      name: MainNavigationScreen.routeName,
      path: "/:tab(home|write)",
      builder: (context, state) {
        final tab = state.pathParameters["tab"]!;
        return MainNavigationScreen(tab: tab);
      },
    ),
    GoRoute(
      name: LoginScreen.routeName,
      path: LoginScreen.routeURL,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: SignUpScreen.routeName,
      path: SignUpScreen.routeURL,
      builder: (context, state) => const SignUpScreen(),
    ),
  ],
);
