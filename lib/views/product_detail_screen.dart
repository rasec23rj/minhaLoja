import 'package:flutter/material.dart';
import 'package:minhaLoja/providers/product.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen();
  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context).settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
