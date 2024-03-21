// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati_8_3/core/services/local_storage.dart';
import 'package:taskati_8_3/core/themes/app_themes.dart';
import 'package:taskati_8_3/features/Home_screen/presentation/view/splash.dart';
import 'package:taskati_8_3/features/add_task/data/task_model.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter<TaskModel>(TaskModelAdapter());
  await Hive.openBox('user');
  await Hive.openBox<TaskModel>('task');
  AppLocalStorage.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

 

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: SplashView(),
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
    );
  }
}
