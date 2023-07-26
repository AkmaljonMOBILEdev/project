import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

class AppTheme{
  static ThemeData lightTheme=ThemeData(
      scaffoldBackgroundColor: AppColors.cD2D3DA,
      appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.cD2D3DA,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColors.cD2D3DA,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark
          )
      ),
      iconTheme: const IconThemeData(color: AppColors.white),
      textTheme:  TextTheme(
        //display
          displayLarge: TextStyle(
              color: AppColors.black,
              fontSize: 57.sp,
              fontWeight: FontWeight.w800,
              fontFamily: 'WorkSans'
          ),
          displayMedium: TextStyle(
              color: AppColors.black,
              fontSize: 45.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'WorkSans'
          ),
          displaySmall: TextStyle(
              color: AppColors.black,
              fontSize: 36.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'WorkSans'
          ),
          //headline
          headlineLarge: TextStyle(
              color: AppColors.black,
              fontSize: 32.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'WorkSans'
          ),
          headlineMedium: TextStyle(
              color: AppColors.black,
              fontSize: 28.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'WorkSans'
          ),
          headlineSmall: TextStyle(
              color: AppColors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'WorkSans'
          ),
          //title
          titleLarge: TextStyle(
              color: AppColors.black,
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'WorkSans'
          ),
          titleMedium: TextStyle(
              color: AppColors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'WorkSans'
          ),
          titleSmall: TextStyle(
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'WorkSans'
          ),
          //label
          labelLarge: TextStyle(
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'WorkSans'
          ),
          labelMedium: TextStyle(
              color: AppColors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'WorkSans'
          ),
          labelSmall: TextStyle(
              color: AppColors.black,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'WorkSans'
          ),
          //body
          bodyLarge: TextStyle(
              color: AppColors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'WorkSans'
          ),
          bodyMedium: TextStyle(
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'WorkSans'
          ),
          bodySmall: TextStyle(
              color: AppColors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'WorkSans'
          )

      )
  );

  static ThemeData darkTheme=ThemeData(
      scaffoldBackgroundColor: AppColors.c17171C,
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.c17171C,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColors.c17171C,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light
          )
      ),
      iconTheme: const IconThemeData(color: AppColors.c2E2F38),
      textTheme:  TextTheme(
        //display
          displayLarge: TextStyle(
              color: AppColors.white,
              fontSize: 57.sp,
              fontWeight: FontWeight.w800,
              fontFamily: 'WorkSans'
          ),
          displayMedium: TextStyle(
              color: AppColors.white,
              fontSize: 45.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'WorkSans'
          ),
          displaySmall: TextStyle(
              color: AppColors.white,
              fontSize: 36.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'WorkSans'
          ),
          //headline
          headlineLarge: TextStyle(
              color: AppColors.white,
              fontSize: 32.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'WorkSans'
          ),
          headlineMedium: TextStyle(
              color: AppColors.white,
              fontSize: 28.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'WorkSans'
          ),
          headlineSmall: TextStyle(
              color: AppColors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'WorkSans'

          ),
          //title
          titleLarge: TextStyle(
              color: AppColors.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'WorkSans'
          ),
          titleMedium: TextStyle(
              color: AppColors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'WorkSans'
          ),
          titleSmall: TextStyle(
              color: AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'WorkSans'
          ),
          //label
          labelLarge: TextStyle(
              color: AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'WorkSans'
          ),
          labelMedium: TextStyle(
              color: AppColors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'WorkSans'
          ),
          labelSmall: TextStyle(
              color: AppColors.white,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'WorkSans'
          ),
          //body
          bodyLarge: TextStyle(
              color: AppColors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'WorkSans'
          ),
          bodyMedium: TextStyle(
              color: AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'WorkSans'
          ),
          bodySmall: TextStyle(
              color: AppColors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'WorkSans'
          )

      )
  );
}