import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/icons.dart';
import 'package:e_commerce/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GetDegree extends StatefulWidget {
  const GetDegree({super.key, required this.degree, required this.main});
  final double degree;
    final String main;
  @override
  State<GetDegree> createState() => _GetDegreeState();
}

class _GetDegreeState extends State<GetDegree> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: 160.w,
            height: 160.h,
            child: Image.asset(AppImages.cludy)),
        SizedBox(width: 4.w,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h,),
            Text('${(widget.degree-273.15).toInt()}',style: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontWeight: FontWeight.w500, fontSize: 70.sp, color: AppColors.c303345
            ),),
            Text(widget.main,style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w500, fontSize: 20.sp, color: AppColors.c303345
            ),),

          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 35.sp,),
            SizedBox(
                width: 30.w,
                height: 30.h,
                child: SvgPicture.asset(AppIcons.degree)),
          ],
        )
      ],
    );
  }
}
