import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../routes/routes_name.dart';
import '../../utils/color_palette.dart';
import '../../utils/icon_constants.dart';
import '../../utils/textstyles_constant.dart';

class DashboardWrapper extends StatefulWidget {
  final Widget child;

  const DashboardWrapper({super.key, required this.child});

  @override
  State<DashboardWrapper> createState() => _DashboardWrapperState();
}

class _DashboardWrapperState extends State<DashboardWrapper> {
  bool _isSidebarExpanded = true;

  void _toggleSidebar() {
    setState(() {
      _isSidebarExpanded = !_isSidebarExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _isSidebarExpanded ? 200 : 60,
            color: DashboardColors.cardBackground,
            child: Column(
              children: [
                // Sidebar header with toggle button
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_isSidebarExpanded)
                        Text('Busy', style: DashboardTextStyles.sectionHeader),
                      IconButton(
                        icon: Icon(
                          _isSidebarExpanded
                              ? Icons.arrow_left
                              : Icons.arrow_right,
                          color: DashboardColors.primaryBlack,
                        ),
                        onPressed: _toggleSidebar,
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1, color: DashboardColors.lightGrey),
                // Sidebar items
                Expanded(
                  child: ListView(
                    children: [
                      _buildSidebarItem(
                        context,
                        icon: DashboardIcons.home,
                        label: 'Home',
                        screen: AppScreen.dashboard,
                      ),
                      _buildSidebarItem(
                        context,
                        icon: DashboardIcons.trade,
                        label: 'Trade',
                        screen: AppScreen.dashboard, // Placeholder
                      ),
                      _buildSidebarItem(
                        context,
                        icon: DashboardIcons.earn,
                        label: 'Earn',
                        screen: AppScreen.dashboard, // Placeholder
                      ),
                      _buildSidebarItem(
                        context,
                        icon: DashboardIcons.reports,
                        label: 'Reporting',
                        screen: AppScreen.dashboard, // Placeholder
                      ),
                      _buildSidebarItem(
                        context,
                        icon: DashboardIcons.rewards,
                        label: 'Rewards',
                        screen: AppScreen.dashboard, // Placeholder
                      ),
                    ],
                  ),
                ),
                // Support and Settings at the bottom
                _buildSidebarItem(
                  context,
                  icon: DashboardIcons.support,
                  label: 'Support',
                  screen: AppScreen.dashboard, // Placeholder
                ),
                _buildSidebarItem(
                  context,
                  icon: DashboardIcons.settings,
                  label: 'Settings',
                  screen: AppScreen.dashboard, // Placeholder
                ),
              ],
            ),
          ),
          // Main content area with navbar
          Expanded(
            child: Column(
              children: [
                // Navbar
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  color: DashboardColors.primaryWhite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Search bar
                      SizedBox(
                        width: 300,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: DashboardTextStyles.labelSmall,
                            prefixIcon: const Icon(
                              Icons.search,
                              color: DashboardColors.mediumGrey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: DashboardColors.lightGrey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // User profile actions
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.notifications_outlined,
                              color: DashboardColors.primaryBlack,
                            ),
                            onPressed: () {},
                          ),
                          const CircleAvatar(
                            radius: 16,
                            backgroundColor: DashboardColors.lightGrey,
                            child: Icon(
                              Icons.person,
                              color: DashboardColors.primaryBlack,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Main content
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: widget.child,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required AppScreen screen,
  }) {
    final bool isSelected = false;
    // GoRouter.of(context).location == screen.path;

    return ListTile(
      leading: Icon(
        icon,
        color:
            isSelected
                ? DashboardColors.primaryBlack
                : DashboardColors.mediumGrey,
      ),
      title:
          _isSidebarExpanded
              ? Text(
                label,
                style: DashboardTextStyles.labelSmall.copyWith(
                  color:
                      isSelected
                          ? DashboardColors.primaryBlack
                          : DashboardColors.mediumGrey,
                ),
              )
              : null,
      onTap: () {
        context.goNamed(screen.name);
      },
      tileColor: isSelected ? DashboardColors.lightGrey : null,
    );
  }
}
