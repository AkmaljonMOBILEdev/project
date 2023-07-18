import 'package:e_commerce/data/local/storage_repository.dart';
import 'package:e_commerce/ui/home_screen/home_screen.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
        designSize:  Size(screenSize.width, screenSize.height),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child){
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.light,
            home: const HomeScreen(),
          );
        });
  }
}
