import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati_8_3/core/services/local_storage.dart';
import 'package:taskati_8_3/core/themes/app_themes.dart';
import 'package:taskati_8_3/features/Home_screen/presentation/view/splash.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('user');
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
