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
              color: AppColors.white,
              fontSize: 57.sp,
              fontWeight: FontWeight.w800,
              fontFamily: 'SansPro'
          ),
          displayMedium: TextStyle(
              color: AppColors.white,
              fontSize: 45.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'SansPro'
          ),
          displaySmall: TextStyle(
              color: AppColors.white,
              fontSize: 36.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'SansPro'
          ),
          //headline
          headlineLarge: TextStyle(
              color: AppColors.white,
              fontSize: 32.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'SansPro'
          ),
          headlineMedium: TextStyle(
              color: AppColors.white,
              fontSize: 28.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'SansPro'
          ),
          headlineSmall: TextStyle(
              color: AppColors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'SansPro'

          ),
          //title
          titleLarge: TextStyle(
              color: AppColors.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'SansPro'
          ),
          titleMedium: TextStyle(
              color: AppColors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'SansPro'
          ),
          titleSmall: TextStyle(
              color: AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'SansPro'
          ),
          //label
          labelLarge: TextStyle(
              color: AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'SansPro'
          ),
          labelMedium: TextStyle(
              color: AppColors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'SansPro'
          ),
          labelSmall: TextStyle(
              color: AppColors.white,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'SansPro'
          ),
          //body
          bodyLarge: TextStyle(
              color: AppColors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'SansPro'
          ),
          bodyMedium: TextStyle(
              color: AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'SansPro'
          ),
          bodySmall: TextStyle(
              color: AppColors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'SansPro'
          )

      )
  );

  static ThemeData darkTheme=ThemeData(
      scaffoldBackgroundColor: AppColors.black,
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.black,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColors.black,
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
              fontFamily: 'SansPro'
          ),
          displayMedium: TextStyle(
              color: AppColors.white,
              fontSize: 45.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'SansPro'
          ),
          displaySmall: TextStyle(
              color: AppColors.white,
              fontSize: 36.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'SansPro'
          ),
          //headline
          headlineLarge: TextStyle(
              color: AppColors.white,
              fontSize: 32.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'SansPro'
          ),
          headlineMedium: TextStyle(
              color: AppColors.white,
              fontSize: 28.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'SansPro'
          ),
          headlineSmall: TextStyle(
              color: AppColors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'SansPro'

          ),
          //title
          titleLarge: TextStyle(
              color: AppColors.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'SansPro'
          ),
          titleMedium: TextStyle(
              color: AppColors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'SansPro'
          ),
          titleSmall: TextStyle(
              color: AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'SansPro'
          ),
          //label
          labelLarge: TextStyle(
              color: AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'SansPro'
          ),
          labelMedium: TextStyle(
              color: AppColors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'SansPro'
          ),
          labelSmall: TextStyle(
              color: AppColors.white,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'SansPro'
          ),
          //body
          bodyLarge: TextStyle(
              color: AppColors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'SansPro'
          ),
          bodyMedium: TextStyle(
              color: AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'SansPro'
          ),
          bodySmall: TextStyle(
              color: AppColors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'SansPro'
          )

      )
  );
}