import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/constants/app_colors.dart';
import 'package:taskati/core/helpers/navigation.dart';
import 'package:taskati/core/helpers/theme.dart';
import 'package:taskati/core/services/shared_pref.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/features/complete_profile/screens/complete_and_edit_profile_screen.dart';

class Header extends StatelessWidget {
  const Header({super.key, });


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: SharedPref.imgNotifier,
          builder: (context, img, child) {
            return GestureDetector(
              onTap: () {
                context.push(
                  CompleteAndEditProfileScreen(
                    name: SharedPref.nameNotifier.value,
                    path: img,
                  ),
                );
              },
              child: CircleAvatar(
                backgroundImage:
                   (img.isNotEmpty && File(img).existsSync())
      ? FileImage(File(img))
                    : const AssetImage(AppAssets.user) as ImageProvider,
              ),
            );
          },
        ),
        Gap(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello!",
                style: TextStyles.font14RegularSecondary.copyWith(
                  // color: AppColors.blackColor,
                ),
              ),
              ValueListenableBuilder(
                valueListenable: SharedPref.nameNotifier,
                builder: (context, name, child) {
                  return Text(name, style: TextStyles.font19Semibold);
                },
              ),
            ],
          ),
        ),

        IconButton(
          onPressed: () {
            SharedPref.setDarkMode(!context.isDark);
           
          },
          icon: Icon(
            context.isDark
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined,
            color: context.isDark ? AppColors.whiteColor : AppColors.blackColor,
          ),
        ),
      ],
    );
  }
}
