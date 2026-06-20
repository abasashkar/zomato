import 'package:flutter/material.dart';
import 'package:zomato/core/theme/app_colours.dart';
import 'package:zomato/core/theme/app_sizes.dart';
import 'package:zomato/core/theme/app_text_style.dart';


class PromoBanner extends StatelessWidget {
  const PromoBanner({
    super.key,
    this.title = '50% off first order',
    this.subtitle = 'Use code TOMATO50',
    this.emoji = '🎉',
  });

  final String title;
  final String subtitle;
  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: AppColors.promoBg,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        border: Border.all(color: AppColors.promoBorder),
      ),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(width: AppSizes.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.promoTitle),
                const SizedBox(height: 2),
                Text(subtitle, style: AppTextStyles.promoSubtitle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}