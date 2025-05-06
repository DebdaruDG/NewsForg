// Enum to define allowed screens with their route paths and names
import 'package:flutter/material.dart';

import '../screens/auth/forget_password.dart';
import '../screens/auth/login.dart';
import '../screens/auth/signup.dart';
import '../screens/dashboard/dash_screen.dart';

enum AppScreen {
  login(path: '/login', name: 'login'),
  signup(path: '/signup', name: 'signup'),
  forgetPassword(path: '/forget-password', name: 'forget-password'),
  dashboard(path: '/dashboard', name: 'dashboard');

  const AppScreen({required this.path, required this.name});

  final String path;
  final String name;

  Widget getScreen() {
    switch (this) {
      case AppScreen.login:
        return const LoginScreen();
      case AppScreen.signup:
        return const SignUpScreen();
      case AppScreen.forgetPassword:
        return const ForgetPasswordScreen();
      case AppScreen.dashboard:
        return const Dashboard();
    }
  }
}
