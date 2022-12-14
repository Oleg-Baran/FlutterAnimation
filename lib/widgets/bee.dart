import 'package:flutter/material.dart';

class Bee extends StatefulWidget {
  const Bee({
    Key? key,
  }) : super(key: key);

  @override
  State<Bee> createState() => _BeeState();
}

class _BeeState extends State<Bee> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    )..repeat();

    _animation = TweenSequence<Offset>(
      <TweenSequenceItem<Offset>>[
        TweenSequenceItem<Offset>(
          tween: Tween<Offset>(
                  begin: const Offset(-1.0, 0.0), end: const Offset(0.8, 0.0))
              .chain(CurveTween(curve: Curves.decelerate)),
          weight: 20.0,
        ),
        TweenSequenceItem<Offset>(
          tween: Tween<Offset>(
                  begin: const Offset(0.8, 0.0), end: const Offset(1.3, 0.3))
              .chain(CurveTween(curve: Curves.easeInOutBack)),
          weight: 20.0,
        ),
        
        TweenSequenceItem<Offset>(
          tween: Tween<Offset>(
                  begin: const Offset(1.3, 0.3), end: const Offset(5.5, 0.0))
              .chain(CurveTween(curve: Curves.decelerate)),
          weight: 20.0,
        ),
      ],
    ).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      transformHitTests: true,
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: EdgeInsets.only(
            left: 20, top: MediaQuery.of(context).size.width / 2.1),
        child: const Image(
          image: AssetImage('assets/images/bee.png'),
          height: 50,
          width: 50,
        ),
      ),
    );
  }
}
