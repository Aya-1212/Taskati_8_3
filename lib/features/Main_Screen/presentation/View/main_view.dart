

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati_8_3/core/Functions/routing.dart';
import 'package:taskati_8_3/core/Utils/app_colors.dart';
import 'package:taskati_8_3/core/Utils/text_style.dart';
import 'package:taskati_8_3/core/Widgets/custom_local_button.dart';
import 'package:taskati_8_3/features/Main_Screen/presentation/widgets/task_item.dart';
import 'package:taskati_8_3/features/add_task/presentation/view/add_task.dart';
import 'package:taskati_8_3/features/Main_Screen/presentation/widgets/custom_header.dart';

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
        //body
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              //home header
              CustomHeader(),
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
              ),
              const Gap(10),
              //tasks
              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return const TaskItem();
                  },
                ),
              ),
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
            DateFormat.yMMMMd().format(DateTime.now()),
            style: getTitleFont(colors: AppColors.black),
          ),
          Text('Today',style: getTitleFont(colors: AppColors.black),),
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

