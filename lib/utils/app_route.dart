import 'package:e_commerce/ui/home_screen/home_screen.dart';
import 'package:e_commerce/ui/screens/eitgh.dart';
import 'package:e_commerce/ui/screens/first.dart';
import 'package:e_commerce/ui/screens/fourth.dart';
import 'package:e_commerce/ui/screens/nine.dart';
import 'package:e_commerce/ui/screens/second.dart';
import 'package:e_commerce/ui/screens/seventh.dart';
import 'package:e_commerce/ui/screens/sixth.dart';
import 'package:e_commerce/ui/screens/ten.dart';
import 'package:e_commerce/ui/screens/third.dart';
import 'package:flutter/material.dart';

import '../ui/screens/fifth.dart';

class RouteNames{
  static const String homeScreen = "/";
  static const String firstScreen = "/first_screen";
  static const String secondScreen = "/second_screen";
  static const String thirdScreen = "/third_screen";
  static const String fourthScreen = "/fourth_screen";
  static const String fifthScreen = "/fifth_screen";
  static const String sixthScreen = "/sixth_screen";
  static const String seventhScreen = "/seventh_screen";
  static const String eighthScreen = "/eighth_screen";
  static const String ninthScreen = "/ninth_screen";
  static const String tenthScreen = "/tenth_screen";
}

class AppRoutes{
  static Route generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteNames.homeScreen:
        return MaterialPageRoute(builder: (context)=>const HomeScreen());
      case RouteNames.firstScreen:
        return MaterialPageRoute(builder: (context)=> const FirstTask());
      case RouteNames.secondScreen:
        return MaterialPageRoute(builder: (context)=> const SecondTask());
      case RouteNames.thirdScreen:
        return MaterialPageRoute(builder: (context)=> const ThirdTask());
      case RouteNames.fourthScreen:
        return MaterialPageRoute(builder: (context)=> const FourthTask());
      case RouteNames.fifthScreen:
        return MaterialPageRoute(builder: (context)=> const FifthTask());
      case RouteNames.sixthScreen:
        return MaterialPageRoute(builder: (context)=> const SixthTask());
      case RouteNames.seventhScreen:
        return MaterialPageRoute(builder: (context)=> const SeventhTask());
      case RouteNames.eighthScreen:
        return MaterialPageRoute(builder: (context)=> const EightTask());
      case RouteNames.ninthScreen:
        return MaterialPageRoute(builder: (context)=> const NinthTask());
      case RouteNames.tenthScreen:
        return MaterialPageRoute(builder: (context)=> const TenthTask());

      default:
        return MaterialPageRoute(builder: (context){
          return const Scaffold();
        });
    }
  }
}