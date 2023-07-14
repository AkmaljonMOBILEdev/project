import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PinnedCategories extends SliverPersistentHeaderDelegate {
  List<String> categories = [
    "Бургеры",
    "Пицца",
    "Фрэнч Доги",
    "Снэки",
    "Бургеры",
    "Пицца",
    "Снэки",
  ];
  List<String> icons = [
    AppIcons.burgers,
    AppIcons.pizza,
    AppIcons.frenchDog,
    AppIcons.snacks,
    AppIcons.burgers,
    AppIcons.pizza,
    AppIcons.snacks,
  ];
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.c111015
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          String texts = categories[index];
          return Container(
            height: 30.h,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: index==0?AppColors.cC69223:AppColors.c22222A,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [SvgPicture.asset(icons[index], height: 18.h, width: 18.w,), Text(texts)],
            ),
          );
        },
      ),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}