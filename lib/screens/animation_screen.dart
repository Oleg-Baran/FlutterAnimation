import 'package:animation/widgets/bird.dart';
import 'package:animation/widgets/cloud.dart';
import 'package:animation/widgets/flowers_placing.dart';
import 'package:animation/widgets/mill.dart';
import 'package:animation/widgets/sun.dart';
import 'package:flutter/material.dart';

import '../widgets/bee.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: Colors.lightGreen,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            color: Colors.lightBlue,
            height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.width / 2),
          ),
          Row(
            children: [
              Stack(
                children: [
                  Column(
                    children: const [
                      //sun
                      Sun(),
                      Spacer(),
                      //bird
                      Bird(),
                      //bee
                      Bee(),
                      Spacer(),
                    ],
                  ),
                  //cloud
                  const Cloud(),
                ],
              ),
            ],
          ),
          const Mill(),
          const FllowersPlacing()
        ],
      ),
    );
  }
}