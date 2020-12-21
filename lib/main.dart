import 'package:flutter/material.dart';
import 'package:minhaLoja/providers/cart.dart';
import 'package:minhaLoja/providers/products_provider.dart';
import 'package:minhaLoja/utils/app_routes.dart';
import 'package:minhaLoja/views/product_detail_screen.dart';
import 'package:minhaLoja/views/products_overview_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => new Cart(),
        )
      ],
      child: MaterialApp(
          title: 'Minha Loja',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: ProductOverviewScreen(),
          routes: {
            AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailScreen(),
          }),
    );
  }
}
