import 'package:flutter/material.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/helpers/navigation.dart';
import 'package:taskati/core/widgets/svg_pic.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(onPressed: (){
context.pop();
        }, icon:SvgPic(path: AppAssets.arrowleftSvg),),
     title: Text("Add Task"),
      ),
    );
  }
}