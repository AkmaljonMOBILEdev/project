import 'package:e_commerce/ui/screens/eitgh.dart';
import 'package:e_commerce/ui/screens/fifth.dart';
import 'package:e_commerce/ui/screens/first.dart';
import 'package:e_commerce/ui/screens/fourth.dart';
import 'package:e_commerce/ui/screens/second.dart';
import 'package:e_commerce/ui/screens/seventh.dart';
import 'package:e_commerce/ui/screens/sixth.dart';
import 'package:e_commerce/ui/screens/ten.dart';
import 'package:e_commerce/ui/screens/third.dart';
import 'package:e_commerce/utils/app_route.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [];
  List<String> routes = [];

  @override
  void initState() {
    screens.addAll(const [
      FirstTask(),
      SecondTask(),
      ThirdTask(),
      FourthTask(),
      FifthTask(),
      SixthTask(),
      SeventhTask(),
      EightTask(),
      SeventhTask(),
      TenthTask()
    ]);
    routes.addAll([
      RouteNames.firstScreen,
      RouteNames.secondScreen,
      RouteNames.thirdScreen,
      RouteNames.fourthScreen,
      RouteNames.fifthScreen,
      RouteNames.sixthScreen,
      RouteNames.seventhScreen,
      RouteNames.eighthScreen,
      RouteNames.ninthScreen,
      RouteNames.tenthScreen
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homework"),
      ),
      body: ListView(
        children: List.generate(screens.length, (index) {
          return ListTile(
            onTap: () {
              Navigator.pushNamed(context, routes[index]);
            },
            title: Text("${index + 1} - task"),
          );
        }),
      ),
    );
  }
}
