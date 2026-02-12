import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// 6 mum-friendly expense categories
enum ExpenseCategory {
  groceries(
    label: 'Groceries',
    icon: Icons.shopping_cart_rounded,
    color: AppColors.groceries,
  ),
  transport(
    label: 'Transport',
    icon: Icons.directions_car_rounded,
    color: AppColors.transport,
  ),
  kids(
    label: 'Kids',
    icon: Icons.child_care_rounded,
    color: AppColors.kids,
  ),
  bills(
    label: 'Bills',
    icon: Icons.receipt_long_rounded,
    color: AppColors.bills,
  ),
  home(
    label: 'Home',
    icon: Icons.home_rounded,
    color: AppColors.home,
  ),
  other(
    label: 'Other',
    icon: Icons.more_horiz_rounded,
    color: AppColors.other,
  );

  final String label;
  final IconData icon;
  final Color color;

  const ExpenseCategory({
    required this.label,
    required this.icon,
    required this.color,
  });
}
