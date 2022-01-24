import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_scafold/components/custon_text.dart';
import 'package:teste_scafold/provider/produto_provider.dart';
import 'package:teste_scafold/rotas/rotas.dart';
import 'package:teste_scafold/screens/body.dart';
import 'components/promocao.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final botton = Provider.of<ProdutoProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Gomes Calçados',
          style: AppTextStyle.text1Font22,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Rotas.ItemsCarrinho);
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text(
                'Acesse sua Conta!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Conta'),
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favoritos'),
              onTap: () {
                Navigator.of(context).pushNamed(Rotas.ItemsFavoritos);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuraçoes'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PromoCard(),
            CustonBody(context),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: botton.currentIndex,
        onTap: (index) {
          botton.currentIndex = index;
        },
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favoritos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            title: Text('Carrinho'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Conta'),
          ),
        ],
      ),
    );
  }
}
