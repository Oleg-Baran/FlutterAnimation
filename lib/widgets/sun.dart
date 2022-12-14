import 'package:flutter/material.dart';

class Sun extends StatefulWidget {
  const Sun({
    Key? key,
  }) : super(key: key);

  @override
  State<Sun> createState() => _SunState();
}

class _SunState extends State<Sun> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animation = Tween<double>(begin: 50, end: 60).animate(controller)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            controller.reverse();
          } else if (status == AnimationStatus.dismissed) {
            controller.forward();
          }
        },
      );

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) => Padding(
        padding: const EdgeInsets.only(left: 20, top: 100),
        child: Container(
          width: animation.value,
          height: animation.value,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.amber,
                spreadRadius: 5,
                blurRadius: 20,
              ),
            ],
            color: Colors.yellow[600],
            borderRadius: BorderRadius.circular(40.0),
          ),
        ),
      ),
    );
  }
}
