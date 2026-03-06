import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/constants/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/core/widgets/svg_pic.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(7),
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.whiteColor,
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
                "Title of the Task",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.font14MediumPrimary.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                ),
              ),
              Gap(3),
              Text(
                "Discription of the Task ",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.font12RegularSecondary.copyWith(
                  fontWeight: FontWeight.w500,
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
                        "10 PM - 12 AM",
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
                        color: AppColors.accentColor,
                      
                      ),
                          child: Text(
                        "In Progress",
                        style: TextStyles.font12RegularSecondary
                            .copyWith(
                              color: AppColors.primaryColor,
                            ),
                      ),
                     
                    ),
                  ),
                ],
              ),
         
         
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 10);
      },
      itemCount: 5,
    );
  }
}
