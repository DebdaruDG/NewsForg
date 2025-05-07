// Enum to define allowed screens with their route paths and names
import 'package:flutter/material.dart';

import '../screens/analytics/analytics_screen.dart';
import '../screens/auth/forget_password.dart';
import '../screens/auth/login.dart';
import '../screens/auth/signup.dart';
import '../screens/content/content_details.dart/content_details.dart';
import '../screens/content/content_screen.dart';
import '../screens/dashboard/dash_screen.dart';
import '../screens/dashboard/dashboard_wrapper.dart';
import '../screens/distribution/distribution_screen.dart';
import '../screens/review/reviews_screen.dart';
import '../screens/role_management/role_screen.dart';
import '../screens/schedules/schedule_screen.dart';
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
  contentDetails(
    path: '/contentDetails',
    name: 'contentDetails',
    isAuth: false,
  ),
  reviews(path: '/reviews', name: 'reviews', isAuth: false),
  schedules(path: '/schedules', name: 'schedules', isAuth: false),
  analytics(path: '/analytics', name: 'analytics', isAuth: false),
  distribution(path: '/distribution', name: 'distribution', isAuth: false),
  users(path: '/users', name: 'users', isAuth: false),
  roleManagement(
    path: '/roleManagement',
    name: 'roleManagement',
    isAuth: false,
  );

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
      // Authorization Screens
      case AppScreen.login:
        screen = const LoginScreen();
        break;
      case AppScreen.signup:
        screen = const SignUpScreen();
        break;
      case AppScreen.forgetPassword:
        screen = const ForgetPasswordScreen();
        break;
      // SideBar Screens
      case AppScreen.dashboard:
        screen = const DashboardScreen();
        break;
      case AppScreen.content:
        screen = const ContentScreen();
        break;
      case AppScreen.contentDetails:
        screen = const ContentDetailsPage();
        break;
      case AppScreen.schedules:
        screen = const ScheduleScreen();
        break;
      case AppScreen.analytics:
        screen = const AnalyticsScreen();
        break;
      case AppScreen.distribution:
        screen = const DistributionScreen();
        break;
      case AppScreen.reviews:
        screen = const ReviewScreen();
        break;
      case AppScreen.users:
        screen = const UserScreen();
        break;
      case AppScreen.roleManagement:
        screen = const RoleScreen();
        break;
    }
    // Wrap non-auth screens with DashboardWrapper
    return isAuth ? screen : DashboardWrapper(child: screen);
  }
}
