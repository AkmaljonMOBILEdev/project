import 'package:flutter/material.dart';

class SixthTask extends StatefulWidget {
  const SixthTask({Key? key}) : super(key: key);

  @override
  State<SixthTask> createState() => _SixthTaskState();
}

class _SixthTaskState extends State<SixthTask> {
  bool isLarge = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sixth Task'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isLarge = !isLarge;
            });
          },
          child: AnimatedContainer(
            height: 150,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: isLarge ? 150 : 320,
            color: Colors.blue,
            duration: const Duration(milliseconds: 800),
          ),
        ),
      ),
    );
  }
}