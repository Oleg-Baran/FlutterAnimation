import 'package:flutter/material.dart';

class FllowersPlacing extends StatelessWidget {
  const FllowersPlacing({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(bottom: 80),
              child: Image(
                image: AssetImage('assets/images/flower.png'),
                alignment: Alignment.center,
                width: 50,
                height: 50,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, bottom: 110),
              child: Image(
                image: AssetImage('assets/images/flower.png'),
                alignment: Alignment.center,
                width: 50,
                height: 50,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 50),
              child: Image(
                image: AssetImage('assets/images/flower.png'),
                alignment: Alignment.center,
                width: 50,
                height: 50,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, top: 60),
              child: Image(
                image: AssetImage('assets/images/flower.png'),
                alignment: Alignment.center,
                width: 50,
                height: 50,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, bottom: 60),
              child: Image(
                image: AssetImage('assets/images/flower.png'),
                alignment: Alignment.center,
                width: 50,
                height: 50,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
