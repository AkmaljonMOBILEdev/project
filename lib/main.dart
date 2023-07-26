import 'package:e_commerce/ui/app_provider/user_provider.dart';
import 'package:e_commerce/ui/users_list_screen/users_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
        designSize: Size(screenSize.width, screenSize.height),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            theme: ThemeData(
                colorScheme:
                    ColorScheme.fromSeed(seedColor: Colors.purpleAccent)),
            debugShowCheckedModeBanner: false,
            home: ChangeNotifierProvider(
              create: (context) => UserProvider(),
              child: const UsersListScreen(),
            ),
          );
        });
  }
}
