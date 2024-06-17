import 'package:animation_playground/explicit_examples/loading_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RadialProgressAnimation(progress: .75, color: Colors.blueGrey),
    );
  }
}
