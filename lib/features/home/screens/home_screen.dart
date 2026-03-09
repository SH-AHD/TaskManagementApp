import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
  DateTime selectedDate = DateTime.now();
  String name = '';
  String img = '';
  int _currentIndex = 0;
  // DateTime selectedDate = DateTime.now();
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
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                Header(),
                Gap(23),
                DailyProgress(),
                Gap(29),
                HomeDatePicker(
                  onChange: (date) {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                ),
                Gap(23),
                TabBar(
                  indicator: BoxDecoration(),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 0.01,
                  physics: const NeverScrollableScrollPhysics(),
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  tabs: [
                    StatusTab(isSelected: _currentIndex == 0, title: "All"),
                    StatusTab(
                      isSelected: _currentIndex == 1,
                      title: "In Progress",
                    ),
                    StatusTab(
                      isSelected: _currentIndex == 2,
                      title: "Completed",
                    ),
                  ],
                ),
                Gap(12),
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
                        key: ValueKey('${formattedDate}_${box.length}'),

                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          _buildTaskPage(
                            dailyTasks,
                            "No tasks added yet!",
                            'all_${dailyTasks.length}',
                          ),
                          _buildTaskPage(
                            inProgressTasks,
                            "No tasks in progress!",
                            'prog_${inProgressTasks.length}',
                          ),
                          _buildTaskPage(
                            completedTasks,
                            "No tasks completed yet!",
                            'done_${completedTasks.length}',
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(AddEditTaskScreen());
        },
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add, color: AppColors.whiteColor),
      ),
    );
  }
}

Widget _buildTaskPage(List<TaskModel> tasks, String emptyMsg, String listKey) {
  if (tasks.isEmpty) {
    return Center(child: Text(emptyMsg, style: TextStyles.font19Semibold));
  }
  return TasksListView(key: ValueKey(listKey), tasks: tasks);
}
