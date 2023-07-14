import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/icons.dart';
import 'package:e_commerce/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GetBurgers extends StatelessWidget {
  const GetBurgers({super.key, required this.title, required this.image, required this.price, required this.weight});
  final String title;
  final String image;
  final String price;
  final String weight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 114.h,
      padding: EdgeInsets.only(left: 4.w, right: 8.w, top: 8.h, bottom: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.c22222A
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(image, width: 88.w,height: 66.h,),
          SizedBox(width: 11.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w500
              ),),
              SizedBox(height: 5.h,),
              Text("Котлета куриная, свежие овощи, сыр чеддер,  соус для бургера",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.c6A6A6E),),
              Row(
                children: [
                  Text(price, style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w700
                  ),),
                  SizedBox(width: 60.w,),
                  Container(
                    width: 38.w,
                    height: 18.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.c16151B
                    ),
                    child: Center(
                      child: Text(weight,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 9.sp, color: AppColors.c6A6A6E
                      ),),
                    ),
                  )
                ],
              ),

            ],
          ),
          SizedBox(width: 8.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: (){},
                  icon: Icon(Icons.favorite, color: Colors.red,)),
              Container(
                padding: EdgeInsets.all(6.w),
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.r),
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.amber,
                    width: 1.w
                  )
                ),
                child: SvgPicture.asset(AppIcons.cart,),
              )
            ],
          )
        ],
      ),

    );
  }
}
