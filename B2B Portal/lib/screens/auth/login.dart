import 'package:flutter/material.dart';
import '../../utils/color_palette.dart';
import '../../utils/textstyles_constant.dart';
import 'auth_wrapper.dart';
import 'signup.dart';
import 'forget_password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthWrapper(
      title: 'Login',
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
          const SizedBox(height: 24),
          // Login button
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
              child: Text('Login', style: DashboardTextStyles.buttonText),
            ),
          ),
          const SizedBox(height: 16),
          // Links
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
                child: Text(
                  'Sign Up',
                  style: DashboardTextStyles.labelSmall.copyWith(
                    color: DashboardColors.primaryBlack,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgetPasswordScreen(),
                    ),
                  );
                },
                child: Text(
                  'Forget Password?',
                  style: DashboardTextStyles.labelSmall.copyWith(
                    color: DashboardColors.primaryBlack,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
