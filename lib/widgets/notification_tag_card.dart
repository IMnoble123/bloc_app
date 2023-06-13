

import 'package:flutter/material.dart';
import 'package:ryt_life_cs/utils/app_colors.dart';
import 'package:ryt_life_cs/utils/app_text_style.dart';

class NotificationTageCard extends StatelessWidget {
  const NotificationTageCard({
    super.key,
    required this.title,
    required this.color,
    this.textColor,
    this.verticalPadding,
    this.horizontalPadding,
    this.borderRadius,
  });
  final String title;
  final Color color;
  final Color? textColor;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 20),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 8.0, horizontal: horizontalPadding ?? 12),
          child: Text(
            title,
            style: AppTextStyle.Poppins.copyWith(
              color: textColor ?? AppColors.black300,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
