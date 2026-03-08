import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/helpers/navigation.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/services/hive_helper.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/core/widgets/custom_text_field.dart';
import 'package:taskati/core/widgets/main_button.dart';
import 'package:taskati/core/widgets/svg_pic.dart';
import 'package:taskati/features/add_edit_task/widgets/date_time_picker.dart';

class AddEditTask extends StatefulWidget {
  const AddEditTask({super.key, this.currentTask});
  final TaskModel? currentTask;
  @override
  State<AddEditTask> createState() => _AddEditTaskState();
}

class _AddEditTaskState extends State<AddEditTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String dateVaule = DateFormat("dd MMM, yyyy").format(DateTime.now());
  String startTimeValue = DateFormat("hh: mm a").format(DateTime.now());
  String endTimeValue = DateFormat(
    "hh: mm a",
  ).format(DateTime.now().add(Duration(hours: 1)));

  @override
  void initState() {
    super.initState();
    if (widget.currentTask != null) {
      titleController.text = widget.currentTask!.title ?? "";
      descriptionController.text = widget.currentTask!.description ?? "";
      dateVaule = widget.currentTask!.date ?? "";
      startTimeValue = widget.currentTask!.startTime ?? "";
      endTimeValue = widget.currentTask!.endTime ?? "";
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: SvgPic(path: AppAssets.arrowleftSvg),
          ),
          title: Text(widget.currentTask != null ? "Edit Task" : "Add Task"),
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 44),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Title", style: TextStyles.font14RegularSecondary),
                Gap(8),
                CustomTextField(
                  controller: titleController,
                  textInputAction: TextInputAction.next,
                ),
                Gap(18),
                Text("Description", style: TextStyles.font14RegularSecondary),
                Gap(8),
                CustomTextField(
                  controller: descriptionController,
                  maxLines: 3,
                  textInputAction: TextInputAction.done,
                ),
                Gap(41),
                DateTimePicker(
                  title: "Date",
                  value: dateVaule,
                  path: AppAssets.calendarSvg,
                  onTap: () async {
                    _selectDate(context);
                  },
                ),
                Gap(24),
                DateTimePicker(
                  title: "Start Time",
                  value: startTimeValue,
                  path: AppAssets.clockSvg,
                  onTap: () async {
                    _selectTime(context, isStartTime: true);
                  },
                ),

                Gap(24),
                DateTimePicker(
                  title: "end Time",
                  value: endTimeValue,
                  path: AppAssets.clockSvg,
                  onTap: () async {
                    _selectTime(context, isStartTime: false);
                  },
                ),
                Gap(24),
              ],
            ),
          ),
        ),

        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 22, right: 22, bottom: 22),
          child: MainButton(
            text: widget.currentTask != null ? "Save" : "Add Task",
            onPress: () {
              if (widget.currentTask != null) {
                HiveHelper.cacheTask(
                  widget.currentTask!.id ?? "",
                  TaskModel(
                    id: widget.currentTask!.id,
                    title: titleController.text,
                    description: descriptionController.text,
                    date: dateVaule,
                    startTime: startTimeValue,
                    endTime: endTimeValue,
                    isCompleted: false,
                  ),
                );
             
              } else {
                String key = DateTime.now().microsecondsSinceEpoch.toString();
                HiveHelper.cacheTask(
                  key,
                  TaskModel(
                    id: key,
                    title: titleController.text,
                    description: descriptionController.text,
                    date: dateVaule,
                    startTime: startTimeValue,
                    endTime: endTimeValue,
                    isCompleted: false,
                  ),
                );
              }
                context.pop();
            },
          ),
        ),
      ),
    );
  }

  Future<void> _selectTime(
    BuildContext context, {
    required bool isStartTime,
  }) async {
    FocusScope.of(context).unfocus();
    var selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime != null) {
      if (isStartTime) {
        setState(() {
          startTimeValue = selectedTime.format(context);
        });
      } else {
        setState(() {
          endTimeValue = selectedTime.format(context);
        });
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    {
      FocusScope.of(context).unfocus();
      var selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 30)),
        lastDate: DateTime(2030),
      );
      if (selectedDate != null) {
        setState(() {
          dateVaule = DateFormat("dd MMM, yyyy").format(selectedDate);
        });
      }
    }
  }
}
