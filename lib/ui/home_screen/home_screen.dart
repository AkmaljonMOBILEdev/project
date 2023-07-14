import 'package:e_commerce/ui/home_screen/widgets/burgers.dart';
import 'package:e_commerce/ui/home_screen/widgets/list_view.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/icons.dart';
import 'package:e_commerce/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> foods=[
    "Чикен Бургер",
    "Блэк Бургер",
    "Шеф Бургер",
    "BBQ Бургер",
    "Шеф Бургер",
    "Блэк Бургер",
    "Шеф Бургер",
    "Чикен Бургер",
  ];
  List<String> images=[
    AppImages.chickenBurger,
    AppImages.blackBurger,
    AppImages.cheeseBurger,
    AppImages.chickenBurger,
    AppImages.chickenBurger,
    AppImages.blackBurger,
    AppImages.cheeseBurger,
    AppImages.chickenBurger,

  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: SafeArea(
         child: CustomScrollView(
           physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              title: Text("Привет, Максим",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w700
              ),),
              actions: [
                IconButton(onPressed: (){},
                    icon: SvgPicture.asset(AppIcons.search,width: 36.w,height: 36.h,)),
                SizedBox(width: 11.w,),
                Image.asset(AppImages.profileImage, width: 36.w,height: 36.h,),
                SizedBox(width: 16.w,)
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppIcons.rectangle),
                    SizedBox(height: 20.h,),
                    Row(
                      children: [
                        Text('Ваши любимые товары',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w700
                        ),),
                        Spacer(),
                        Text(
                          'Посмотреть все',
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.cEDB216
                          )
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h,)
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GetBurgers(title: 'Чикен Бургер', image: AppImages.chickenBurger, price: '₽160', weight: '290',),
                    SizedBox(width: 14.w,),
                    GetBurgers(title: 'Блэк Бургер', image: AppImages.blackBurger, price: '₽140', weight: '260',),
                    SizedBox(width: 14.w,),
                    GetBurgers(title: 'Чикен Бургер', image: AppImages.chickenBurger, price: '₽160', weight: '290',),
                    SizedBox(width: 14.w,),
                    GetBurgers(title: 'Блэк Бургер', image: AppImages.blackBurger, price: '₽140', weight: '260',),

                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h,),
                    Row(
                      children: [
                        Text('Все товары',
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w700
                          ),),
                        Spacer(),
                        Text(
                            'Посмотреть все',
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.cEDB216
                            )
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h,)
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
                pinned: true,
                delegate: PinnedCategories()),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  String imageHolder = images[index];
                  String textHolder = foods[index];
                  return Padding(
                    padding:  EdgeInsets.all(8.0.w),
                    child: Container(
                      height: 230.h,
                      width: 166.w,
                      padding: EdgeInsets.symmetric(horizontal: 11.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.c22222A,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.asset(
                                imageHolder, width: 130.w, height: 100.h,
                              ),
                            ),
                            Text(
                              textHolder,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                             SizedBox(height: 11.h,),
                             Text(
                               'Котлета куриная, свежие  овощи, сыр чеддер, соус  для бургера',
                               style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                 fontSize: 11.sp, color: AppColors.c6A6A6E
                               )
                             ),
                            Row(

                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  "\$15",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                 SizedBox(width: 23.w),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                    color: const Color(0xFF111015),
                                  ),
                                  width: 50,
                                  height: 20,
                                  child: const Center(
                                    child: Text(
                                      "300g",
                                      style: TextStyle(
                                          color: Color(0xFF6A6A6E),
                                          fontSize: 12),
                                    ),
                                  ),
                                ),
                                 SizedBox(width: 6.w),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    width: 34.w,
                                    height: 34.h,
                                    padding: EdgeInsets.all(4.w),
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          AppColors.cE1D24A,
                                          AppColors.cC69223,
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child:  CircleAvatar(
                                      // radius: 32,
                                      backgroundColor: Colors.transparent,
                                      child: SvgPicture.asset(AppIcons.plus, width: 10.w,height: 10.h,),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        )),
                  );
                },
                // addRepaintBoundaries: true,
                childCount: images.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.8,
              ),
            ),
          ]
      ),
       ),

    );
  }
}
