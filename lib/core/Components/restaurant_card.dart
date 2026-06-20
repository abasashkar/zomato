import 'package:flutter/material.dart';
import 'package:zomato/core/theme/app_colours.dart';
import 'package:zomato/core/theme/app_sizes.dart';
import 'package:zomato/core/theme/app_text_style.dart';


class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.name,
    required this.cuisine,
    required this.rating,
    required this.deliveryTime,
    this.deliveryFee = 'Free delivery',
    this.offerText,
    this.imageEmoji = '🍕',
    this.imageBgColor = AppColors.categoryPizza,
    this.onTap,
  });

  final String name;
  final String cuisine;
  final double rating;
  final String deliveryTime;
  final String deliveryFee;
  final String? offerText;
  final String imageEmoji;
  final Color imageBgColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: AppSizes.lg,
          vertical: AppSizes.sm,
        ),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
          boxShadow: const [
            BoxShadow(color: AppColors.shadow, blurRadius: 8, offset: Offset(0, 2)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image placeholder
            Container(
              height: AppSizes.restaurantImageHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                color: imageBgColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppSizes.radiusLg),
                ),
              ),
              alignment: Alignment.center,
              child: Text(imageEmoji, style: const TextStyle(fontSize: 64)),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text(name, style: AppTextStyles.restaurantName)),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.sm,
                          vertical: AppSizes.xs,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.ratingGreen,
                          borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(rating.toStringAsFixed(1), style: AppTextStyles.rating),
                            const SizedBox(width: 2),
                            const Icon(Icons.star, color: AppColors.textOnPrimary, size: 12),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.xs),
                  Text(cuisine, style: AppTextStyles.restaurantMeta),
                  const SizedBox(height: AppSizes.sm),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 14, color: AppColors.textSecondary),
                      const SizedBox(width: 4),
                      Text(deliveryTime, style: AppTextStyles.restaurantMeta),
                      const Text('  ·  ', style: TextStyle(color: AppColors.textSecondary)),
                      Text(deliveryFee, style: AppTextStyles.restaurantMeta),
                    ],
                  ),
                  if (offerText != null) ...[
                    const SizedBox(height: AppSizes.md),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.sm,
                        vertical: AppSizes.xs,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.offerBg,
                        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                      ),
                      child: Text(offerText!, style: AppTextStyles.offerTag),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
