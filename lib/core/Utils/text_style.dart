import 'package:flutter/material.dart';
import 'package:taskati_8_3/core/Utils/app_colors.dart';

TextStyle getTitleFont(
    { Color? colors,
     double? fontSize,
     FontWeight? fontWeight}) {
  return TextStyle(
    color: (colors) ?? AppColors.primary,
    fontSize: (fontSize) ?? 22,
    fontWeight: (fontWeight) ?? FontWeight.bold,
  );
}

TextStyle getBodyFont(
    { Color? colors,
     double? fontSize,
     FontWeight? fontWeight}) {
  return TextStyle(
    color: (colors) ?? AppColors.white,
    fontSize: (fontSize) ?? 20,
    fontWeight: (fontWeight) ?? FontWeight.w500,
  );
}

TextStyle getSmallFont(
    { Color? colors,
     double? fontSize,
     FontWeight? fontWeight}) {
  return TextStyle(
    color: (colors) ?? AppColors.grey,
    fontSize: (fontSize) ?? 18,
    fontWeight: (fontWeight) ?? FontWeight.w300,
  );
}
