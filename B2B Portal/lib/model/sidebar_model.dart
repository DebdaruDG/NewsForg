// Class to represent a Sidebar item
import 'package:flutter/material.dart';
import '../routes/routes_name.dart';
import '../utils/icon_constants.dart';

class SidebarItemModel {
  final IconData icon;
  final String label;
  final AppScreen screen;

  const SidebarItemModel({
    required this.icon,
    required this.label,
    required this.screen,
  });
}

class SidebarItems {
  static List<SidebarItemModel> get topSideBarItems => [
    SidebarItemModel(
      icon: DashboardIcons.home,
      label: 'Overview',
      screen: AppScreen.dashboard,
    ),
    SidebarItemModel(
      icon: DashboardIcons.trade,
      label: 'Content',
      screen: AppScreen.dashboard,
    ),
    SidebarItemModel(
      icon: DashboardIcons.earn,
      label: 'Reviews',
      screen: AppScreen.dashboard,
    ),
    SidebarItemModel(
      icon: DashboardIcons.reports,
      label: 'Schedules',
      screen: AppScreen.dashboard,
    ),
    SidebarItemModel(
      icon: DashboardIcons.analytics,
      label: 'Analytics',
      screen: AppScreen.dashboard,
    ),
    SidebarItemModel(
      icon: DashboardIcons.distribution,
      label: 'Distribution',
      screen: AppScreen.dashboard,
    ),
    SidebarItemModel(
      icon: DashboardIcons.userManagement,
      label: 'User Management',
      screen: AppScreen.dashboard,
    ),
    SidebarItemModel(
      icon: DashboardIcons.roleManagement,
      label: 'Role Management',
      screen: AppScreen.dashboard,
    ),
  ];

  static const List<SidebarItemModel> bottomSidebarItems = [
    SidebarItemModel(
      icon: DashboardIcons.support,
      label: 'Support',
      screen: AppScreen.dashboard,
    ),
    SidebarItemModel(
      icon: DashboardIcons.settings,
      label: 'Settings',
      screen: AppScreen.dashboard,
    ),
  ];
}
