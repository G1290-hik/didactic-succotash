import 'package:flutter/material.dart';

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  bool isClicked = false;
  bool isAlignedTop = true;

  void _toggleAlignment() {
    setState(() {
      isAlignedTop = !isAlignedTop;
      isClicked = !isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _toggleAlignment,
        child: AnimatedAlign(
          alignment: isAlignedTop ? Alignment.centerLeft : Alignment.center,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isClicked ? 200 : 80.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: isClicked ? Colors.green : Colors.blue,
              borderRadius: BorderRadius.circular(isClicked ? 30.0 : 10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  isClicked ? Icons.check_sharp : Icons.shopping_cart,
                  color: Colors.white,
                ),
                if (isClicked)
                  const Flexible(
                    child: Text(
                      "Added to Cart",
                      style: TextStyle(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
