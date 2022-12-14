import 'package:flutter/material.dart';

import 'screens/animation_screen.dart';

void main() {
  runApp(const AnimationApp());
}

class AnimationApp extends StatelessWidget {
  const AnimationApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context),
      home: const AnimationScreen(),
    );
  }
}
