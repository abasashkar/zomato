import 'package:flutter/material.dart';
import 'package:zomato/core/theme/app_sizes.dart';
import 'package:zomato/core/theme/app_text_style.dart';


class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.label,
    required this.emoji,
    required this.backgroundColor,
    this.onTap,
  });

  final String label;
  final String emoji;
  final Color backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 80,
        child: Column(
          children: [
            Container(
              width: AppSizes.categoryTileSize,
              height: AppSizes.categoryTileSize,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(AppSizes.radiusMd),
              ),
              alignment: Alignment.center,
              child: Text(emoji, style: const TextStyle(fontSize: 32)),
            ),
            const SizedBox(height: AppSizes.sm),
            Text(label, style: AppTextStyles.categoryLabel, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}