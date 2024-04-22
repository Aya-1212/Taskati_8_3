// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati_8_3/core/Constants/assets_icons.dart';
import 'package:taskati_8_3/core/Functions/routing.dart';
import 'package:taskati_8_3/core/Utils/app_colors.dart';
import 'package:taskati_8_3/core/Utils/text_style.dart';
import 'package:taskati_8_3/core/Widgets/custom_local_button.dart';
import 'package:taskati_8_3/features/add%20task/data/model/task_model.dart';
import 'package:taskati_8_3/features/Main_Screen/presentation/widgets/task_item.dart';
import 'package:taskati_8_3/features/Main_Screen/presentation/widgets/custom_header.dart';
import 'package:taskati_8_3/features/add%20task/presentation/view/add_task/add_task.dart';

class MainView extends StatefulWidget {
  MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  DateTime mainView = DateTime.now();
  String selectedDatePicked = DateFormat('dd/MM/yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //body
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              //home header
              const CustomHeader(),
              const Gap(15),
              // bottom add task
              secondLayer(context),
              const Gap(15),
              //date picker
              DatePicker(
                DateTime.now(),
                height: 115,
                selectionColor: AppColors.primary,
                width: 80,
                initialSelectedDate: DateTime.now(),
                onDateChange: (selectedDate) {
                  setState(() {
                    mainView = selectedDate;
                    selectedDatePicked =
                        DateFormat('dd/MM/yyyy').format(selectedDate);
                  });
                },monthTextStyle:getSmallFont(context,) ,
                dateTextStyle:getSmallFont(context,) ,
                dayTextStyle: getSmallFont(context,),
              ),
              const Gap(15),
              //tasks
              Expanded(
                  //Box بتاخد boxes كتير
                  child: ValueListenableBuilder<Box<TaskModel>>(
                // listen علي boxes
                valueListenable: Hive.box<TaskModel>('task').listenable(),
                //                box دا كل التاسكات
                builder: (context, box, child) {
                  List<TaskModel> tasks = [];
                  // هنا بلف علي تاسك تاسك
                  for (var task in box.values) {
                    if (task.date == selectedDatePicked) {
                      tasks.add(task);
                    }
                  }

                  if (tasks.isEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                     Lottie.asset(AssetsIcons.empty,height: 200,width: 200),
                        const Gap(10),
                        Text(
                          'you don\'t have any tasks yet',
                          style: getSmallFont(context,fontSize: 13),
                        ),
                        const Gap(3),
                        Text(
                          'Add new task to make your days productive',
                          style: getSmallFont(context,fontSize: 13),
                        ),
                      ],
                    );
                  } 
                  return ListView.separated(
                    itemCount: tasks.length,
                    separatorBuilder: (context, index) {
                        return  const Gap(10);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        key: UniqueKey(),
                        background: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green[400]),
                          child: Row(
                            children: [
                              Icon(
                                Icons.check,
                                color: AppColors.white,
                              ),
                              const Gap(5),
                              Text(
                                'Complete',
                                style: getSmallFont(context,
                                    colors: AppColors.white, fontSize: 14),
                              )
                            ],
                          ),
                        ),
                        secondaryBackground: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.redAccent),
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete,
                                color: AppColors.white,
                              ),
                              const Gap(5),
                              Text(
                                'Delete',
                                style: getSmallFont(context,
                                    colors: AppColors.white, fontSize: 14),
                              )
                            ],
                          ),
                        ),
                        onDismissed: (direction) {
                          if ( direction == DismissDirection.startToEnd) {
                            box.put(
                                tasks[index].id,
                                TaskModel(
                                    id: tasks[index].id,
                                    title: tasks[index].title,
                                    note: tasks[index].note,
                                    date: tasks[index].date,
                                    startTime: tasks[index].startTime,
                                    endTime: tasks[index].endTime,
                                    color: 3,
                                    isComplete: true));
                          } else {
                            box.delete(tasks[index].id);
                          }
                        },
                        child: TaskItem(
                          model: tasks[index],
                        ),
                      );
                    },
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }

  Row secondLayer(BuildContext context) {
    return Row(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat.yMMMMd().format(mainView),
            style: getBodyFont(context,fontWeight: FontWeight.w600),
          ),
          Text(
            'Today',
            style: getBodyFont(context,fontWeight: FontWeight.w600),
          ),
        ],
      ),
      const Spacer(),
      CustomLocalButtom(
          onpressed: () {
            pushTo(context, AddTaskView());
          },
          text: '+ Add Task'),
    ]);
  }
}
