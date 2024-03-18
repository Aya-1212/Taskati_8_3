// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import 'package:taskati_8_3/core/Functions/routing.dart';
import 'package:taskati_8_3/core/Widgets/custom_local_button.dart';
import 'package:taskati_8_3/features/Main_Screen/View/add_task.dart';
import 'package:taskati_8_3/features/Main_Screen/widgets/Custom_header.dart';

class MainView extends StatefulWidget {
  MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
        children: [
          CustomHeader(),
          SizedBox(
            height: 15,
          ),
          Row(children: [
            Spacer(),
            CustomLocalButtom(onpressed: () {
              pushTo(context, AddTaskView());
            },text: '+ Add Task'),
          ])
          
        ],
                ),
              ),
      ),
    );
  }
}

