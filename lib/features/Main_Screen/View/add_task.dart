// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:taskati_8_3/core/Utils/app_colors.dart';
import 'package:taskati_8_3/core/Utils/text_style.dart';
import 'package:taskati_8_3/core/Widgets/custom_local_button.dart';

class AddTaskView extends StatefulWidget {
  AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.primary,
                )),
            centerTitle: true,
            title: Text(
              'Add Task',
              style: getTitleFont(),
            ),
          )),
      body:
       Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Title',
                style: getBodyFont(colors: AppColors.black),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter Title Here'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Note',
                style: getBodyFont(colors: AppColors.black),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter Note Here'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Date',
                style: getBodyFont(colors: AppColors.black),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: '12/12/2025'),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start Time',
                        style: getBodyFont(colors: AppColors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: '02:00 AM',
                            suffixIcon: Icon(
                              Icons.access_time,
                              color: AppColors.grey,
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'End Time',
                        style: getBodyFont(colors: AppColors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: '04:00 AM',
                            suffixIcon: Icon(
                              Icons.access_time,
                              color: AppColors.grey,
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Colors',
                        style: getBodyFont(colors: AppColors.black),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColors.primary,
                          ),
                          SizedBox(width: 3,),
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColors.pink,
                          ),
                          SizedBox(width: 3,),
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColors.orange,
                          )
                        ],
                      )
                    ],
                  ),
                  //create task
                  CustomLocalButtom(
                    text: 'Create Task',
                    onpressed: () {},
                    width: 120,
                  ),
                ],
              )
            ]),
          ),
        ),
      
    );
  }
}
