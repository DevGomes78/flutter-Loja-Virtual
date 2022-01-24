import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_scafold/provider/carrinho_provider.dart';
import 'package:teste_scafold/provider/produto_provider.dart';
import 'package:teste_scafold/rotas/rotas.dart';
import 'package:teste_scafold/screens/carrinho.dart';
import 'package:teste_scafold/screens/detalhaes.dart';
import 'package:teste_scafold/screens/favoritos.dart';
import 'class/produto.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProdutoProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Produto(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          Rotas.HOME: (context) => HomePage(),
          Rotas.ItemsCarrinho: (context) => Carrinho(),
          Rotas.ItemsFavoritos: (context) => Favoritos(),
        },
      ),
    );
  }
}
