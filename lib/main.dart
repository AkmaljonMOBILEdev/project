import 'package:e_commerce/data/network/providers/apiprovider.dart';
import 'package:e_commerce/providers/basic_provider.dart';
import 'package:e_commerce/ui/tab_box/tab_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => BasicProvider(apiProvider: ApiProvider()))],
    child: const MyApp(),
  ));
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
          return  MaterialApp(
            theme:  ThemeData(colorScheme: ColorScheme.light(background: Colors.purple)),
            debugShowCheckedModeBanner: false,
            home: TabBox(),
          );
        });
  }
}
