import 'package:flutter/material.dart';
import '../../utils/auth_animation/bicycle_animation.dart';
import '../../utils/color_palette.dart';
import '../../utils/textstyles_constant.dart';

class AuthWrapper extends StatelessWidget {
  final Widget child;
  final String title;

  const AuthWrapper({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DashboardColors.cardBackground,
      body: Container(
        margin: const EdgeInsets.all(36),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            color: DashboardColors.primaryWhite,
          ),
          child: Row(
            children: [
              // Left side: Background image
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: DashboardColors.canvasBackground,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                    child: const BicycleAnimation(),
                  ),
                ),
              ),
              // Right side: Authentication content
              Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    color: DashboardColors.primaryWhite,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40.0,
                          vertical: 24.0,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title
                            Text(
                              title,
                              style: DashboardTextStyles.sectionHeader.copyWith(
                                color: DashboardColors.primaryBlack,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Enter your email and password',
                              style: DashboardTextStyles.labelSmall.copyWith(
                                color: DashboardColors.mediumGrey,
                              ),
                            ),
                            const SizedBox(height: 24),
                            // Form content
                            child,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
