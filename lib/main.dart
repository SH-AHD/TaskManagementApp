import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/constants/app_colors.dart';
import 'package:taskati/core/services/shared_pref.dart';
import 'package:taskati/core/styles/theming.dart';
import 'package:taskati/features/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme(),
      builder:(context, child) {
        return SafeArea(
          top: false,
          bottom: Platform.isAndroid,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                color: AppColors.whiteColor,

                ),
              ),
              Image.asset(AppAssets.bg,
               width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,),
              child!,
            ],
          ),
        );
      },
      home: const SplashScreen(),
    );
  }
}
