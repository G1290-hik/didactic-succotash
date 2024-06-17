import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({super.key});

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  bool _toggled = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _toggled = !_toggled;
        });
      },
      child: AnimatedDefaultTextStyle(
        duration: const Duration(seconds: 1),
        style: _toggled
            ? const TextStyle(
                fontSize: 40.0,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              )
            : const TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
        child: const Text('Tap to animate text style!'),
      ),
    );
  }
}
