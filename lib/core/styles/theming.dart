import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskati/core/constants/app_colors.dart';
import 'package:taskati/core/constants/app_fonts.dart';
import 'package:taskati/core/styles/text_styles.dart';

class AppThemes {
  static ThemeData lightTheme() => ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    fontFamily: AppFonts.lexend,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      centerTitle: true,
      titleTextStyle: TextStyles.font19SemiboldBlack.copyWith(
        fontFamily: AppFonts.lexend,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.whiteColor,
      filled: true,
      hintStyle: TextStyles.font14RegularSecondary,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
  enabledBorder: OutlineInputBorder(
    borderRadius:BorderRadius.circular(15),
    borderSide: BorderSide(color: AppColors.whiteColor)
      ),

  focusedBorder: OutlineInputBorder(
    borderRadius:BorderRadius.circular(15),
    borderSide: BorderSide(color:AppColors.primaryColor,)
      ),

    ),
  );
}
