import 'package:hive_ce/hive.dart';
import 'package:taskati/core/models/task_model.dart';

class HiveHelper {
static late Box<TaskModel> tasksBox;
static const String tasksBoxName='tasks';

static Future<void> init()async{
  tasksBox=await Hive.openBox<TaskModel>(tasksBoxName);
}

static dynamic cacheTask(String key, TaskModel value){
  return tasksBox.put(key, value);
}

static TaskModel? getCachedTask(String key){
return tasksBox.get(key);
}

static List<TaskModel> getCachedTasks(){
return tasksBox.values.toList();
}

  static void deleteTask(String key) {
    tasksBox.delete(key);
  }


}