import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../model/sidebar_model.dart';
import '../../routes/routes_name.dart';
import '../../utils/color_palette.dart';
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
    final double screenWidth = MediaQuery.of(context).size.width;
    const double mobileThreshold = 600;
    final bool isMobile = screenWidth < mobileThreshold;

    final double maxSidebarWidth = screenWidth * 0.2; // 3/10 of screen width
    final double collapsedSidebarWidth = 80;
    if (isMobile && _isSidebarExpanded) {
      _isSidebarExpanded = false;
    }

    return Scaffold(
      backgroundColor: DashboardColors.cardBackground, // Base canvas color
      body: Column(
        children: [
          // Navbar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            color: DashboardColors.cardBackground, // Matches canvas background
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // App logo and "Busy" label
                Row(
                  children: [
                    const Icon(
                      Icons.apps,
                      color: DashboardColors.primaryBlack,
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Text('Busy', style: DashboardTextStyles.sectionHeader),
                  ],
                ),
                // User actions
                Row(
                  children: [
                    const SizedBox(width: 16),
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
          // Main layout with Sidebar and Content
          Expanded(
            child: Row(
              children: [
                // Sidebar with margin and padding
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width:
                        _isSidebarExpanded
                            ? maxSidebarWidth
                            : collapsedSidebarWidth,
                    decoration: BoxDecoration(
                      color:
                          DashboardColors
                              .primaryWhite, // White inner background
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: DashboardColors.darkGrey.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Sidebar header with search and toggle button
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (_isSidebarExpanded)
                                SizedBox(
                                  // Responsive width: 60% of Sidebar width
                                  width: maxSidebarWidth * 0.75,
                                  height: 45,
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
                                      filled: true,
                                      fillColor: DashboardColors.primaryWhite,
                                    ),
                                  ),
                                ),
                              IconButton(
                                icon: Icon(
                                  _isSidebarExpanded
                                      ? Icons.arrow_left
                                      : Icons.arrow_right,
                                  color: DashboardColors.primaryBlack,
                                  size: 18,
                                ),
                                onPressed: _toggleSidebar,
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          height: 1,
                          color: DashboardColors.lightGrey,
                        ),
                        // Sidebar items using ListView.builder
                        Expanded(
                          child: ListView.builder(
                            itemCount: SidebarItems.topSideBarItems.length,
                            itemBuilder: (context, index) {
                              final item = SidebarItems.topSideBarItems[index];
                              return _buildSidebarItem(
                                context,
                                icon: item.icon,
                                label: item.label,
                                screen: item.screen,
                              );
                            },
                          ),
                        ),
                        // Bottom Sidebar items (Support and Settings)
                        ...SidebarItems.bottomSidebarItems.map((item) {
                          return _buildSidebarItem(
                            context,
                            icon: item.icon,
                            label: item.label,
                            screen: item.screen,
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                // Main content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                      top: 16,
                      bottom: 16,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [widget.child],
                      ),
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
    final bool isSelected =
        GoRouter.of(
          context,
        ).routerDelegate.currentConfiguration.uri.toString() ==
        screen.path;

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
