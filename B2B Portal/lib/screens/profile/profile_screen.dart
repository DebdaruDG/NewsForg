import 'package:flutter/material.dart';
import '../../utils/color_palette.dart';
import '../../utils/textstyles_constant.dart';
import '../../utils/widgets/generic_pop_up.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedTabIndex = 0;
  final List<String> _tabs = [
    'Overview',
    'Published Articles',
    'Drafts',
    'Messages',
    'Activities',
    'Comments',
    'Profile Stats',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: DashboardColors.primaryWhite,
        borderRadius: const BorderRadius.all(Radius.circular(14)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Journalist Name, Role, and Action Buttons
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: DashboardColors.mediumGrey,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: DashboardColors.primaryWhite,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'John Doe', // Replace with dynamic data
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Role: Senior Reporter',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: DashboardColors.mediumGrey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Builder(
                  builder: (context) {
                    double width = MediaQuery.of(context).size.width;
                    bool webView = width > 932;
                    bool tabletView = width >= 812 && width <= 932;
                    // Large Screens
                    if (webView) {
                      return Row(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () => debugPrint('Send Email'),
                            icon: const Icon(
                              Icons.email,
                              color: DashboardColors.primaryWhite,
                            ),
                            label: Text(
                              'Send Email',
                              style: DashboardTextStyles.amountMedium.copyWith(
                                fontSize: 14,
                                color: DashboardColors.primaryWhite,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: DashboardColors.primaryBlack,
                              foregroundColor: DashboardColors.primaryWhite,
                            ),
                          ),
                          const SizedBox(width: 8),
                          OutlinedButton.icon(
                            onPressed: () => debugPrint('Schedule Meeting'),
                            icon: const Icon(
                              Icons.calendar_today,
                              color: DashboardColors.primaryBlack,
                            ),
                            label: Text(
                              'Schedule Meeting',
                              style: DashboardTextStyles.amountMedium.copyWith(
                                fontSize: 14,
                                color: DashboardColors.primaryBlack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: DashboardColors.primaryBlack,
                            ),
                          ),
                          const SizedBox(width: 8),
                          OutlinedButton.icon(
                            onPressed: () => debugPrint('Follow'),
                            icon: const Icon(
                              Icons.person_add,
                              color: DashboardColors.primaryBlack,
                            ),
                            label: Text(
                              'Follow',
                              style: DashboardTextStyles.amountMedium.copyWith(
                                fontSize: 14,
                                color: DashboardColors.primaryBlack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: DashboardColors.primaryBlack,
                            ),
                          ),
                        ],
                      );
                    }
                    // Tablet Width
                    else if (tabletView) {
                      return Row(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () => debugPrint('Send Email'),
                            icon: const Icon(
                              Icons.email,
                              color: DashboardColors.primaryWhite,
                            ),
                            label: Text(
                              'Email',
                              style: DashboardTextStyles.amountMedium.copyWith(
                                fontSize: 14,
                                color: DashboardColors.primaryWhite,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: DashboardColors.primaryBlack,
                              foregroundColor: DashboardColors.primaryWhite,
                            ),
                          ),
                          const SizedBox(width: 8),
                          OutlinedButton.icon(
                            onPressed: () => debugPrint('Schedule Meeting'),
                            icon: const Icon(
                              Icons.calendar_today,
                              color: DashboardColors.primaryBlack,
                            ),
                            label: Text(
                              'Meeting',
                              style: DashboardTextStyles.amountMedium.copyWith(
                                fontSize: 14,
                                color: DashboardColors.primaryBlack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: DashboardColors.primaryBlack,
                            ),
                          ),
                          const SizedBox(width: 8),
                          OutlinedButton.icon(
                            onPressed: () => debugPrint('Follow'),
                            icon: const Icon(
                              Icons.person_add,
                              color: DashboardColors.primaryBlack,
                            ),
                            label: Text(
                              'Follow',
                              style: DashboardTextStyles.amountMedium.copyWith(
                                fontSize: 14,
                                color: DashboardColors.primaryBlack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: DashboardColors.primaryBlack,
                            ),
                          ),
                        ],
                      );
                    }
                    // Small Screen - Show Popup Menu
                    else {
                      final GlobalKey popupIconKey = GlobalKey();
                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          key: popupIconKey,
                          onTap:
                              () => GenericPopupMenu.show(
                                context: context,
                                iconKey: popupIconKey,
                                contentWidgets: [
                                  ElevatedButton.icon(
                                    onPressed: () => debugPrint('Send Email'),
                                    icon: const Icon(
                                      Icons.email,
                                      color: DashboardColors.primaryWhite,
                                    ),
                                    label: Text(
                                      'Send Email',
                                      style: DashboardTextStyles.amountMedium
                                          .copyWith(
                                            fontSize: 14,
                                            color: DashboardColors.primaryWhite,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          DashboardColors.primaryBlack,
                                      foregroundColor:
                                          DashboardColors.primaryWhite,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  OutlinedButton.icon(
                                    onPressed:
                                        () => debugPrint('Schedule Meeting'),
                                    icon: const Icon(
                                      Icons.calendar_today,
                                      color: DashboardColors.primaryBlack,
                                    ),
                                    label: Text(
                                      'Schedule Meeting',
                                      style: DashboardTextStyles.amountMedium
                                          .copyWith(
                                            fontSize: 14,
                                            color: DashboardColors.primaryBlack,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor:
                                          DashboardColors.primaryBlack,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  OutlinedButton.icon(
                                    onPressed: () => debugPrint('Follow'),
                                    icon: const Icon(
                                      Icons.person_add,
                                      color: DashboardColors.primaryBlack,
                                    ),
                                    label: Text(
                                      'Follow',
                                      style: DashboardTextStyles.amountMedium
                                          .copyWith(
                                            fontSize: 14,
                                            color: DashboardColors.primaryBlack,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor:
                                          DashboardColors.primaryBlack,
                                    ),
                                  ),
                                ],
                              ),
                          child: const Icon(Icons.more_vert),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Tabs
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(_tabs.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(
                        _tabs[index],
                        style: DashboardTextStyles.amountMedium.copyWith(
                          fontSize: 14,
                          color:
                              _selectedTabIndex == index
                                  ? DashboardColors.primaryWhite
                                  : DashboardColors.primaryBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      selected: _selectedTabIndex == index,
                      onSelected: (selected) {
                        setState(() {
                          _selectedTabIndex = index;
                        });
                      },
                      selectedColor: DashboardColors.primaryBlack,
                      backgroundColor: DashboardColors.primaryWhite,
                      showCheckmark: false,
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 16),

            // Tab Content (Overview as default)
            if (_selectedTabIndex == 0) ...[
              // Current Article Status
              _buildSectionTitle('Current Article Status'),
              Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: 0.5, // Replace with dynamic progress
                      backgroundColor: Colors.grey[300],
                      color: DashboardColors.primaryBlack,
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () => debugPrint('Move to Next Stage'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: DashboardColors.primaryBlack,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      'Move to Next Stage',
                      style: DashboardTextStyles.amountMedium.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: DashboardColors.primaryWhite,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Contact Details
              _buildSectionTitle('Contact Details'),
              Row(
                children: [
                  const Icon(Icons.phone, color: DashboardColors.primaryBlack),
                  const SizedBox(width: 8),
                  const Text('+1 123-456-7890'), // Replace with dynamic data
                  const SizedBox(width: 32),
                  const Icon(Icons.email, color: DashboardColors.primaryBlack),
                  const SizedBox(width: 8),
                  const Text('john.doe@email.com'), // Replace with dynamic data
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: DashboardColors.primaryBlack,
                  ),
                  const SizedBox(width: 8),
                  const Text('New York, USA'), // Replace with dynamic data
                ],
              ),
              const SizedBox(height: 16),

              // Current Assignment
              _buildSectionTitle('Current Assignment'),
              const Text(
                'Title: The Future of Tech\nCategory: Technology\nDeadline: 2025-05-20\nStatus: In Progress',
              ),
              const SizedBox(height: 16),

              // Beats Covered
              _buildSectionTitle('Beats Covered'),
              Wrap(
                spacing: 8,
                children: const [
                  Chip(label: Text('Politics')),
                  Chip(label: Text('Technology')),
                  Chip(label: Text('Environment')),
                  Chip(label: Text('Health')),
                ],
              ),
              const SizedBox(height: 16),

              // Last Editor Note
              _buildSectionTitle('Last Editor Note'),
              const Text(
                'Editor: Jane Smith\nDate: 2025-05-10\nNote: Please revise the introduction.',
              ),
              const SizedBox(height: 16),

              // Portfolio & Website
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle('Portfolio Link'),
                      const Text(
                        'portfolio.johndoe.com',
                      ), // Replace with dynamic data
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle('Website'),
                      const Text(
                        'www.johndoe.com',
                      ), // Replace with dynamic data
                    ],
                  ),
                ],
              ),
            ],

            // Placeholder for other tabs
            if (_selectedTabIndex == 1)
              const Text('Published Articles Tab - Implement data table here'),
            if (_selectedTabIndex == 2)
              const Text('Drafts Tab - Implement data table here'),
            if (_selectedTabIndex == 3)
              const Text('Messages Tab - Implement message list here'),
            if (_selectedTabIndex == 4)
              const Text('Activities Tab - Implement activity log here'),
            if (_selectedTabIndex == 5)
              const Text('Comments Tab - Implement comment section here'),
            if (_selectedTabIndex == 6)
              const Text('Profile Stats Tab - Implement stats here'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
