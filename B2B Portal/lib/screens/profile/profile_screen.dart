import 'package:flutter/material.dart';
import '../../utils/color_palette.dart';

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
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, size: 40, color: Colors.white),
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
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => debugPrint('Send Email'),
                      icon: const Icon(Icons.email),
                      label: const Text('Send Email'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton.icon(
                      onPressed: () => debugPrint('Schedule Meeting'),
                      icon: const Icon(Icons.calendar_today),
                      label: const Text('Schedule Meeting'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton.icon(
                      onPressed: () => debugPrint('Follow'),
                      icon: const Icon(Icons.person_add),
                      label: const Text('Follow'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.blue,
                      ),
                    ),
                  ],
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
                      label: Text(_tabs[index]),
                      selected: _selectedTabIndex == index,
                      onSelected: (selected) {
                        setState(() {
                          _selectedTabIndex = index;
                        });
                      },
                      selectedColor: Colors.blue.withOpacity(0.2),
                      backgroundColor: Colors.grey[200],
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
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () => debugPrint('Move to Next Stage'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Move to Next Stage'),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Contact Details
              _buildSectionTitle('Contact Details'),
              Row(
                children: [
                  const Icon(Icons.phone, color: Colors.blue),
                  const SizedBox(width: 8),
                  const Text('+1 123-456-7890'), // Replace with dynamic data
                  const SizedBox(width: 32),
                  const Icon(Icons.email, color: Colors.blue),
                  const SizedBox(width: 8),
                  const Text('john.doe@email.com'), // Replace with dynamic data
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.blue),
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
