import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key, required this.visibility, required this.wind, required this.humidity, required this.feelsLike});
  final String visibility;
  final double wind;
  final int humidity;
  final double feelsLike;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getItemHolder(context, AppIcons.visibility, visibility, 'Visibility'),
        SizedBox(height: 15.h,),
        getItemHolder(context, AppIcons.feelsLike, feelsLike, 'Feels like'),
        SizedBox(height: 15.h,),
        getItemHolder(context, AppIcons.humidity, '$humidity %', 'Humidity'),
        SizedBox(height: 15.h,),
        getItemHolder(context, AppIcons.wind, '$wind km/h', 'Wind'),
      ],
    );
  }

  getItemHolder(BuildContext context, String icon,  dynamic item, String text){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      width: 350.w,
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: Color(0xFFB3E5FC),
          width: 2.w
        ),
        gradient: const LinearGradient(
            colors: [Color(0xFFFCE4EC), // Misty Rose
              Color(0xFFE1BEE7)],
            begin: Alignment.centerLeft,
          end: Alignment.centerRight
        )
      ),
      child:  Row(
        children: [
          IconButton(onPressed: (){},icon: SvgPicture.asset(icon, color: AppColors.c313341) ,),
          SizedBox(width: 8.w,),
          Text(text, style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: AppColors.c303345
          ),),
          Spacer(),
          Text('$item', style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: AppColors.c303345
          ),),
          SizedBox(width: 8.w,)
        ],
      ),
    );
  }
}
