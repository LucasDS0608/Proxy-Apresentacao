import 'package:proxyexample/screens/comprasScreen.dart';
import 'package:proxyexample/widgets/shoppingCartWidget.dart';
import 'package:flutter/material.dart';

class ComprasButton extends StatelessWidget {
  const ComprasButton({super.key});

  @override
  Widget build(BuildContext context) {
    int cartCount = 0;

    if (ShoppingCartWidget.of(context) != null)
      cartCount = ShoppingCartWidget.of(context)!.count;

    return ElevatedButton(
      onPressed: () {
        if(ShoppingCartWidget.of(context)!.total != 0)
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ComprasScreen()));
      },
      child: Text('Comprar'),
    );
  }
}
