import 'package:e_commerce/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ButtonMaker extends StatelessWidget {
  const ButtonMaker({
    super.key,
    required this.text,
    this.isBlue = false,
    this.isIcon = false,
    required this.apply,
  });

  final String text;
  final bool isBlue;
  final bool isIcon;
  final VoidCallback apply;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: apply,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        width: 66.w,
        height: 66.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            color: isBlue ? AppColors.c4B5EFC : AppColors.cD2D3DA,
            border: Border.all(
              color: isBlue?AppColors.black:AppColors.c4B5EFC
            )
        ),

        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: isBlue?AppColors.white:AppColors.black
            ),
          ),
        ),
      ),
    );
  }
}
