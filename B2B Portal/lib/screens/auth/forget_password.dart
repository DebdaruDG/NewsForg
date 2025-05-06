import 'package:flutter/material.dart';
import '../../utils/color_palette.dart';
import '../../utils/textstyles_constant.dart';
import 'auth_wrapper.dart';
import 'login.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthWrapper(
      title: 'Forget Password',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Instruction text
          Text(
            'Enter your email to receive a password reset link.',
            style: DashboardTextStyles.labelSmall,
          ),
          const SizedBox(height: 16),
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
          const SizedBox(height: 24),
          // Send Reset Link button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: DashboardColors.primaryBlack,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Send Reset Link',
                style: DashboardTextStyles.buttonText,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Link to Login
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: Text(
                'Back to Login',
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
