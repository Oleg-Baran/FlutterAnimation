import 'package:flutter/material.dart';

class Mill extends StatefulWidget {
  const Mill({
    Key? key,
  }) : super(key: key);

  @override
  State<Mill> createState() => _MillState();
}

class _MillState extends State<Mill> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut)..addStatusListener(
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
    return Stack(
      alignment: Alignment.center,
      children: [
        // Stick of Mill
        Column(
          children: [
            const Spacer(),
            Container(
              width: 45,
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width / 3)
          ],
        ),
        // Mill
        Padding(
          padding: const EdgeInsets.only(bottom: 230),
          child: RotationTransition(
            turns: animation,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                Container(
                  width: 40,
                  height: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
