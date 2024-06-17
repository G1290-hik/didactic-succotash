import 'package:animation_playground/implicit_examples/implicitly_animated_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ImplicitlyAnimatedScreen(),
    );
  }
}
