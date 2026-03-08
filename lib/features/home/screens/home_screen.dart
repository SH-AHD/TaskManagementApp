import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskati/core/constants/app_colors.dart';
import 'package:taskati/core/helpers/navigation.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/services/hive_helper.dart';
import 'package:taskati/core/services/shared_pref.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/features/add_edit_task/screens/add_edit_task_screen.dart';
import 'package:taskati/features/home/widgets/daily_progress.dart';
import 'package:taskati/features/home/widgets/header.dart';
import 'package:taskati/features/home/widgets/tasks_builder.dart';
import 'package:taskati/features/home/widgets/tasks_date_picker.dart';
import 'package:taskati/features/home/widgets/tasks_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = '';
  String img = '';
  int _currentIndex=0;
  DateTime selectedDate=DateTime.now();
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
              HomeDatePicker(onChange: (date) {
          setState(() {
           selectedDate = date;
          });
        },),
              Gap(23),
             Expanded(
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              physics: const NeverScrollableScrollPhysics(),
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },

              dividerColor: Colors.transparent,
              dividerHeight: 0,
              indicatorWeight: 0,
              indicator: BoxDecoration(),
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: AppColors.primaryColor,
              labelStyle: TextStyles.font14RegularSecondary.copyWith(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w600,
              ),
              labelPadding: const EdgeInsets.symmetric(horizontal: 5),

              tabs: [
                StatusTab(isSelected: _currentIndex == 0, title: "All"),
                StatusTab(isSelected: _currentIndex == 1, title: "In Progress"),
                StatusTab(isSelected: _currentIndex == 2, title: "Completed"),
              ],
            ),
            Gap(20),
            Expanded(
              child: ValueListenableBuilder<Box<TaskModel>>(
                valueListenable: HiveHelper.tasksBox.listenable(),
                builder: (context, box, child) {
                  List<TaskModel> dailyTasks = [];
                  List<TaskModel> inProgressTasks = [];
                  List<TaskModel> completedTasks = [];
                  var formattedDate = DateFormat(
                    "dd MMM, yyyy",
                  ).format(selectedDate);
                  for (var task in box.values) {
                    if (task.date == formattedDate) {
                      dailyTasks.add(task);
                      if (task.isCompleted) {
                        completedTasks.add(task);
                      } else {
                        inProgressTasks.add(task);
                      }
                    }
                  }

                  return TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      dailyTasks.isEmpty
                          ? Center(
                              child: Text(
                                "No tasks added yet!",
                                style: TextStyles.font19SemiboldBlack,
                              ),
                            )
                          : TasksListView(
                            key: ValueKey('all_${dailyTasks.length}'),
                            tasks: dailyTasks),
                      inProgressTasks.isEmpty
                          ? Center(
                              child: Text(
                                "No tasks in progress!",
                                style: TextStyles.font19SemiboldBlack,
                              ),
                            )
                          : TasksListView(
                            key: ValueKey('progress_${inProgressTasks.length}'),
                            tasks: inProgressTasks),
                      completedTasks.isEmpty
                          ? Center(
                              child: Text(
                                "No tasks have been completed yet!",
                                maxLines: 2,
                                style: TextStyles.font19SemiboldBlack.copyWith(fontSize: 17),
                              ),
                            )
                          : TasksListView(
                            key: ValueKey('done_${completedTasks.length}'),
                            tasks: completedTasks),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(AddEditTask());
        },
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add, color: AppColors.whiteColor),
      ),
    );
  }
}
