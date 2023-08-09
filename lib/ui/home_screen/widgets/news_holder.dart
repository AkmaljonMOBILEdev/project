import 'package:e_commerce/data/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsHolder extends StatelessWidget {
  const NewsHolder({super.key, required this.newsModel});
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      width: 320.w,
      // height: 400.h,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(.4),
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(
          color: Colors.black,
          width: 1.w
        )
      ),
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white70,
                  width: 4.w
                ),
                borderRadius: BorderRadius.circular(14.r)
              ),
              child: Image.network(newsModel.imageUrl, )),
          SizedBox(height: 20.h,),
          Text(newsModel.title, style: TextStyle(
            color: Colors.white70,fontWeight: FontWeight.w900, fontSize: 22.sp,
          ),),
          SizedBox(height: 8.h,),
          Text(newsModel.desc,style: TextStyle(
            color: Colors.white70,fontSize: 18.sp,
          ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(newsModel.source,style: TextStyle(
                color: Colors.white70, fontSize: 21.sp, fontWeight: FontWeight.w800
              ),),
            ],
          )
        ],
      ),
    );
  }
}
