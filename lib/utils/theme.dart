import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

class AppTheme{
  static ThemeData lightTheme=ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColors.white,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark
          )
      ),
      textTheme:  TextTheme(
        //display
          displayLarge: TextStyle(
              color: AppColors.black,
              fontSize: 57.sp,
              fontWeight: FontWeight.w800,
              fontFamily: 'Poppins'
          ),
          displayMedium: TextStyle(
              color: AppColors.black,
              fontSize: 45.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins'
          ),
          displaySmall: TextStyle(
              color: AppColors.black,
              fontSize: 36.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins'
          ),
          //headline
          headlineLarge: TextStyle(
              color: AppColors.black,
              fontSize: 32.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins'
          ),
          headlineMedium: TextStyle(
              color: AppColors.black,
              fontSize: 28.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins'
          ),
          headlineSmall: TextStyle(
              color: AppColors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins'
          ),
          //title
          titleLarge: TextStyle(
              color: AppColors.black,
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins'
          ),
          titleMedium: TextStyle(
              color: AppColors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins'
          ),
          titleSmall: TextStyle(
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins'
          ),
          //label
          labelLarge: TextStyle(
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins'
          ),
          labelMedium: TextStyle(
              color: AppColors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins'
          ),
          labelSmall: TextStyle(
              color: AppColors.black,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins'
          ),
          //body
          bodyLarge: TextStyle(
              color: AppColors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins'
          ),
          bodyMedium: TextStyle(
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins'
          ),
          bodySmall: TextStyle(
              color: AppColors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins'
          )

      )
  );

  static ThemeData darkTheme=ThemeData(
      scaffoldBackgroundColor: AppColors.c111015,
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.c111015,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColors.c111015,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light
          )
      ),
      textTheme:  TextTheme(
        //display
          displayLarge: TextStyle(
              color: AppColors.white,
              fontSize: 57.sp,
              fontWeight: FontWeight.w800,
              fontFamily: 'Inter'
          ),
          displayMedium: TextStyle(
              color: AppColors.white,
              fontSize: 45.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter'
          ),
          displaySmall: TextStyle(
              color: AppColors.white,
              fontSize: 36.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter'
          ),
          //headline
          headlineLarge: TextStyle(
              color: AppColors.white,
              fontSize: 32.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter'
          ),
          headlineMedium: TextStyle(
              color: AppColors.white,
              fontSize: 28.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter'
          ),
          headlineSmall: TextStyle(
              color: AppColors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter'

          ),
          //title
          titleLarge: TextStyle(
              color: AppColors.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter'
          ),
          titleMedium: TextStyle(
              color: AppColors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter'
          ),
          titleSmall: TextStyle(
              color: AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter'
          ),
          //label
          labelLarge: TextStyle(
              color: AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter'
          ),
          labelMedium: TextStyle(
              color: AppColors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter'
          ),
          labelSmall: TextStyle(
              color: AppColors.white,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter'
          ),
          //body
          bodyLarge: TextStyle(
              color: AppColors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter'
          ),
          bodyMedium: TextStyle(
              color: AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter'
          ),
          bodySmall: TextStyle(
              color: AppColors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter'
          )

      )
  );
}