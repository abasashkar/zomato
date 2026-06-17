import 'package:flutter/material.dart';
import 'package:zomato/core/theme/app_colours.dart';


class AppTextStyles {
  AppTextStyles._();

  static const _font = 'Roboto'; // or your custom font

  static TextStyle get locationLabel => const TextStyle(
        fontFamily: _font,
        fontSize: 12,
        color: AppColors.textOnPrimary,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get locationValue => const TextStyle(
        fontFamily: _font,
        fontSize: 16,
        color: AppColors.textOnPrimary,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get sectionTitle => const TextStyle(
        fontFamily: _font,
        fontSize: 18,
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get categoryLabel => const TextStyle(
        fontFamily: _font,
        fontSize: 12,
        color: AppColors.textSecondary,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get restaurantName => const TextStyle(
        fontFamily: _font,
        fontSize: 16,
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get restaurantMeta => const TextStyle(
        fontFamily: _font,
        fontSize: 13,
        color: AppColors.textSecondary,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get rating => const TextStyle(
        fontFamily: _font,
        fontSize: 12,
        color: AppColors.textOnPrimary,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get offerTag => const TextStyle(
        fontFamily: _font,
        fontSize: 11,
        color: AppColors.offerOrange,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get promoTitle => const TextStyle(
        fontFamily: _font,
        fontSize: 15,
        color: AppColors.promoText,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get promoSubtitle => const TextStyle(
        fontFamily: _font,
        fontSize: 13,
        color: AppColors.textSecondary,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get navLabel => const TextStyle(
        fontFamily: _font,
        fontSize: 11,
        fontWeight: FontWeight.w500,
      );
}