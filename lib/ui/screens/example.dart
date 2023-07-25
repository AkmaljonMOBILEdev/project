import 'package:flutter/material.dart';

class Example7 extends StatefulWidget {
  Example7({Key? key}) : super(key: key);

  @override
  State<Example7> createState() => _Example7State();
}

class _Example7State extends State<Example7> {
  double value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example 7'),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: value,
          duration: Duration(milliseconds: 700),
          child: Container(
            height: 100,
            width: 100,
            color: Colors.blue,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          value = ((value == 1) ? 0 : 1);
          setState(() {});
        },
        child: Icon(Icons.opacity),
      ),
    );
  }
}