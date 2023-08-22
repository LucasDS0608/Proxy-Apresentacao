import 'package:proxyexample/models/productDetail.dart';
import 'package:proxyexample/widgets/productTile.dart';
import 'package:proxyexample/widgets/shoppingCartButton.dart';
import 'package:proxyexample/widgets/shoppingCartWidget.dart';
import 'package:flutter/material.dart';

import '../models/productModel.dart';

class HomePage extends StatelessWidget {
  final List<ProductModel> _products = [
    ProductModel(
        title: "Cheetos",
        description: "Lua parmesão",
        manufactor: "Elma Chips",
        cost: 16,
        imageURL:
            "https://superpao.vtexassets.com/arquivos/ids/299301/Salgadinho-Cheetos-De-Milho-Lua-Queijo-Pacote-40G.jpg?v=1778773678"),
    ProductModel(
        title: "Picanha",
        description: "Carne",
        manufactor: "FriBoi",
        cost: 78,
        imageURL:
            "https://media.gazetadopovo.com.br/2023/01/15103216/picanha-960x540.jpg"),
    ProductModel(
        title: "Coca-Cola",
        description: "Refrigerante 2L",
        manufactor: "Coca-Cola",
        cost: 10,
        imageURL:
            "https://io.convertiez.com.br/m/superpaguemenos/shop/products/images/14912/medium/refrigerante-coca-cola-2l_76046.png")
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página Inicial"),
        actions: [
          ShoppingCartButton()
        ],
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) => ProductTile(
            product: _products[index],
            onClick: (product) => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetail(product: product),
                ))),
      ),
    );
  }
}
