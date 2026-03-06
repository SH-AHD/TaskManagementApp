import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/helpers/navigation.dart';
import 'package:taskati/core/services/shared_pref.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/features/complete_profile/screens/complete_profile_screen.dart';
import 'package:taskati/features/home/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    bool isCompleteprofile =SharedPref.getBool(SharedPref.isCompleteprofile);
  Future.delayed(Duration(seconds: 3),(){
   if(isCompleteprofile){
    if (mounted) {
   context.pushReplacement(const HomeScreen());
    }
   }else{
    if (mounted) {
   context.pushReplacement(const CompleteProfileScreen());
    }
   }

   });
  super.initState();


    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppAssets.logoJson, width: 250),
              Gap(12),
            Text("Taskati", style: TextStyles.font24SemiboldBlack,),
            Gap(18),
            Text("It’s time to get organized", style: TextStyles.font14RegularSecondary,),
          
          ],
        ),
      ),
    );
  }
}