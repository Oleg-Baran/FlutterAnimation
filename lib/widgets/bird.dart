import 'package:flutter/material.dart';

class Bird extends StatefulWidget {
  const Bird({
    Key? key,
  }) : super(key: key);

  @override
  State<Bird> createState() => _BirdState();
}

class _BirdState extends State<Bird> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();

    _animation = TweenSequence<Offset>(
      <TweenSequenceItem<Offset>>[
        TweenSequenceItem<Offset>(
          tween: Tween<Offset>(
                  begin: const Offset(-1, 0.0), end: const Offset(2, -1.5))
              .chain(CurveTween(curve: Curves.ease)),
          weight: 1.0,
        ),
        TweenSequenceItem<Offset>(
          tween: Tween<Offset>(
                  begin: const Offset(2, -1.5), end: const Offset(5, 0.0))
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: 1.0,
        )
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
      child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.width / 5),
          child: const Image(
            width: 80,
            height: 80,
            image: AssetImage('assets/images/bird.png'),
          )),
    );
  }
}
