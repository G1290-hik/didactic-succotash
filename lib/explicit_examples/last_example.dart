import 'package:flutter/material.dart';

class LastExplicitExample extends StatefulWidget {
  const LastExplicitExample({super.key});

  @override
  State<LastExplicitExample> createState() => _LastExplicitExampleState();
}

class _LastExplicitExampleState extends State<LastExplicitExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double smallLogo = 100;
    const double bigLogo = 200;

    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final Size biggest = constraints.biggest;
          return Stack(
            children: <Widget>[
              PositionedTransition(
                rect: RelativeRectTween(
                  begin: RelativeRect.fromSize(
                    const Rect.fromLTWH(0, 0, smallLogo, smallLogo),
                    biggest,
                  ),
                  end: RelativeRect.fromSize(
                    Rect.fromLTWH(biggest.width - bigLogo,
                        biggest.height - bigLogo, bigLogo, bigLogo),
                    biggest,
                  ),
                ).animate(CurvedAnimation(
                  parent: _controller,
                  curve: Curves.elasticInOut,
                )),
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: FlutterLogo(),
                ),
              ),
              Center(
                child: RotationTransition(
                  turns: _animation,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FlutterLogo(size: 150.0),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
