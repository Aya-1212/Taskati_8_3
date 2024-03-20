import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_8_3/core/Utils/app_colors.dart';
import 'package:taskati_8_3/core/Utils/text_style.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(color: AppColors.primary,borderRadius: BorderRadius.circular(10),),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Flutter task',style: getBodyFont(fontWeight: FontWeight.bold),),
             const Gap(5),
              Row(
                children: [
                  Icon(Icons.watch_later_outlined,color: AppColors.white,size: 20,),
              const    Gap(8),
                  Text('12:00am-01:00pm',style: getSmallFont(fontSize: 16,colors: AppColors.white),),
                ],
              ),
            const  Gap(5),
              Text('Flutter note',style: getBodyFont(fontSize: 18),),
            ],
          ),
        const  Spacer(),
          RotatedBox(quarterTurns: 2,child: Container(color: AppColors.white,height: 60 , width: 0.5,)),
         const Gap(5),
        RotatedBox(quarterTurns: 3,child: Text('TODO',style: getSmallFont(colors: AppColors.white),)),
        ],
      ),
    );
  }
}
