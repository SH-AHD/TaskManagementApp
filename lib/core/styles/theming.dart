import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskati/core/constants/app_colors.dart';
import 'package:taskati/core/constants/app_fonts.dart';
import 'package:taskati/core/styles/text_styles.dart';

class AppThemes {
  static ThemeData lightTheme() => ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    fontFamily: AppFonts.lexend,
    colorScheme: ColorScheme.fromSeed(
      onSurface: AppColors.blackColor,
      seedColor: AppColors.primaryColor,
      tertiaryContainer: AppColors.accentColor,
    ),
datePickerTheme: DatePickerThemeData(
  backgroundColor: AppColors.accentColor,
),
  
          timePickerTheme: TimePickerThemeData(
  backgroundColor: AppColors.accentColor,
  dialBackgroundColor: AppColors.accentColor,
  hourMinuteColor: AppColors.primaryColor,
  hourMinuteTextColor: AppColors.blackColor,
  dialHandColor: AppColors.primaryColor,
  dayPeriodColor: AppColors.primaryColor,
  dayPeriodTextColor: AppColors.blackColor,
),
    cardColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      centerTitle: true,
      titleTextStyle: TextStyles.font19Semibold.copyWith(
        fontFamily: AppFonts.lexend,
        color: AppColors.blackColor,
      ),
      foregroundColor: AppColors.blackColor,
    ),
    iconTheme: IconThemeData(color: AppColors.blackColor),
    tabBarTheme: TabBarThemeData(
      dividerColor: Colors.transparent,
      dividerHeight: 0,

      unselectedLabelColor: AppColors.primaryColor,
      labelStyle: TextStyles.font14RegularSecondary.copyWith(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w600,
      ),
      labelPadding: const EdgeInsets.symmetric(horizontal: 5),
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
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: AppColors.whiteColor),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
    ),
  );

  static ThemeData darkTheme() => ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    fontFamily: AppFonts.lexend,
    colorScheme: ColorScheme.fromSeed(
      onSurface: AppColors.whiteColor,
      seedColor: AppColors.primaryColor,
      tertiaryContainer: AppColors.blackColor,
    ),
    iconTheme: IconThemeData(color: AppColors.whiteColor),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      centerTitle: true,
      titleTextStyle: TextStyles.font19Semibold.copyWith(
        fontFamily: AppFonts.lexend,
        color: AppColors.whiteColor,
      ),
      foregroundColor: AppColors.whiteColor,
    ),
    datePickerTheme: DatePickerThemeData(
  backgroundColor: AppColors.blackColor,
  headerBackgroundColor: AppColors.primaryColor,
  headerForegroundColor: AppColors.whiteColor,
),
  
      timePickerTheme: TimePickerThemeData(
  backgroundColor: AppColors.blackColor,
  dialBackgroundColor: AppColors.blackColor,
  hourMinuteColor: AppColors.primaryColor,
  hourMinuteTextColor: AppColors.accentColor,
  dialHandColor: AppColors.primaryColor,
  dayPeriodColor: AppColors.primaryColor,
  dayPeriodTextColor: AppColors.accentColor,
),
    cardColor: AppColors.blackColor,
    tabBarTheme: TabBarThemeData(
      dividerColor: Colors.transparent,
      dividerHeight: 0,
      unselectedLabelColor: AppColors.primaryColor,
      labelStyle: TextStyles.font14RegularSecondary.copyWith(
        color: AppColors.blackColor,
        fontWeight: FontWeight.w600,
      ),
      labelPadding: const EdgeInsets.symmetric(horizontal: 5),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.blackColor,
      filled: true,
      hintStyle: TextStyles.font14RegularSecondary,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: AppColors.blackColor),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
    ),
  );
}
