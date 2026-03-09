
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:taskati/core/helpers/navigation.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/services/hive_helper.dart';
import 'package:taskati/features/add_edit_task/screens/add_edit_task_screen.dart';
import 'package:taskati/features/home/widgets/task_card.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({super.key, required this.tasks});
  final List<TaskModel> tasks;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        TaskModel task = tasks[index];
        return Slidable(
          key:UniqueKey(),
          
            startActionPane: ActionPane(
     motion: const ScrollMotion(),

    
    dismissible: DismissiblePane(
      onDismissed: () {
 HiveHelper.deleteTask(task.id??"");

// log('Box size after delete: ${HiveHelper.tasksBox.length}');
    }),
     children:  [
    SlidableAction(
        onPressed: (context){
 HiveHelper.deleteTask(task.id??"");
        },
        backgroundColor: Color(0xFFFE4A49),
        foregroundColor: Colors.white,
        icon: Icons.delete,
        label: 'Delete',
      ),
    ],
  ),

 endActionPane:  ActionPane(
    motion: ScrollMotion(),
    children: [
      SlidableAction(
      flex: 2,
        onPressed: (context){
          HiveHelper.cacheTask(task.id??"", task.copyWith(isCompleted: true));

        },
        backgroundColor: Colors.green[300]!,
        foregroundColor: Colors.white,
        icon: Icons.check,
        label: 'Complete',
      ),
      SlidableAction(
        onPressed: (context){
context.push(AddEditTaskScreen(currentTask: task,));
        },
        backgroundColor: Colors.yellow[300]!,
        foregroundColor: Colors.white,
        icon: Icons.edit,
        label: 'edit',
      ),
    ],
  ),
          child: TaskCard(task: task),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 10);
      },
      itemCount: tasks.length,
    );
  }
}
