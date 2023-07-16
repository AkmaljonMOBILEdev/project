import 'package:e_commerce/data/models/main_weather_model/main_weather_model.dart';
import 'package:e_commerce/data/network/repositories/weather_repository.dart';
import 'package:e_commerce/ui/home_screen/widgets/app_bar.dart';
import 'package:e_commerce/ui/home_screen/widgets/bottom_lit_view.dart';
import 'package:e_commerce/ui/home_screen/widgets/get_degree.dart';
import 'package:e_commerce/ui/home_screen/widgets/get_details.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MainWeatherModel? mainWeatherModel;
  bool isLoading = false;

  String _getToday(int time){

    DateTime date = DateTime.fromMillisecondsSinceEpoch(time * 1000);

    String formattedDate = DateFormat.E().add_d().add_MMMM().format(date);

    String today = formattedDate.replaceAllMapped(
        RegExp(r'(\d+), (st|nd|rd|th)'), (match) => '${match[1]}${match[2]}'
    );
    return today;


  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }
  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    mainWeatherModel =
    await WeatherRepository().getWeatherByQuery(query: "Fergana");
    setState(() {
      isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body:  Container(
        // padding: EdgeInsets.symmetric(horizontal: 24.w),
        width: double.infinity,
        decoration: BoxDecoration(
        gradient: const RadialGradient(
          colors: [
            Color(0xFFFCE4EC), // Misty Rose
            Color(0xFFE1BEE7), // Lavender Purple
            Color(0xFFB3E5FC), // Light Blue
          ],
          radius: 1.5,
          center: Alignment(0.0, -0.3),
          stops: [0.1, 0.5, 0.8],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
        child:
        isLoading? const Center(child: CircularProgressIndicator(),)
        : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h,),
                  Text(mainWeatherModel!.name, style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.c313341
                  ),),
                  Text(_getToday(mainWeatherModel!.dt),style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: AppColors.c9A938C
                  ),),
                  GetDegree(degree: mainWeatherModel!.main.temp, main: mainWeatherModel!.weather[0].main),
                  SizedBox(height: 16.h,),
                  WeatherDetails(visibility: "${mainWeatherModel!.visibility~/1000} km", wind: mainWeatherModel!.wind.speed, humidity: mainWeatherModel!.main.humidity, feelsLike: mainWeatherModel!.main.feelsLike,),
                  SizedBox(height: 40.h,),

                ],
              ),
            ),
            BottomListView(),
            SizedBox(height: 20.h,)
          ],
        ),
    ));
  }
}
