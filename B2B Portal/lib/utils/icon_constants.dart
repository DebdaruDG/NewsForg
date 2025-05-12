import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Icon constants for the dashboard
class DashboardIcons {
  static const IconData home = Icons.home_outlined;
  static const IconData trade = Icons.swap_horiz_outlined;
  static const IconData earn = Icons.trending_up_outlined;
  static const IconData reports = Icons.bar_chart_outlined;
  static const IconData rewards = Icons.star_border_outlined;
  static const IconData support = Icons.support_agent_outlined;
  static const IconData settings = Icons.settings_outlined;
  static const IconData transaction = Icons.history_outlined;
  static const IconData visa = Icons.credit_card_outlined;
  static const IconData paypal = Icons.payment_outlined;
  static const IconData success = Icons.check_circle_outline;
  static const IconData declined = Icons.cancel_outlined;
  static const IconData trendingUp = Icons.arrow_upward;
  static const IconData trendingDown = Icons.arrow_downward;

  // ✅ New icons for sidebar
  static const IconData analytics = Icons.analytics_outlined;
  static const IconData distribution = Icons.outbox_outlined;
  static const IconData userManagement = Icons.group_outlined;
  static const IconData roleManagement = Icons.admin_panel_settings_outlined;
}

class DashboardLucideIcons {
  static const IconData home = LucideIcons.home;
  static const IconData trade = LucideIcons.moveHorizontal;
  static const IconData earn = LucideIcons.trendingUp;
  static const IconData reports = LucideIcons.barChart3;
  static const IconData rewards = LucideIcons.star;
  static const IconData support = LucideIcons.headphones;
  static const IconData settings = LucideIcons.settings;
  static const IconData transaction = LucideIcons.history;
  static const IconData visa = LucideIcons.creditCard;
  static const IconData paypal = LucideIcons.wallet;
  static const IconData success = LucideIcons.checkCircle2;
  static const IconData declined = LucideIcons.xCircle;
  static const IconData trendingUp = LucideIcons.arrowUp;
  static const IconData trendingDown = LucideIcons.arrowDown;

  // ✅ New icons for sidebar
  static const IconData analytics = LucideIcons.pieChart;
  static const IconData distribution = LucideIcons.send; // closest to outbox
  static const IconData userManagement = LucideIcons.users;
  static const IconData roleManagement = LucideIcons.shield;
}

class DashboardFontAwesomeIcons {
  static const IconData home = FontAwesomeIcons.house;
  static const IconData trade = FontAwesomeIcons.rightLeft; // swap
  static const IconData earn = FontAwesomeIcons.chartLine;
  static const IconData reports = FontAwesomeIcons.chartColumn; // or chartBar
  static const IconData rewards = FontAwesomeIcons.star;
  static const IconData support =
      FontAwesomeIcons.headphones; // closest to support agent
  static const IconData settings = FontAwesomeIcons.gear;
  static const IconData transaction =
      FontAwesomeIcons.clockRotateLeft; // history
  static const IconData visa = FontAwesomeIcons.ccVisa;
  static const IconData paypal = FontAwesomeIcons.ccPaypal;
  static const IconData success = FontAwesomeIcons.circleCheck;
  static const IconData declined = FontAwesomeIcons.circleXmark;
  static const IconData trendingUp = FontAwesomeIcons.arrowUp;
  static const IconData trendingDown = FontAwesomeIcons.arrowDown;

  // ✅ New icons for sidebar
  static const IconData analytics = FontAwesomeIcons.chartPie;
  static const IconData distribution =
      FontAwesomeIcons.paperPlane; // closest to outbox
  static const IconData userManagement = FontAwesomeIcons.users;
  static const IconData roleManagement = FontAwesomeIcons.shieldHalved;
}
