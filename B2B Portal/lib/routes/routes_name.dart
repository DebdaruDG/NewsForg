// Enum to define allowed screens with their route paths and names
import 'package:flutter/material.dart';

import '../screens/auth/forget_password.dart';
import '../screens/auth/login.dart';
import '../screens/auth/signup.dart';
import '../screens/content/content_screen.dart';
import '../screens/dashboard/dash_screen.dart';
import '../screens/dashboard/dashboard_wrapper.dart';
import '../screens/role_management/role_screen.dart';
import '../screens/user_management/user_screen.dart';

enum AppScreen {
  login(path: '/login', name: 'login', isAuth: true),
  signup(path: '/signup', name: 'signup', isAuth: true),
  forgetPassword(
    path: '/forget-password',
    name: 'forget-password',
    isAuth: true,
  ),
  dashboard(path: '/dashboard', name: 'dashboard', isAuth: false),
  content(path: '/content', name: 'content', isAuth: false),
  users(path: '/users', name: 'users', isAuth: false),
  roleManagement(
    path: '/roleManagement',
    name: 'roleManagement',
    isAuth: false,
  ),
  reviews(path: '/reviews', name: 'reviews', isAuth: false);

  const AppScreen({
    required this.path,
    required this.name,
    required this.isAuth,
  });

  final String path;
  final String name;
  final bool isAuth;

  // Helper to get the widget for each screen
  Widget getScreen() {
    Widget screen;
    switch (this) {
      case AppScreen.login:
        screen = const LoginScreen();
        break;
      case AppScreen.signup:
        screen = const SignUpScreen();
        break;
      case AppScreen.forgetPassword:
        screen = const ForgetPasswordScreen();
        break;
      case AppScreen.dashboard:
        screen = const DashboardScreen();
        break;
      case AppScreen.content:
        screen = const ContentScreen();
        break;
      case AppScreen.users:
        screen = const UserScreen();
        break;
      case AppScreen.roleManagement:
        screen = const RoleScreen();
        break;
      case AppScreen.reviews:
        screen = const DashboardScreen();
        break;
    }
    // Wrap non-auth screens with DashboardWrapper
    return isAuth ? screen : DashboardWrapper(child: screen);
  }
}
