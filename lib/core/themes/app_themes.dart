import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskati_8_3/core/Utils/app_colors.dart';

ThemeData lightTheme = ThemeData(
  //font family
  fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: AppBarTheme(color: AppColors.white),
    scaffoldBackgroundColor: AppColors.white,
    inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
      color: AppColors.primary,
    ),borderRadius: BorderRadius.circular(15),), 

     focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
      color: AppColors.primary,
    ),borderRadius: BorderRadius.circular(15),), 

    errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
      color: AppColors.pink,
    ),borderRadius: BorderRadius.circular(15),) ,

    focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
      color: AppColors.pink,
    ),borderRadius: BorderRadius.circular(15),) ,
    ) 
    );


    ThemeData darkTheme = ThemeData(
  //font family
   fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: AppBarTheme(color: AppColors.black),
    scaffoldBackgroundColor: AppColors.black,
    inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
      color: AppColors.primary,
    ),borderRadius: BorderRadius.circular(15),), 

     focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
      color: AppColors.primary,
    ),borderRadius: BorderRadius.circular(15),), 

    errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
      color: AppColors.pink,
    ),borderRadius: BorderRadius.circular(15),) ,

    focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
      color: AppColors.pink,
    ),borderRadius: BorderRadius.circular(15),) ,
    ) 
    );
