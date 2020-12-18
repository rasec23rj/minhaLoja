import 'package:flutter/material.dart';
import 'package:minhaLoja/data/dummy_data.dart';
import 'package:minhaLoja/models/product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _listProdutos = DUMMY_PRODUCTS;

  List<Product> get itemsProdutos => [..._listProdutos];

  List<Product> get itemsProdutosFavorite {
    return _listProdutos.where((prod) => prod.isFavorite).toList();
  }

  List<Product> get itemsProdutosNotFavorite {
    return _listProdutos.where((prod) => !prod.isFavorite).toList();
  }

  void addProduct(Product product) {
    _listProdutos.add(product);
    notifyListeners();
  }
}
//provider global
//bool _showFavariteOnly = false;
// List<Product> get itemsProdutos {
//   if (_showFavariteOnly) {
//     return _listProdutos.where((element) => element.isFavorite).toList();
//   }

//   return [..._listProdutos];
// }

// void showFavariteOnly() {
//   _showFavariteOnly = true;
//   notifyListeners();
// }

// void showAll() {
//   _showFavariteOnly = false;
//   notifyListeners();
// }
