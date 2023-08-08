import 'package:e_commerce/services/fcm.dart';
import 'package:e_commerce/services/lns.dart';
import 'package:e_commerce/ui/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await NotificationService.instance.init();
  await initFirebase();
  await LocalNotificationService.instance.setupFlutterNotifications();
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
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: NewsScreen(),
          );
        });
  }
}
