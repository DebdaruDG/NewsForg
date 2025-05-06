import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../routes/routes_name.dart';
import '../../utils/color_palette.dart';
import '../../utils/textstyles_constant.dart';
import 'auth_wrapper.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthWrapper(
      title: 'Sign Up',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Email field
          Text('Email', style: DashboardTextStyles.labelSmall),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter your email',
              hintStyle: DashboardTextStyles.labelSmall.copyWith(
                color: DashboardColors.mediumGrey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: DashboardColors.lightGrey),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Password field
          Text('Password', style: DashboardTextStyles.labelSmall),
          const SizedBox(height: 8),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Enter your password',
              hintStyle: DashboardTextStyles.labelSmall.copyWith(
                color: DashboardColors.mediumGrey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: DashboardColors.lightGrey),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Confirm Password field
          Text('Confirm Password', style: DashboardTextStyles.labelSmall),
          const SizedBox(height: 8),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Confirm your password',
              hintStyle: DashboardTextStyles.labelSmall.copyWith(
                color: DashboardColors.mediumGrey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: DashboardColors.lightGrey),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Sign Up button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Add signup logic here
                context.goNamed(
                  AppScreen.dashboard.name,
                ); // Navigate using enum
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: DashboardColors.primaryBlack,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Sign Up', style: DashboardTextStyles.buttonText),
            ),
          ),
          const SizedBox(height: 16),
          // Link to Login
          Center(
            child: TextButton(
              onPressed: () {
                context.goNamed(AppScreen.login.name); // Navigate using enum
              },
              child: Text(
                'Already have an account? Login',
                style: DashboardTextStyles.labelSmall.copyWith(
                  color: DashboardColors.primaryBlack,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
