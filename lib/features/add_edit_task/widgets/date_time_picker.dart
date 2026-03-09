import 'package:flutter/material.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/helpers/theme.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/core/widgets/svg_pic.dart';

class DateTimePicker extends StatelessWidget {
  const DateTimePicker({
    super.key, required this.title, required this.value, required this.path, required this.onTap,
  });

final String title;
final String value;
final String path;
final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
       decoration: BoxDecoration(
         color: context.cardColor,
         borderRadius: BorderRadius.circular(15),
             boxShadow: [
               BoxShadow(
                 color: Colors.black12,
                 blurRadius: 32,
                 offset: const Offset(0, 4),
               ),
             ],
       ),
        child: ListTile(
         leading: SvgPic(path:path),
         title: Text(title, style:TextStyles.font11RegularSecondary ,),
         subtitle:Text(value, style:TextStyles.font14RegularSecondary.copyWith(color:context.iconColor) ,),
            trailing: SvgPic(path: AppAssets.arrowDownSvg, color: context.iconColor,),
            
        ),
      ),
    );
  }
}