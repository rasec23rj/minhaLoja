import 'package:flutter/material.dart';
import 'package:minhaLoja/providers/products_provider.dart';
import 'package:minhaLoja/widgets/products_item.dart';
import 'package:provider/provider.dart';

class ProdutcGrid extends StatelessWidget {
  final bool showFavoriteOnly;
  ProdutcGrid(this.showFavoriteOnly);
  @override
  Widget build(BuildContext context) {
    //local
    final providerProducts = Provider.of<ProductsProvider>(context);
    //final products = providerProducts;
    final products = showFavoriteOnly
        ? providerProducts.itemsProdutosFavorite
        : providerProducts.itemsProdutos;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProducstItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
