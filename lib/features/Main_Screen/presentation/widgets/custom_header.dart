import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taskati_8_3/core/Utils/app_colors.dart';
import 'package:taskati_8_3/core/Utils/text_style.dart';
import 'package:taskati_8_3/core/services/local_storage.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
    children: [
     Expanded(
      flex: 3,
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(
             'Hello, ${AppLocalStorage.getUserData('name')}',
             style: getTitleFont(),
           ),
           Text('Have A Nice Day.',
               style: getSmallFont(
                fontWeight: FontWeight.w400,
                 colors: AppColors.black,
               )),
         ],
       ),
     ),
     const Spacer(),
     //image
     Expanded(
       child: CircleAvatar(
         radius: 35,
         backgroundImage: FileImage(File(AppLocalStorage.getUserData('image'))) as ImageProvider,
       ),
     ),
                ],
              );
  }
}
