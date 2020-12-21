import 'package:flutter/material.dart';
import 'package:minhaLoja/providers/cart.dart';
import 'package:minhaLoja/widgets/badge.dart';
import 'package:minhaLoja/widgets/product_grid.dart';
import 'package:provider/provider.dart';

enum FilterOptions { Favorite, All, NotFavorite }

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showFavoriteOnly = false;
  @override
  Widget build(BuildContext context) {
    // final ProductsProvider products = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Minha Loja',
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorite) {
                    _showFavoriteOnly = true;
                  } else if (selectedValue == FilterOptions.NotFavorite) {
                    _showFavoriteOnly = false;
                  } else {
                    _showFavoriteOnly = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text('Somente Favoritos'),
                  value: FilterOptions.Favorite,
                ),
                PopupMenuItem(
                  child: Text('Sem Favoritos'),
                  value: FilterOptions.NotFavorite,
                ),
                PopupMenuItem(
                  child: Text('Todos'),
                  value: FilterOptions.All,
                ),
              ],
            ),
            Consumer<Cart>(
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: null,
              ),
              builder: (ctx, cart, child) => Badge(
                value: cart.itemCount.toString(),
                child: child,
              ),
            )
          ],
        ),
        body: ProdutcGrid(_showFavoriteOnly));
  }
}
