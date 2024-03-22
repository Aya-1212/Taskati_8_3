import 'package:flutter/material.dart';
import 'package:taskati_8_3/core/Utils/app_colors.dart';

showSnackeBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    backgroundColor: AppColors.pink,
  
  ));
}
