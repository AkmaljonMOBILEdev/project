import 'package:e_commerce/providers/basic_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SingleCompanyScreen extends StatelessWidget {
  const SingleCompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var company = Provider.of<BasicProvider>(context,listen: true).singleModel;
    return Scaffold(
      appBar: AppBar(
        title: Text("Single company"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300.w,
                height: 50.h,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: context.watch<BasicProvider>().controller,
                  style: TextStyle(fontSize: 20.sp, color: Colors.black),
                  decoration: InputDecoration(
                      hintText: "Enter company id",
                      hintStyle:
                          TextStyle(fontSize: 20.sp, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.w),
                          borderRadius: BorderRadius.circular(16.r)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 1.w),
                          borderRadius: BorderRadius.circular(16.r))),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<BasicProvider>().fetchSingleById();
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                  child: Text("GET"))
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            width: double.infinity,
            height: 4.h,
            color: Colors.purple,
          ),
          Expanded(child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            children: [
              Stack(
                children:[ SizedBox(
                    height: 250,
                    child: ListView.separated(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                        scrollDirection: Axis.horizontal,
                        itemCount:
                        context.watch<BasicProvider>().singleModel.pics.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 20.w,
                          );
                        },
                        itemBuilder: (context, index) {
                          String image =
                          context.watch<BasicProvider>().singleModel.pics[index];
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.network(image),
                          );
                        })),
                  Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.lime,
                    ),
                    child: Image.network(company.logo),
                  )
            ]
              ),
              RichText(text: TextSpan(
                  text: "Car model: ",
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.purple,
                      fontWeight: FontWeight.w700
                  ),
                  children: [
                    TextSpan(
                        text: company.carModel,
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w800
                        )
                    )
                  ]
              )),
              SizedBox(height: 12.h,),
              RichText(text: TextSpan(
                  text: "Description: ",
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.purple,
                      fontWeight: FontWeight.w700
                  ),
                  children: [
                    TextSpan(
                        text: company.desc,
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400
                        )
                    )
                  ]
              )),
              SizedBox(height: 12.h,),
              RichText(text: TextSpan(
                  text: "Price: ",
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.purple,
                      fontWeight: FontWeight.w700
                  ),
                  children: [
                    TextSpan(
                        text: "\$ ${company.averagePrice}",
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.red,
                            fontWeight: FontWeight.w800
                        )
                    )
                  ]
              )),
              SizedBox(height: 12.h,),
              RichText(text: TextSpan(
                  text: "Year: ",
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.purple,
                      fontWeight: FontWeight.w700
                  ),
                  children: [
                    TextSpan(
                        text: company.year.toString(),
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.blue,
                            fontWeight: FontWeight.w800
                        )
                    )
                  ]
              )),
            ],
          ))
        ],
      ),
    );
  }
}
