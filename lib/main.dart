// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati_8_3/core/themes/app_themes.dart';
import 'package:taskati_8_3/features/Home_screen/view/splash.dart';


void main() async{
  await Hive.initFlutter();
   await Hive.openBox('user');
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
