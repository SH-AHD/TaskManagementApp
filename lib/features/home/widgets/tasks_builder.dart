import 'package:flutter/material.dart';
import 'package:taskati/core/constants/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';

class StatusTab extends StatelessWidget {
  const StatusTab({super.key, required this.isSelected, required this.title});
  final bool isSelected;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.all(0),
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? AppColors.primaryColor : AppColors.accentColor,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyles.font14MediumPrimary.copyWith(
              color: isSelected ? AppColors.whiteColor : AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}

