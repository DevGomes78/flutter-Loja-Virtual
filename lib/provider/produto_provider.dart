import 'package:flutter/material.dart';
import 'package:teste_scafold/class/produto.dart';
import 'package:teste_scafold/dados/dados.dart';

class ProdutoProvider extends ChangeNotifier {

  int _currentIndex = 0;
  int _counter = 1;
  int qtde = 1;
  double valorTotal = 0;

  int get counter =>_counter;

  void increment(){
    _counter++;
    notifyListeners();
  }

  void decrement(){
    _counter--;
    if(_counter < 0){
      _counter = 0;
    }
    notifyListeners();
  }

 int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  List<Produto> _items = listaProduto;
  List<Produto> get items => [..._items];


  List<Produto> get ItemsFavorito =>
      _items.where((prod) => prod.isFavorito).toList();

  void favoritosOnly() {
    _items.where((prod) => prod.isFavorito).toList();
    notifyListeners();
  }

  List<Produto> get ItemsCompra =>
      _items.where((prod) => prod.isCompra).toList();

  void comprasOnly() {
    _items.where((prod) => prod.isCompra).toList();
    notifyListeners();
  }

  List<Produto>? carregaProdutos(Categorias categoria) {
    if (categoria == Categorias.todos) {
      return listaProduto;
    } else if (categoria == Categorias.feminino) {
      return listaProduto
          .where((p) => p.categoria == Categorias.feminino.toString())
          .toList();
    } else if (categoria == Categorias.masculino) {
      return listaProduto
          .where((p) => p.categoria == Categorias.masculino.toString())
          .toList();
    } else if (categoria == Categorias.infantil) {
      return listaProduto
          .where((p) => p.categoria == Categorias.infantil.toString())
          .toList();
    }
  }
}
