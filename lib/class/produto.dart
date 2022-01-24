import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Produto extends ChangeNotifier {
  final String? img;
  final String? nome;
  final String? descricao;
  final double? valor;
  final String? categoria;
  late final double? valorTotal;
  final int? id;
  int qtde= 1;

  bool isFavorito;
  bool isCompra;

  Produto({
    this.valorTotal,
    this.img,
    this.nome,
    this.descricao,
    this.valor,
    this.categoria,
    this.id,
    this.isFavorito = false,
    this.isCompra = false,
  });

  void total(int qtde,double valor) {
  valorTotal = qtde * valor;
    notifyListeners();

  }

  void toggleIsfavorito() {
    isFavorito = !isFavorito;
    notifyListeners();
  }

  void toggleIscompra() {
    isCompra = !isCompra;
    notifyListeners();
  }

  String getCurrency() {
    NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return formatter.format(valor);
  }

}




enum Categorias {
  todos,
  feminino,
  roupas,
  infantil,
  masculino,
  adulto,
  tenis,
}
