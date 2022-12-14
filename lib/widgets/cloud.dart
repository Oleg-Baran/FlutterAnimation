import 'package:flutter/material.dart';

class Cloud extends StatefulWidget {
  const Cloud({
    Key? key,
  }) : super(key: key);

  @override
  State<Cloud> createState() => _CloudState();
}

class _CloudState extends State<Cloud> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    )..repeat();

    _animation = Tween<Offset>(
      begin: const Offset(-1, 0.0),
      end: const Offset(3, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      transformHitTests: true,
      textDirection: TextDirection.ltr,
      child: const Padding(
          padding: EdgeInsets.only(top: 80, left: 20),
          child: Image(
              width: 150,
              height: 120,
              image: AssetImage('assets/images/clouds.png'))),
    );
  }
}
