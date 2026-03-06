import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/constants/app_colors.dart';
import 'package:taskati/core/helpers/navigation.dart';
import 'package:taskati/core/services/shared_pref.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/core/widgets/custom_text_field.dart';
import 'package:taskati/core/widgets/dialogs.dart';
import 'package:taskati/core/widgets/main_button.dart';
import 'package:taskati/core/widgets/svg_pic.dart';
import 'package:taskati/core/widgets/tab_button.dart';
import 'package:taskati/features/home/screens/home_screen.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  String? path;
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Complete Your Profile")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentGeometry.topLeft,
                child: Text(
                  "Profile Image",
                  style: TextStyles.font12RegularSecondary,
                ),
              ),
              Gap(21),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 72,
                    backgroundColor: AppColors.iconBgColor,
                    backgroundImage: path != null
                        ? FileImage(File(path!))
                        : AssetImage(AppAssets.user),
                  ),
                  if (path != null)
                    Positioned(
                      right: 5,
                      bottom: 5,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            path = null;
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: AppColors.iconBgColor,
                          child: SvgPic(path: AppAssets.deleteSvg),
                        ),
                      ),
                    ),
                ],
              ),
              Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TabButton(
                    text: "From Camera",
                    onPress: () {
                      uploadImg(ImageSource.camera);
                    },
                  ),
                  Gap(12),
                  TabButton(
                    text: "From Gallery",
                    onPress: () {
                      uploadImg(ImageSource.gallery);
                    },
                  ),
                ],
              ),
              Gap(45),
              Align(
                alignment: AlignmentGeometry.topLeft,
                child: Text(
                  "Your Name",
                  style: TextStyles.font12RegularSecondary,
                ),
              ),
              Gap(21),
              CustomTextField(
                hintText: "Enter Your Name",
                controller: nameController,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 22,right: 22, bottom: 31, top: 10),
        child: MainButton(
          text: "Let's Start !",
          onPress: () async{
            if (nameController.text.isNotEmpty) {
              await SharedPref.setUsrinfo(nameValue: nameController.text, imgValue: path??"");
              await SharedPref.setBool(SharedPref.isCompleteprofile,true);
              context.push(HomeScreen());
            } else {
            showErrorSnackBar(context,  "Enter Your Name");
            }
          },
        ),
      ),
    );
  }

  Future<void> uploadImg(ImageSource source) async {
    var img = await ImagePicker().pickImage(source: source);
    if (img != null) {
      setState(() {
        path = img.path;
      });
    }
  }
}
