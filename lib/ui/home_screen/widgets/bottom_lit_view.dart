import 'package:e_commerce/data/models/one_call/weather_model_by_one_call.dart';
import 'package:e_commerce/data/models/universal_response.dart';
import 'package:e_commerce/data/network/providers/rep.dart';
import 'package:e_commerce/utils/images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/network/providers/apiprovider.dart';

class BottomListView extends StatefulWidget {
  const BottomListView({super.key});

  @override
  State<BottomListView> createState() => _BottomListViewState();
}

class _BottomListViewState extends State<BottomListView> {
  List<String> hours =[
    "00:00", "01:00",
    "02:00", "03:00",
    "04:00", "05:00",
    "06:00", "07:00",
    "08:00", "09:00",
    "10:00", "11:00",
    "12:00", "13:00",
    "14:00", "15:00",
    "16:00", "17:00",
    "now", "19:00",
    "20:00", "21:00",
    "22:00", "23:00",
    "24:00",
  ];
  List<String> icons = [
    ...List.generate(6, (index) => AppImages.cludy),
    ...List.generate(6, (index) => AppImages.sunny),
    ...List.generate(6, (index) => AppImages.cloudy),
    ...List.generate(6, (index) => AppImages.rainy),
  ];
  List<String> degrees = [
    ...List.generate(24, (index) => '$index')
  ];
  bool isLoading = false;
  WeatherModelByOneCall? weather;
  UniversalResponse universalResponse = UniversalResponse();
  _fetchDailyData()async{
    setState(() {
      isLoading=true;
    });
    weather = await Repo().fetchWe();
    print('weather: $weather');
    setState(() {
      isLoading=false;
    });
  }
  String getHour(int datetime) {
    var date = DateTime.fromMillisecondsSinceEpoch(datetime);
    return DateFormat('HH:mm').format(date).split(':')[0];
  }
  @override
  void initState() {
    _fetchDailyData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          scrollDirection: Axis.horizontal,
          itemCount: hours.length,
          separatorBuilder: (BuildContext context, int index){
            return SizedBox(width: 24.w,);
          },
          itemBuilder: (BuildContext context, int index){
            return Container(
              width: 120.w,
              height: 32.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: const Color(0xFFFCE4EC)
              ),
              child: Column(
                children: [
                  Text(hours[index]),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.asset(icons[index], width: 80,height: 40,),
                  ),
                  Text('38')
                ],
              )
            );
          },

    ));
  }
}
