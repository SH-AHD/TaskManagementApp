import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:taskati/core/constants/app_colors.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/services/hive_helper.dart';
import 'package:taskati/core/styles/text_styles.dart';

class DailyProgress extends StatelessWidget {
  const DailyProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveHelper.tasksBox.listenable(),
      builder: (context, box, child) {
      List<TaskModel> todayTasks =[];
List<TaskModel> completedTasks =[];

for(var task in box.values){
  if(task.date== DateFormat('dd MMM, yyyy').format(DateTime.now())){
    todayTasks.add(task);
    if(task.isCompleted==true){
      completedTasks.add(task);
    }
  }
}
double completedPercentage= todayTasks.isEmpty?0:(completedTasks.length/todayTasks.length);

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('E, dd MMM').format(DateTime.now()),
                      style: TextStyles.font14RegularSecondary.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    Gap(13),

                    Text(
                      "Your today’s task almost Done!",
                      style: TextStyles.font14RegularSecondary.copyWith(
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(33),
              CircularPercentIndicator(
                radius: 38,
                lineWidth: 8,
                percent:completedPercentage,
                center: Text(
                  "${(completedPercentage * 100).toInt()}%",
                  style: TextStyles.font14RegularSecondary.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.whiteColor,
                  ),
                ),
                reverse: true,
                progressColor: AppColors.whiteColor,
                backgroundColor: Color(0xff8764FF),
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ],
          ),
        );
      },
    );
  }
}
