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
      icon: DashboardRemixIcons.home,
      label: 'Overview',
      screen: AppScreen.dashboard,
    ),
    SidebarItemModel(
      icon: DashboardRemixIcons.trade,
      label: 'Content',
      screen: AppScreen.content,
    ),
    SidebarItemModel(
      icon: DashboardRemixIcons.earn,
      label: 'Reviews',
      screen: AppScreen.reviews,
    ),
    SidebarItemModel(
      icon: DashboardRemixIcons.reports,
      label: 'Schedules',
      screen: AppScreen.schedules,
    ),
    SidebarItemModel(
      icon: DashboardRemixIcons.analytics,
      label: 'Analytics',
      screen: AppScreen.analytics,
    ),
    SidebarItemModel(
      icon: DashboardRemixIcons.distribution,
      label: 'Distribution',
      screen: AppScreen.distribution,
    ),
    SidebarItemModel(
      icon: DashboardRemixIcons.userManagement,
      label: 'User Management',
      screen: AppScreen.users,
    ),
    SidebarItemModel(
      icon: DashboardRemixIcons.roleManagement,
      label: 'Role Management',
      screen: AppScreen.roleManagement,
    ),
  ];

  static List<SidebarItemModel> bottomSidebarItems = [
    SidebarItemModel(
      icon: DashboardRemixIcons.support,
      label: 'Support',
      screen: AppScreen.dashboard,
    ),
    SidebarItemModel(
      icon: DashboardRemixIcons.settings,
      label: 'Settings',
      screen: AppScreen.dashboard,
    ),
  ];
}
