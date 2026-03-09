import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/constants/app_colors.dart';
import 'package:taskati/core/helpers/theme.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/core/widgets/svg_pic.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color:context.cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 32,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.title??"",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.font14Medium.copyWith(
              fontWeight: FontWeight.w600,
          
            ),
          ),
          Gap(3),
          Expanded(
            child: Text(
              task.description??"",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.font12RegularSecondary.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Gap(6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPic(path: AppAssets.clockSvg, w: 20),
                  Gap(4),
                  Text(
                    '${task.startTime?? "-"} - ${task.endTime??"-" }' ,
                    style: TextStyles.font11RegularSecondary,
                  ),
                ],
              ),
              InkWell(
                onTap: (){
        
                },
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                    color: task.isCompleted? Color(0xffFFE9E1):  AppColors.accentColor,
                  
                  ),
                      child: Text(
                   task.isCompleted? "Done": "In Progress",
                    style: TextStyles.font12RegularSecondary
                        .copyWith(
                        color:task.isCompleted?AppColors.orangeColor :   AppColors.primaryColor,
                        ),
                  ),
                 
                ),
              ),
            ],
          ),
     
     
        ],
      ),
    );
  }
}
