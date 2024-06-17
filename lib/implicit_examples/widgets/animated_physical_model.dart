import 'package:flutter/material.dart';

class AnimatedPhysicalModelExample extends StatefulWidget {
  const AnimatedPhysicalModelExample({super.key});

  @override
  _AnimatedPhysicalModelExampleState createState() =>
      _AnimatedPhysicalModelExampleState();
}

class _AnimatedPhysicalModelExampleState
    extends State<AnimatedPhysicalModelExample> {
  bool _isElevated = false;

  void _onEnter(PointerEvent details) {
    setState(() {
      _isElevated = true;
    });
  }

  void _onExit(PointerEvent details) {
    setState(() {
      _isElevated = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: AnimatedPhysicalModel(
        duration: const Duration(seconds: 1),
        curve: Curves.linear,
        elevation: _isElevated ? 50.0 : 0.0,
        shape: BoxShape.rectangle,
        shadowColor: Colors.black,
        color: Colors.blue,
        borderRadius:
            _isElevated ? BorderRadius.circular(100) : BorderRadius.circular(0),
        child: Container(
          height: 200.0,
          width: 200.0,
          color: Colors.blue,
          child: const Center(
            child: Text(
              'Hover over me!',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
