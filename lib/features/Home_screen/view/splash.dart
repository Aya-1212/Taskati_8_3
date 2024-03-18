// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati_8_3/core/Constants/assets_icons.dart';
import 'package:taskati_8_3/core/Functions/routing.dart';
import 'package:taskati_8_3/core/Utils/text_style.dart';
import 'package:taskati_8_3/features/Home_screen/view/upload_view.dart';
import 'package:taskati_8_3/features/Main_Screen/View/main_view.dart';

class SplashView extends StatefulWidget {
  SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  var box = Hive.box('user');
 
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 8),
      () {
        pushWithReplacement(context,
            ((box.get('isUpload')?? false) ) ? MainView() : UploadView());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AssetsIcons.logo),
          Text(
            'Taskati',
            style: getTitleFont(),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'It\'s Time to Get Organized',
            style: getSmallFont(),
          ),
        ],
      )),
    );
  }
}
