import 'package:e_commerce/ui/home_screen/home_screen.dart';
import 'package:e_commerce/ui/splash_screen/splash_screen.dart';
import 'package:e_commerce/ui/widgets/tab_box.dart';
import 'package:flutter/material.dart';

class RouteNames{
  static const String splashScreen = '/';
  static const String tabBox = '/tab_box';
  static const String homeScreen = '/home_screen';
}

class AppRoute{
  static Route generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (context)=>const SplashScreen());
      case RouteNames.tabBox:
        return MaterialPageRoute(builder: (context)=>const TabsBox());
      case RouteNames.homeScreen:
        return MaterialPageRoute(builder: (context)=>const HomeScreen());
      default:
        return MaterialPageRoute(builder: (context){
          return const Scaffold();
        });
    }

  }
}