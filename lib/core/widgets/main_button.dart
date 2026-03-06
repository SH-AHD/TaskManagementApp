import 'package:flutter/material.dart';
import 'package:taskati/core/constants/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.text,
    this.h=50,
    this.w=double.infinity,
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
        minimumSize: Size(w, h),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        
        ),
      ),
      onPressed: onPress,
     child: Text(text,style: TextStyles.font19SemiboldBlack.copyWith(color: AppColors.whiteColor),),
     );
  }
}