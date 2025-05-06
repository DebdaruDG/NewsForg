import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'routes_name.dart';

final GoRouter router = GoRouter(
  initialLocation: AppScreen.login.path,
  routes:
      AppScreen.values
          .map(
            (screen) => GoRoute(
              path: screen.path,
              name: screen.name,
              builder: (context, state) => screen.getScreen(),
            ),
          )
          .toList(),
  redirect: (BuildContext context, GoRouterState state) {
    // Add authentication logic here if needed
    return null; // No redirect for now
  },
);
