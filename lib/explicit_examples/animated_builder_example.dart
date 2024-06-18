import 'package:flutter/material.dart';

//Use AnimatedModalBarrier as well : )
class RadialProgressAnimation extends StatefulWidget {
  final double progress;
  final Color color;

  const RadialProgressAnimation({
    super.key,
    required this.progress,
    required this.color,
  });

  @override
  State<RadialProgressAnimation> createState() =>
      _RadialProgressAnimationState();
}

class _RadialProgressAnimationState extends State<RadialProgressAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animate;
  late Animation<Color?> modalBarrierColor;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animate = Tween(begin: 0.0, end: widget.progress).animate(controller);
    modalBarrierColor =
        ColorTween(begin: Colors.transparent, end: Colors.black54)
            .animate(controller);

    controller.forward();

    // Adding listener to rebuild the widget when animation status changes
    controller.addStatusListener((status) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: AnimatedBuilder(
              animation: animate,
              builder: (context, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: CircularProgressIndicator(
                        value: animate.value,
                        strokeWidth: 10,
                        backgroundColor: Colors.grey.shade300,
                        color: widget.color,
                      ),
                    ),
                    Text(
                      '${(animate.value * 100).toInt()}%',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Stack(
        alignment: Alignment.bottomRight,
        children: [
          FloatingActionButton(
            onPressed: controller.isAnimating
                ? null
                : () {
                    controller.reset();
                    controller.forward();
                  },
            child: const Icon(Icons.start),
          ),
          if (controller.isAnimating)
            AnimatedModalBarrier(
              color: modalBarrierColor,
              dismissible: false,
            ),
        ],
      ),
    );
  }
}
