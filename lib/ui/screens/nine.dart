import 'package:flutter/material.dart';

class NinthTask extends StatefulWidget {
  const NinthTask({Key? key}) : super(key: key);

  @override
  State<NinthTask> createState() => _NinthTaskState();
}

class _NinthTaskState extends State<NinthTask> {
  bool isBig = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ninth Task'),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}