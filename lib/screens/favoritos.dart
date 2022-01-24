import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_scafold/components/custon_text.dart';
import 'package:teste_scafold/provider/produto_provider.dart';
import 'package:intl/intl.dart';

class Favoritos extends StatelessWidget {
  const Favoritos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final favoritosProvider = Provider.of<ProdutoProvider>(context);
    final botton = Provider.of<ProdutoProvider>(context);
    final listafavoritos = favoritosProvider.ItemsFavorito;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Favoritos',
          style: AppTextStyle.text4Font24,
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
          itemCount: listafavoritos.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 0.0),
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child:
                          Container(
                            height: 80,
                              width: 90,
                              child: Image.network((listafavoritos[index].img.toString()))),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
                        child: Text(
                          listafavoritos[index].nome.toString(),
                          style: AppTextStyle.text1Font22,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
                        child: Text(
                            NumberFormat('R\$ #.00', 'pt-BR').format (listafavoritos[index].valor),
                          style: AppTextStyle.text7Font16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
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
