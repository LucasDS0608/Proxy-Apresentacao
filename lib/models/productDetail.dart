import 'package:proxyexample/models/productModel.dart';
import 'package:proxyexample/widgets/shoppingCartWidget.dart';
import 'package:flutter/material.dart';

import '../widgets/shoppingCartButton.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel product;

  const ProductDetail({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        actions: [ShoppingCartButton()],
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            child: Image.network(product.imageURL,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.title,
                  style: TextStyle(fontSize: 34),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.cost.toStringAsFixed(2),
                  style: TextStyle(fontSize: 30, color: Colors.green),
                ),
              ),
            ],
          ),
          ListTile(
            title: Text(
              "descrição",
              style: TextStyle(fontSize: 8),
            ),
            subtitle: Text(
              product.description,
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
          ),
          ListTile(
            title: Text(
              "fabricante",
              style: TextStyle(fontSize: 8),
            ),
            subtitle: Text(
              product.manufactor,
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ElevatedButton(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.shopping_cart_checkout)),
              Text("Adicionar ao carrinho")
            ],
          ),
        ),
        onPressed: () {
          ShoppingCartWidget.of(context)!.addToCart(new ProductModel(
              title: product.title,
              description: product.description,
              manufactor: product.manufactor,
              cost: product.cost,
              imageURL: product.imageURL));

//          Navigator.of(context).pop();
        },
      ),
    );
  }
}
