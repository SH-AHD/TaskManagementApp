import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskati/core/constants/app_colors.dart';
import 'package:taskati/core/services/shared_pref.dart';
import 'package:taskati/features/home/widgets/daily_progress.dart';
import 'package:taskati/features/home/widgets/header.dart';
import 'package:taskati/features/home/widgets/tasks_builder.dart';
import 'package:taskati/features/home/widgets/tasks_date_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = '';
  String img = '';
  @override
  void initState() {
    super.initState();
    getUsrData();
  }

  Future<void> getUsrData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString(SharedPref.nameKey) ?? "";
      img = prefs.getString(SharedPref.imgKey) ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Header(img: img, name: name),
              Gap(23),
              DailyProgress(),
              Gap(29),
              HomeDatePicker(),
              Gap(23),
              TasksBuilder(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},
      backgroundColor: AppColors.primaryColor,
      child: Icon(Icons.add, color: AppColors.whiteColor,),
      ),
    );
  }
}
