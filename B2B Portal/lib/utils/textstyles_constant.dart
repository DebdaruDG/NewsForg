// Text style constants for the dashboard
import 'package:flutter/material.dart';
import 'color_palette.dart';
import 'font_family_constants.dart';

class DashboardTextStyles {
  // Large text for total balance
  static const TextStyle balanceLarge = TextStyle(
    fontFamily: FontFamilyConstants.bitter,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: DashboardColors.primaryBlack,
  );

  // Medium text for section headers (e.g., "Transaction History")
  static const TextStyle sectionHeader = TextStyle(
    fontFamily: FontFamilyConstants.bitter,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: DashboardColors.primaryBlack,
  );

  // Small text for labels (e.g., dates, statuses)
  static const TextStyle labelSmall = TextStyle(
    fontFamily: FontFamilyConstants.bitter,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: DashboardColors.mediumGrey,
  );

  // Medium text for amounts and important data
  static const TextStyle amountMedium = TextStyle(
    fontFamily: FontFamilyConstants.bitter,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: DashboardColors.primaryBlack,
  );

  // Small text for percentage changes
  static const TextStyle percentageSmall = TextStyle(
    fontFamily: FontFamilyConstants.bitter,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: DashboardColors.mediumGrey,
  );

  // Button text style
  static const TextStyle buttonText = TextStyle(
    fontFamily: FontFamilyConstants.bitter,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: DashboardColors.primaryWhite,
  );

  // primary text 400
  static const TextStyle primaryText400 = TextStyle(
    fontFamily: FontFamilyConstants.bitter,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: DashboardColors.darkGrey,
  );

  // primary text 500
  static const TextStyle primaryText500 = TextStyle(
    fontFamily: FontFamilyConstants.bitter,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: DashboardColors.mediumGrey,
  );
}
