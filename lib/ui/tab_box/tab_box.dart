import 'package:e_commerce/providers/basic_provider.dart';
import 'package:e_commerce/ui/tab_box/company_screen/company_screen.dart';
import 'package:e_commerce/ui/tab_box/country_screen/country_screen.dart';
import 'package:e_commerce/ui/tab_box/single_company/single_company_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> screens = [];
  @override
  void initState() {
    screens.addAll(const [
      CountryScreen(),
      CompanyScreen(),
      SingleCompanyScreen()
    ]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[context.watch<BasicProvider>().getIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          context.read<BasicProvider>().changeIndex(value);
        },
        currentIndex: context.watch<BasicProvider>().getIndex,
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.lime,
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.flag), label: "Countries"),
          BottomNavigationBarItem(icon: Icon(Icons.rectangle), label: "Companies"),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit_outlined), label: "Single"),
        ],
      ),
    );
  }
}
