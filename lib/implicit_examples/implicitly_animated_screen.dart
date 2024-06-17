import 'package:animation_playground/implicit_examples/widgets/animated_color_pallete.dart';
import 'package:animation_playground/implicit_examples/widgets/animated_opacity_example.dart';
import 'package:animation_playground/implicit_examples/widgets/animated_padding_example.dart';
import 'package:animation_playground/implicit_examples/widgets/animated_physical_model.dart';
import 'package:animation_playground/implicit_examples/widgets/animated_positioned_example.dart';
import 'package:animation_playground/implicit_examples/widgets/animated_rotate_example.dart';
import 'package:animation_playground/implicit_examples/widgets/animated_scale_example.dart';
import 'package:animation_playground/implicit_examples/widgets/animated_shopping_cart_button.dart';
import 'package:animation_playground/implicit_examples/widgets/animated_size_example.dart';
import 'package:animation_playground/implicit_examples/widgets/animated_slide_example.dart';
import 'package:animation_playground/implicit_examples/widgets/animated_switcher_example.dart';
import 'package:animation_playground/implicit_examples/widgets/animated_text_style_example.dart';
import 'package:flutter/material.dart';

class ImplicitlyAnimatedScreen extends StatefulWidget {
  const ImplicitlyAnimatedScreen({super.key});

  @override
  _ImplicitlyAnimatedScreenState createState() =>
      _ImplicitlyAnimatedScreenState();
}

class _ImplicitlyAnimatedScreenState extends State<ImplicitlyAnimatedScreen> {
  bool _first = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Implicit Animations"),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                const Divider(),
                const Text(
                  "# Animated Container",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: const AnimatedColorPalette(),
                ),
                const Divider(),
                const Text(
                  "# Animated Align",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: constraints.maxHeight * 0.3,
                  child: const ShoppingCartButton(),
                ),
                const Divider(),
                const Text(
                  "# Animated DefaultTextStyle",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                Container(
                  alignment: Alignment.center,
                  height: constraints.maxHeight * 0.2,
                  child: AnimatedText(),
                ),
                const Divider(),
                const Text(
                  "# Animated Scale",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: constraints.maxHeight * 0.3,
                  child: const LogoScale(),
                ),
                const Divider(),
                const Text(
                  "# Animated Rotate",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: constraints.maxHeight * 0.3,
                  child: const LogoRotate(),
                ),
                const Divider(),
                const Text(
                  "# Animated Slide",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: constraints.maxHeight * 0.4,
                  child: const AnimatedSlideExample(),
                ),
                const Divider(),
                const Text(
                  "# Animated Opacity",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: constraints.maxHeight * 0.4,
                  child: const LogoFade(),
                ),
                const Divider(),
                const Text(
                  "# Animated Padding",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: const AnimatedPaddingExample(),
                ),
                const Divider(),
                const Text(
                  "# Animated PhysicalModel",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: const AnimatedPhysicalModelExample(),
                ),
                const Divider(),
                const Text(
                  "# Animated Positioned",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: const AnimatedPositionedExample(),
                ),
                const Divider(),
                const Text(
                  "# Animated CrossFade",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                Container(
                  padding: const EdgeInsets.only(top: 30),
                  height: constraints.maxHeight * 0.2,
                  child: AnimatedCrossFade(
                    duration: const Duration(milliseconds: 600),
                    firstChild: const FlutterLogo(
                        style: FlutterLogoStyle.horizontal, size: 100.0),
                    secondChild: const FlutterLogo(
                        style: FlutterLogoStyle.stacked, size: 100.0),
                    crossFadeState: _first
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _first = !_first;
                    });
                  },
                  child: const Text('Toggle CrossFade'),
                ),
                const Divider(),
                const Text(
                  "# Animated Switcher",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: constraints.maxHeight * 0.2,
                  child: const AnimatedSwitcherExample(),
                ),
                const Divider(),
                const Text(
                  "# Animated Size",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                Container(
                  padding: const EdgeInsets.all(12),
                  height: constraints.maxHeight * 0.3,
                  child: const AnimatedSizeExample(),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
