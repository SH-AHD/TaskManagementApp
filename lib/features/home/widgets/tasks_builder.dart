import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/constants/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/core/widgets/svg_pic.dart';
import 'package:taskati/features/home/widgets/tasks_list_view.dart';

class TasksBuilder extends StatefulWidget {
  const TasksBuilder({super.key});

  @override
  State<TasksBuilder> createState() => _TasksBuilderState();
}

class _TasksBuilderState extends State<TasksBuilder> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                StatusTab(isSelected: _currentIndex == 1, title: "On Progress"),
                StatusTab(isSelected: _currentIndex == 2, title: "Completed"),
              ],
            ),
            Gap(20),
            Expanded(
              child: TabBarView(
                children: [
                  TasksListView(),
                   TasksListView(),
                   TasksListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatusTab extends StatelessWidget {
  const StatusTab({super.key, required this.isSelected, required this.title});
  final bool isSelected;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.all(0),
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? AppColors.primaryColor : AppColors.accentColor,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyles.font14MediumPrimary.copyWith(
              color: isSelected ? AppColors.whiteColor : AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
