import 'package:proxyexample/widgets/productTile.dart';
import 'package:proxyexample/widgets/shoppingCartWidget.dart';
import 'package:proxyexample/screens/comprasScreen.dart';
import 'package:proxyexample/widgets/comprarButton.dart';
import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ShoppingCartWidget cart = ShoppingCartWidget.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho de compras"),
      ),
      body: ListView.builder(
          itemCount: cart.count,
          itemBuilder: (context, index) =>
              ProductTile(product: cart.products[index])),

      bottomNavigationBar: ComprasButton(),
    );
  }
}
