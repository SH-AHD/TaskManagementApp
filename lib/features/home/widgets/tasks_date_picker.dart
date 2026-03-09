import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:taskati/core/constants/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';

class HomeDatePicker extends StatefulWidget {
  const HomeDatePicker({super.key, required this.onChange});
final void Function(DateTime)? onChange;
  @override
  State<HomeDatePicker> createState() => _HomeDatePickerState();
}

class _HomeDatePickerState extends State<HomeDatePicker> {
  final DatePickerController _controller = DatePickerController();


  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1),(){
    _controller.jumpToSelection();

    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return   DatePicker(
        DateTime.now().subtract(const Duration(days: 30)),
        height: 90,
        width: 64,
        initialSelectedDate: DateTime.now(),
        selectionColor: AppColors.primaryColor,
        dateTextStyle: TextStyles.font12Medium,
        monthTextStyle:  TextStyles.font12Medium,
        dayTextStyle:  TextStyles.font12Medium,
        selectedTextColor: Colors.white,
         controller: _controller,
        onDateChange: widget.onChange,
      );
       
  }
}