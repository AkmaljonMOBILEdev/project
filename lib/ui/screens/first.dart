import 'package:flutter/material.dart';

class FirstTask extends StatefulWidget {
  const FirstTask({super.key});

  @override
  State<FirstTask> createState() => _FirstTaskState();
}

class _FirstTaskState extends State<FirstTask> with TickerProviderStateMixin {
  bool isFirst = true;
  late AnimationController animationController;
  late Animation<Color?> colorAnimation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    colorAnimation = ColorTween(begin: Colors.orange, end: Colors.green)
        .animate(animationController);
    animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First task"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              width: 300,
              height: 300,
              color: isFirst ? Colors.orange : Colors.green,
              duration: const Duration(seconds: 2),
              curve: Curves.linear,
              child: Center(
                child: isFirst
                    ? AnimatedOpacity(
                        opacity: isFirst?1.0:0,
                        duration: const Duration(seconds: 2),
                        curve: Curves.linear,
                        child: const Text(
                          "This is the first Widget",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      )
                    : AnimatedOpacity(
                        opacity: !isFirst?1.0:0,
                        duration: const Duration(seconds: 2),
                        curve: Curves.linear,
                        child: const Text(
                          "This is the second Widget",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isFirst = !isFirst;
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              child: const Text("Click here"),
            )
          ],
        ),
      ),
    );
  }
}
