import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDark=false;
  _themeState() async {
    final savedThemeMode = await AdaptiveTheme.getThemeMode();
    if (savedThemeMode == AdaptiveThemeMode.dark) {
      setState(() {
        isDark = true;
      });
    }
  }

  @override
  void initState() {
    _themeState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Theme Screen"),
        actions: [
          CupertinoSwitch(
            value: isDark,
            onChanged: (changedValue) {
              if (changedValue) {
                AdaptiveTheme.of(context).setDark();
                isDark = true;
              } else {
                AdaptiveTheme.of(context).setLight();
                isDark = false;
              }
            },
          ),
        ],
      ),

      body: Column(
        children: [
          Container(
            width: 300,
            height: 450,
            color: Theme.of(context).colorScheme.background,
          ),

        ],
      ),
    );
  }
}
