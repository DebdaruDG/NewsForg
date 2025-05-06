import 'package:flutter/material.dart';

import '../../utils/color_palette.dart';
import '../../utils/textstyles_constant.dart';

class AuthWrapper extends StatelessWidget {
  final Widget child;
  final String title;

  const AuthWrapper({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/background.jpg',
                ), // Replace with your background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Semi-transparent overlay
          Container(color: DashboardColors.primaryBlack.withOpacity(0.5)),
          // Centered card for the form
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Title
                    Text(
                      title,
                      style: DashboardTextStyles.sectionHeader.copyWith(
                        color: DashboardColors.primaryWhite,
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Form card
                    Container(
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: DashboardColors.primaryWhite,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: DashboardColors.darkGrey.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: child,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
