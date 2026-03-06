import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/constants/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.img,
    required this.name,
  });

  final String img;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(backgroundImage: (img.isNotEmpty)
      ? FileImage(File(img)) as ImageProvider
      : const AssetImage(AppAssets.user)),
        Gap(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello!",
              style: TextStyles.font14RegularSecondary.copyWith(
                color: AppColors.blackColor,
              ),
            ),
            Text(name, style: TextStyles.font19SemiboldBlack),
          ],
        ),
      ],
    );
  }
}
