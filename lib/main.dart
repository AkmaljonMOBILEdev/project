import 'package:e_commerce/utils/app_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Example6(),
      initialRoute: RouteNames.homeScreen,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
