import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondTask extends StatefulWidget {
  const SecondTask({Key? key}) : super(key: key);

  @override
  State<SecondTask> createState() => _SecondTaskState();
}

class _SecondTaskState extends State<SecondTask>
    with SingleTickerProviderStateMixin {
  double vert = 0;
  double horz = 0;
  int vertCount = 0;
  int horzCount = 0;
  int value = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Task'),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}