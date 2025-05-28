import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:remixicon/remixicon.dart';

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

class DashboardMaterialDesignIcons {
  static IconData get home => MdiIcons.homeOutline;
  static IconData get trade => MdiIcons.swapHorizontal;
  static IconData get earn => MdiIcons.trendingUp;
  static IconData get reports => MdiIcons.chartBar;
  static IconData get rewards => MdiIcons.starOutline;
  static IconData get support => MdiIcons.headphones;
  static IconData get settings => MdiIcons.cogOutline;
  static IconData get transaction => MdiIcons.history;
  static IconData get visa => MdiIcons.creditCardOutline;
  static IconData get paypal => MdiIcons.walletOutline;
  static IconData get success => MdiIcons.checkCircleOutline;
  static IconData get declined => MdiIcons.closeCircleOutline;
  static IconData get trendingUp => MdiIcons.arrowUp;
  static IconData get trendingDown => MdiIcons.arrowDown;

  // ✅ New icons for sidebar
  static IconData get analytics => MdiIcons.chartPie;
  static IconData get distribution => MdiIcons.send; // closest to outbox
  static IconData get userManagement => MdiIcons.accountGroupOutline;
  static IconData get roleManagement => MdiIcons.shieldAccountOutline;

  //
  static IconData get comment => MdiIcons.comment;
}

class DashboardRemixIcons {
  static const IconData home = RemixIcons.home_3_line;
  static const IconData trade = RemixIcons.exchange_line;
  static const IconData earn = RemixIcons.line_chart_line;
  static const IconData reports = RemixIcons.bar_chart_2_line;
  static const IconData rewards = RemixIcons.star_line;
  static const IconData support = RemixIcons.headphone_line;
  static const IconData settings = RemixIcons.settings_3_line;
  static const IconData transaction = RemixIcons.history_line;
  static const IconData visa = RemixIcons.bank_card_line;
  static const IconData paypal = RemixIcons.wallet_3_line;
  static const IconData success = RemixIcons.checkbox_circle_line;
  static const IconData declined = RemixIcons.close_circle_line;
  static const IconData trendingUp = RemixIcons.arrow_up_line;
  static const IconData trendingDown = RemixIcons.arrow_down_line;
  static const IconData compass = RemixIcons.compass_4_line;

  // ✅ New icons for sidebar
  static const IconData analytics = RemixIcons.pie_chart_line;
  static const IconData distribution =
      RemixIcons.send_plane_line; // closest to outbox
  static const IconData userManagement = RemixIcons.team_line;
  static const IconData roleManagement = RemixIcons.shield_user_line;

  // Nav Bar icons (Right side)
  static const IconData notification = RemixIcons.notification_4_line;
  static const IconData profileIcon = RemixIcons.user_line;

  // Content Page (Right Side)
  static const IconData arrowIconLeft = RemixIcons.arrow_left_fill;
}
