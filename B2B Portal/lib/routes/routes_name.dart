// Enum to define allowed screens with their route paths and names
import 'package:flutter/material.dart';

import '../screens/auth/forget_password.dart';
import '../screens/auth/login.dart';
import '../screens/auth/signup.dart';
import '../screens/dashboard/dash_screen.dart';
import '../screens/dashboard/dashboard_wrapper.dart';

enum AppScreen {
  login(path: '/login', name: 'login', isAuth: true),
  signup(path: '/signup', name: 'signup', isAuth: true),
  forgetPassword(
    path: '/forget-password',
    name: 'forget-password',
    isAuth: true,
  ),
  dashboard(path: '/dashboard', name: 'dashboard', isAuth: false);

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
        screen = const Dashboard();
        break;
    }
    // Wrap non-auth screens with DashboardWrapper
    return isAuth ? screen : DashboardWrapper(child: screen);
  }
}
