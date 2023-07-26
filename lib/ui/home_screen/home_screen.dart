import 'package:e_commerce/app_providers/calculator_provider.dart';
import 'package:e_commerce/ui/home_screen/widgets/button_maker.dart';
import 'package:e_commerce/ui/home_screen/widgets/number_input_formatter.dart';
import 'package:e_commerce/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController first = TextEditingController();
  TextEditingController second = TextEditingController();
  bool isDark = false;
  bool isReady=false;
  String result='';
  String action='';


  @override
  void initState() {

      setState(() {
        if(first.text.length==6 && int.parse(first.text)>100000){
          first.text=='100000';
        }

        if(second.text.length==6 && int.parse(second.text)>100000){
          second.text=='100000';
        }
      });

    super.initState();
  }
  @override
  void dispose() {
    first.dispose();
    second.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CalculatorProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.cF1F2F3,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          width: 72.w,
          height: 32.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: isDark?AppColors.c2E2F38:AppColors.cF1F2F3
          ),
          child: Row(
            children: [
              SvgPicture.asset(AppIcons.sun),
              const Spacer(),
              Container(
                width: 24.w,
                height: 24.h,
                decoration: const BoxDecoration(
                  color: AppColors.cD2D3DA,
                  shape: BoxShape.circle
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.cF1F2F3,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 160.w,
                  height: 160.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(24.r),
                    border: Border.all(
                      color: AppColors.c4B5EFC,
                      width: 1.w
                    )
                  ),
                  child: Center(
                    child: Text(result,style: Theme.of(context).textTheme.displaySmall,),
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 160.w,
                      child: TextField(
                        controller: first,
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontSize: 40.sp, color: AppColors.black.withOpacity(.7)
                        ),
                        onChanged: (v){
                          provider.setFirst(int.parse(v));
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          NumberInputFormatter()
                        ],


                      ),
                    ),
                    SizedBox(
                      width: 160.w,
                      child: TextField(
                        controller: second,
                        onChanged: (v){
                          provider.setSecond(int.parse(v));
                        },
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontSize: 40.sp, color: AppColors.black.withOpacity(.7)
                        ),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          NumberInputFormatter()
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h,),

                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ButtonMaker(text: 'C',  apply: (){
                      first.text='';
                      second.text='';
                     setState(() {
                       result='0';
                     });

                    }),
                    ButtonMaker(text: '%',  apply: (){
                      provider.setAction("%");


                    }),
                    ButtonMaker(text: '÷',  apply: (){
                      provider.setAction("÷");
                    }),
                    ButtonMaker(text: "Avr",apply: (){
                      provider.setAction('avr');

                    }),
                  ],
                ),
                Row(
                  children: [
                    ButtonMaker(text: '×',  apply: (){
                      provider.setAction("*");
                    }),
                    ButtonMaker(text: '+',   apply: (){
                      provider.setAction('+');
                    }),
                    ButtonMaker(text: '-',  apply: (){
                      provider.setAction("-");
                    }),
                    ButtonMaker(text: 'Geo', apply: (){
                      provider.setAction("geo");
                    })

                  ],
                ),
                ZoomTapAnimation(
                  onTap: (){
                    result=provider.getResult();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 50.w),
                    width: 250.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                        color: AppColors.c4B5EFC,
                        border: Border.all(
                          color: AppColors.c4B5EFC,
                        ),
                        borderRadius: BorderRadius.circular(24.r)
                    ),
                    child: Center(
                      child: Text("=",style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: 66.sp, color: AppColors.white
                      ),),
                    ),
                  ),
                ),

              ],
            )





          ],
        ),
      ),
    );
  }
}

