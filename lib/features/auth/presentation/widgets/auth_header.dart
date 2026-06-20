import 'package:flutter/material.dart';
import 'package:zomato/core/theme/app_sizes.dart';
import 'package:zomato/core/theme/app_text_style.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          '🍅',
          style: TextStyle(fontSize: 70),
        ),
        const SizedBox(height: AppSizes.md),
        Text(
          title,
          style: AppTextStyles.authTitle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSizes.sm),
        Text(
          subtitle,
          style: AppTextStyles.authSubtitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}