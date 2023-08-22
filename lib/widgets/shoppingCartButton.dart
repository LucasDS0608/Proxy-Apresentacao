import 'package:proxyexample/screens/shoppingCartScreens.dart';
import 'package:proxyexample/widgets/shoppingCartWidget.dart';
import 'package:flutter/material.dart';

class ShoppingCartButton extends StatelessWidget {
  const ShoppingCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    int cartCount = 0;

    if (ShoppingCartWidget.of(context) != null)
      cartCount = ShoppingCartWidget.of(context)!.count;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShoppingCartScreen()));
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.shopping_bag_outlined),
          Padding(
            padding: const EdgeInsets.all(8.0),
          )
        ],
      ),
    );
  }
}
