import 'package:flutter/material.dart';

import '../models/productModel.dart';

class ShoppingCartWidget extends InheritedWidget {
  List<ProductModel> products = [];

  ShoppingCartWidget({required super.child});

  int get count => products.length;

  double get total {
    double totalValue = 0;

    products.forEach((element) {
      totalValue = totalValue + element.cost;
    });

    return totalValue;
  }

  @override
  bool updateShouldNotify(ShoppingCartWidget oldWidget) {
    return oldWidget.products.length != this.products.length;
  }

  static ShoppingCartWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShoppingCartWidget>();
  }

  addToCart(ProductModel product) {
    this.products.add(product);
  }
}