import 'package:flutter/material.dart';

class FifthTask extends StatefulWidget {
  const FifthTask({super.key});

  @override
  State<FifthTask> createState() => _FifthTaskState();
}

class _FifthTaskState extends State<FifthTask> with TickerProviderStateMixin{
  double opacity = 1;
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fifth task"),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 800),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacity = (opacity==1)?0:1;
          });
        },
        child: Icon(Icons.ac_unit),
      ),
    );
  }
}
