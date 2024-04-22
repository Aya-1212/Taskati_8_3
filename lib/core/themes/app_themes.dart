import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskati_8_3/core/Utils/app_colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        color: AppColors.white,
        foregroundColor: AppColors.primary,
      ),
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.black,
          onPrimary: AppColors.primary,
          onSurface: AppColors.black,
          primary: AppColors.primary),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        constraints: const BoxConstraints(maxHeight: 120),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primary,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primary,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.pink,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.pink,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
       datePickerTheme: DatePickerThemeData(
           backgroundColor: AppColors.white,
           rangePickerHeaderBackgroundColor: AppColors.white,
               headerBackgroundColor: AppColors.primary ,
               headerForegroundColor: AppColors.white,
      ),);
//////////////////////////////////////////////////////
  static ThemeData darkTheme = ThemeData(
      //font family
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
          color: AppColors.primary, foregroundColor: AppColors.white),
      scaffoldBackgroundColor: AppColors.backgroundColor,
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.black,
          onPrimary: AppColors.white,
          onSurface: AppColors.white,
          primary: AppColors.primary),
      inputDecorationTheme: InputDecorationTheme(
        constraints: const BoxConstraints(maxHeight: 120),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primary,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primary,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.pink,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.pink,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: AppColors.backgroundColor,
               headerBackgroundColor: AppColors.primary ,
               headerForegroundColor: AppColors.white,
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: AppColors.backgroundColor,
        dialBackgroundColor: AppColors.backgroundColor,
        hourMinuteColor: AppColors.primary,
         entryModeIconColor: AppColors.primary,
      ),
      );
}
