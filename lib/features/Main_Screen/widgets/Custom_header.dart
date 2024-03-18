// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:taskati_8_3/core/Utils/app_colors.dart';
import 'package:taskati_8_3/core/Utils/text_style.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     var box = Hive.box('user');
    return Row(
    children: [
     Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(
           'Hello, ${box.get('name')}',
           style: getTitleFont(),
         ),
         Text('Have A Nice Day.',
             style: getSmallFont(
              fontWeight: FontWeight.w400,
               colors: AppColors.black,
             )),
       ],
     ),
     const Spacer(),
     //image
     CircleAvatar(
       radius: 35,
       backgroundImage: FileImage(File(box.get('image'))) as ImageProvider,
     ),
                ],
              );
  }
}
