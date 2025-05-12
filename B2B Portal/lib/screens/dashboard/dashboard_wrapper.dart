import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../model/sidebar_model.dart';
import '../../routes/routes_name.dart';
import '../../utils/color_palette.dart';
import '../../utils/icon_constants.dart';
import '../../utils/textstyles_constant.dart';
import '../../utils/widgets/generic_pop_up.dart';

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

    final GlobalKey popupIconKey = GlobalKey();

    return Scaffold(
      backgroundColor: DashboardColors.cardBackground, // Base canvas color
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            // Navbar
            _navBar(popupIconKey),
            // Main layout with Sidebar and Content
            Expanded(
              child: Row(
                children: [
                  // Sidebar with margin and padding
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                      top: 8,
                      bottom: 8,
                    ),
                    child: _sideBarContent(
                      maxSidebarWidth,
                      collapsedSidebarWidth,
                    ),
                  ),
                  // Main content
                  Expanded(child: _mainBody),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navBar(GlobalKey<State<StatefulWidget>> popUpKey) => Container(
    color: DashboardColors.cardBackground,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // App logo and "PressPilot" label
        Row(
          children: [
            const Icon(
              // Icons.explore_outlined,
              DashboardRemixIcons.compass,
              color: DashboardColors.primaryBlack,
              size: 24,
            ),
            const SizedBox(width: 8),
            Text('PressPilot', style: DashboardTextStyles.sectionHeader),
          ],
        ),
        // User actions
        Row(
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                key: popUpKey,
                onTap:
                    () => GenericPopupMenu.show(
                      context: context,
                      iconKey: popUpKey,
                      contentWidgets: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Edit",
                            style: DashboardTextStyles.primaryText400,
                          ),
                        ),
                      ],
                    ),
                child: const Icon(
                  Icons.notifications_outlined,
                  color: DashboardColors.primaryBlack,
                ),
              ),
            ),
            const SizedBox(width: 16),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: InkWell(
                onTap: () => context.goNamed(AppScreen.profile.name),
                child: const CircleAvatar(
                  radius: 16,
                  backgroundColor: DashboardColors.lightGrey,
                  child: Icon(
                    Icons.person,
                    color: DashboardColors.primaryBlack,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );

  Widget _sideBarContent(
    double maxSidebarWidth,
    double collapsedSidebarWidth,
  ) => AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    width: _isSidebarExpanded ? maxSidebarWidth : collapsedSidebarWidth,
    decoration: BoxDecoration(
      color: DashboardColors.primaryWhite, // White inner background
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
          padding:
              (_isSidebarExpanded)
                  ? const EdgeInsets.symmetric(horizontal: 12, vertical: 0)
                  : EdgeInsets.zero,
          child: Column(
            children: [
              Row(
                mainAxisAlignment:
                    _isSidebarExpanded
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      _isSidebarExpanded
                          ? Icons.keyboard_double_arrow_left_sharp
                          : Icons.keyboard_double_arrow_right_sharp,
                      color: DashboardColors.primaryBlack,
                      size: 24,
                    ),
                    onPressed: _toggleSidebar,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_isSidebarExpanded)
                    Expanded(
                      child: SizedBox(
                        // Responsive width: 60% of Sidebar width
                        width: maxSidebarWidth * 0.9,
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
                    ),
                ],
              ),
            ],
          ),
        ),
        if (_isSidebarExpanded) const SizedBox(height: 12),
        const Divider(height: 1, color: DashboardColors.lightGrey),
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
  );

  Widget get _mainBody => Padding(
    padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
    child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [widget.child],
      ),
    ),
  );

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
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
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
