import 'package:flutter/material.dart';
import 'package:taskati/core/constants/app_colors.dart';

void showErrorSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.errorColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10)
      ),
        behavior: SnackBarBehavior.floating,
      content: Text(message),
      ),
      );
}
