// Text style constants for the dashboard
import 'package:flutter/material.dart';
import 'color_palette.dart';

class DashboardTextStyles {
  static const String fontFamily = 'Roboto';

  // Large text for total balance
  static const TextStyle balanceLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: DashboardColors.primaryBlack,
  );

  // Medium text for section headers (e.g., "Transaction History")
  static const TextStyle sectionHeader = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: DashboardColors.primaryBlack,
  );

  // Small text for labels (e.g., dates, statuses)
  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: DashboardColors.mediumGrey,
  );

  // Medium text for amounts and important data
  static const TextStyle amountMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: DashboardColors.primaryBlack,
  );

  // Small text for percentage changes
  static const TextStyle percentageSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: DashboardColors.mediumGrey,
  );

  // Button text style
  static const TextStyle buttonText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: DashboardColors.primaryWhite,
  );
}
