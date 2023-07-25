import 'package:flutter/material.dart';

class SeventhTask extends StatefulWidget {
  const SeventhTask({Key? key}) : super(key: key);

  @override
  State<SeventhTask> createState() => _SeventhTaskState();
}

class _SeventhTaskState extends State<SeventhTask> {
  bool isBig = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seventh Task'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedDefaultTextStyle(
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: isBig ? 56 : 26,
                  color: isBig ? Colors.red : Colors.blue),
              duration: const Duration(milliseconds: 800),
              child: const Text('Hello Flutter World', style: TextStyle(
                  fontWeight: FontWeight.w700
              ),)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  isBig = true;
                  setState(() {});
                },
                backgroundColor: Colors.blueGrey,
                child: const Icon(Icons.play_arrow),
              ),
              const SizedBox(width: 20),
              FloatingActionButton(
                onPressed: () {
                  isBig = false;
                  setState(() {});
                },
                backgroundColor: Colors.blueGrey,
                child: const Icon(Icons.lock_reset),
              )
            ],
          )
        ],
      ),
    );
  }
}