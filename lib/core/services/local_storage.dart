import 'package:hive/hive.dart';
import 'package:taskati_8_3/features/add%20task/data/model/task_model.dart';


class AppLocalStorage {
  static late Box userBox;
  static late Box taskBox ;
 //__________init________________
  static init (){
     userBox = Hive.box('user');
     taskBox = Hive.box<TaskModel>('task');
  }
   //_____________user____________
  static cacheUserData (key,value){
    userBox.put(key, value);
  }
  static getUserData (key){
    return userBox.get(key);
  }
  //______________task______________
  static cacheTaskData (key,TaskModel value){
    taskBox.put(key, value);
  }
  static TaskModel getTaskData (key){
    return taskBox.get(key);
  }
  }
  
