import 'package:animation_playground/custom_painter_example/bouncing_ball_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BouncingBallAnimation(),
    );
  }
}
