import 'package:flutter/material.dart';
import 'glass_card.dart';

/// Rebecca's daily money tip card (swipeable)
class TipCard extends StatelessWidget {
  final String tip;
  final int index;

  const TipCard({
    super.key,
    required this.tip,
    required this.index,
  });

  static const List<String> rebeccaTips = [
    "Track every coffee ☕ — small leaks sink big ships!",
    "Try a 24-hour rule: wait a day before non-essential purchases.",
    "Set up an auto-transfer to savings every payday — even \$5 helps!",
    "Meal planning saves the average family \$150/month 🍽️",
    "Review your subscriptions monthly. Cancel what you don't use.",
    "Use the 50/30/20 rule: Needs / Wants / Savings.",
    "Involve the kids! Teaching money early builds their confidence too.",
    "Batch your errands to save petrol money ⛽",
    "A no-spend weekend can be a fun family challenge!",
    "Celebrate your wins! Every saved dollar is a step forward 🎉",
    "Buy in bulk for items you use regularly — nappies, toilet paper, pasta.",
    "Check if your utility bills can be reduced with a simple phone call.",
    "Start an emergency fund — aim for 3 months of expenses.",
    "Round up your purchases and save the difference 🪙",
    "Swap brand-name for supermarket-own brands — same quality, less cost!",
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF26A69A).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.lightbulb_rounded,
                  color: Color(0xFF26A69A),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "Rebecca's Tip",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white70 : Colors.black54,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            tip,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 1.4,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
