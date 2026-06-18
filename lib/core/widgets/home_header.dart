import 'package:flutter/material.dart';
import 'package:zomato/core/theme/app_colours.dart';
import 'package:zomato/core/theme/app_sizes.dart';
import 'package:zomato/core/theme/app_text_style.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.location,
    required this.onLocationTap,
    required this.onSearchChanged,
    this.onNotificationTap,
    this.searchController,
  });

  final String location;
  final VoidCallback onLocationTap;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback? onNotificationTap;
  final TextEditingController? searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.primary, AppColors.headerGradientEnd],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppSizes.radiusXl),
          bottomRight: Radius.circular(AppSizes.radiusXl),
        ),
      ),
      padding: EdgeInsets.fromLTRB(
        AppSizes.lg,
        MediaQuery.of(context).padding.top + AppSizes.md,
        AppSizes.lg,
        AppSizes.xl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: onLocationTap,
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on,
                          color: AppColors.textOnPrimary, size: AppSizes.iconMd),
                      const SizedBox(width: AppSizes.sm),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Delivering to', style: AppTextStyles.locationLabel),
                          Row(
                            children: [
                              Text(location, style: AppTextStyles.locationValue),
                              const Icon(Icons.keyboard_arrow_down,
                                  color: AppColors.textOnPrimary, size: 20),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  IconButton(
                    onPressed: onNotificationTap,
                    icon: const Icon(Icons.notifications_none,
                        color: AppColors.textOnPrimary),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.notificationBadge,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppSizes.lg),
          SizedBox(
            height: AppSizes.searchBarHeight,
            child: TextField(
              controller: searchController,
              onChanged: onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Search restaurants, dishes...',
                prefixIcon: const Icon(Icons.search, color: AppColors.textHint),
                filled: true,
                fillColor: AppColors.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}