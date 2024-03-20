// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati_8_3/core/Functions/routing.dart';
import 'package:taskati_8_3/core/Utils/app_colors.dart';
import 'package:taskati_8_3/core/Utils/text_style.dart';
import 'package:taskati_8_3/core/Widgets/custom_local_button.dart';
import 'package:taskati_8_3/features/Main_Screen/presentation/View/main_view.dart';

class AddTaskView extends StatefulWidget {
  AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    String date = DateFormat('dd/MM/yyyy').format(DateTime.now());
    String startTime = DateFormat('hh:mm a').format(DateTime.now());
    String endTime =
        DateFormat('hh:mm a').format(DateTime.now().add(Duration(hours: 2)));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //__________________AppBar___________________________
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
      //__________________Body___________________________
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //__________________Text___________________________
          Text(
            'Title',
            style: getBodyFont(colors: AppColors.black),
          ),

          Gap(10),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Enter Title Here',
                hintStyle: getSmallFont(colors: AppColors.black)),
          ),
          Gap(10),
          //__________________Note___________________________
          Text(
            'Note',
            style: getBodyFont(colors: AppColors.black),
          ),
          Gap(10),
          TextFormField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Enter Note Here',
              hintStyle: getSmallFont(colors: AppColors.black),
            ),
          ),
          Gap(10),
          //__________________Date___________________________
          Text(
            'Date',
            style: getBodyFont(colors: AppColors.black),
          ),
          Gap(10),
          TextFormField(
            readOnly: true,
            decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.calendar_today_outlined,
                  color: AppColors.grey,
                ),
                hintText: date,
                hintStyle: getSmallFont(colors: AppColors.black)),
            onTap: () {
              showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2025),
                      initialDate: DateTime.now())
                  .then((value) {
                if (value != null) {
                  setState(() {
                    date = DateFormat('dd/MM/yyyy').format(value);
                  });
                }
              });
            },
          ),
          Gap(10),

          //___________________________Start&End_____________________________________________
          Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //__________________StartDate___________________________
                  Text(
                    'Start Time',
                    style: getBodyFont(colors: AppColors.black),
                  ),
                  Gap(10),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                        hintStyle: getSmallFont(colors: AppColors.black),
                        hintText: startTime,
                        suffixIcon: Icon(
                          Icons.access_time,
                          color: AppColors.grey,
                        )),
                    onTap: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((value) {
                        if (value != null) {
                          setState(() {
                            startTime = value.format(context);
                          });
                        }
                      });
                    },
                  ),
                  Gap(10),
                ],
              )),
              Gap(15),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //__________________EndDate___________________________
                  Text(
                    'End Time',
                    style: getBodyFont(colors: AppColors.black),
                  ),
                  Gap(10),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                        hintStyle: getSmallFont(colors: AppColors.black),
                        hintText: endTime,
                        suffixIcon: Icon(
                          Icons.access_time,
                          color: AppColors.grey,
                        )),
                    onTap: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((value) {
                        if (value != null) {
                          setState(() {
                            endTime = value.format(context);
                          });
                        }
                      });
                    },
                  ),
                  Gap(10),
                ],
              ))
            ],
          ),
          Gap(10),
          //__________________Color&Buttom___________________________
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //__________________Colors___________________________
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Colors',
                    style: getBodyFont(colors: AppColors.black),
                  ),
                  Row(
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: EdgeInsets.all(3),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: CircleAvatar(
                              radius: 17.5,
                              backgroundColor: (index == 0)
                                  ? AppColors.primary
                                  : (index == 1)
                                      ? AppColors.pink
                                      : AppColors.orange,
                              child: (index == selectedIndex)
                                  ? Icon(
                                      Icons.check,
                                      color: AppColors.white,
                                    )
                                  : SizedBox()),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //__________________CreateButtom___________________________
              CustomLocalButtom(
                text: 'Create Task',
                onpressed: () {
                  pushWithReplacement(context, MainView());
                },
                width: 110,
              ),
            ],
          )

          //end raw colors&butto,
        ]),
      ),
    );
  }
}
