import 'package:flutter/material.dart';

class EightTask extends StatefulWidget {
  const EightTask({Key? key}) : super(key: key);

  @override
  State<EightTask> createState() => _EightTaskState();
}

class _EightTaskState extends State<EightTask> {
  bool isTopLeft = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eighth Task'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              height: 300,
              width: 300,
              alignment: isTopLeft ? Alignment.topLeft : Alignment.bottomRight,
              color: Colors.deepPurple.withOpacity(.5),
              duration: const Duration(milliseconds: 1500),
              curve: Curves.bounceInOut,
              child: Container(
                color: Colors.teal,
                child: const Text('Woolha.com',
                  style: TextStyle(
                      color: Colors.white, fontSize: 22
                  ),),
              )
            ),
            TextButton(
                onPressed: () {
                  isTopLeft = !isTopLeft;
                  setState(() {});
                },
                child: const Text('Change Alignment'))
          ],
        ),
      ),
    );
  }
}