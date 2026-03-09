import 'package:flutter/material.dart';
import 'package:taskati/core/constants/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';

class TabButton extends StatelessWidget {
  const TabButton({
    super.key,
    required this.text,
    this.h=35,
    this.w=50,
    required this.onPress,
  });
final String text;
final double h;
final double w;
final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accentColor,
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        )
      ),
      onPressed:onPress,
     child: Text(text,style: TextStyles.font14Medium.copyWith(
    color: AppColors.primaryColor,
     ),),
     );
  }
}