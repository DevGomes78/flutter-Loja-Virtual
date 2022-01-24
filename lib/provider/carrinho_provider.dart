import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:teste_scafold/class/carrinho_item.dart';
import 'package:teste_scafold/class/produto.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items.length;
  }

//  double get totalAmount {
  // double total = 0.0;
  //  _items.forEach((key, cartItem) {
  // total += cartItem.preco * cartItem.qtde;
  // });
  // return total;
  //}

  void addItem(Produto produto) {

      _items.putIfAbsent(
        produto.id.toString(),
        () => CartItem(
          id: Random().nextDouble().toInt(),
          produtoId: produto.id.toString(),
          nome: produto.nome.toString(),
          qtde: 1,
          preco: produto.valor.toString(),
          img: produto.img.toString(),
        ),
      );
      notifyListeners();
    }



  void removeItem(String, produtoId) {
    _items.remove(produtoId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
