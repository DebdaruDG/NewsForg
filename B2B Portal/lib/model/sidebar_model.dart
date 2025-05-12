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
      icon: DashboardLucideIcons.home,
      label: 'Overview',
      screen: AppScreen.dashboard,
    ),
    SidebarItemModel(
      icon: DashboardLucideIcons.trade,
      label: 'Content',
      screen: AppScreen.content,
    ),
    SidebarItemModel(
      icon: DashboardLucideIcons.earn,
      label: 'Reviews',
      screen: AppScreen.reviews,
    ),
    SidebarItemModel(
      icon: DashboardLucideIcons.reports,
      label: 'Schedules',
      screen: AppScreen.schedules,
    ),
    SidebarItemModel(
      icon: DashboardLucideIcons.analytics,
      label: 'Analytics',
      screen: AppScreen.analytics,
    ),
    SidebarItemModel(
      icon: DashboardLucideIcons.distribution,
      label: 'Distribution',
      screen: AppScreen.distribution,
    ),
    SidebarItemModel(
      icon: DashboardLucideIcons.userManagement,
      label: 'User Management',
      screen: AppScreen.users,
    ),
    SidebarItemModel(
      icon: DashboardLucideIcons.roleManagement,
      label: 'Role Management',
      screen: AppScreen.roleManagement,
    ),
  ];

  static const List<SidebarItemModel> bottomSidebarItems = [
    SidebarItemModel(
      icon: DashboardLucideIcons.support,
      label: 'Support',
      screen: AppScreen.dashboard,
    ),
    SidebarItemModel(
      icon: DashboardLucideIcons.settings,
      label: 'Settings',
      screen: AppScreen.dashboard,
    ),
  ];
}
