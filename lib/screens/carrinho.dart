import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_scafold/class/produto.dart';
import 'package:teste_scafold/components/custon_text.dart';
import 'package:teste_scafold/provider/produto_provider.dart';
import 'package:intl/intl.dart';

class Carrinho extends StatelessWidget {
  double? teste;

  @override
  Widget build(BuildContext context) {
    final botton = Provider.of<ProdutoProvider>(context);
    // final botton1 = Provider.of<Produto>(context);

    final listaCompra = botton.ItemsCompra;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Carrinho', style: AppTextStyle.text4Font24),
        centerTitle: true,
      ),
      body: buildContainer(listaCompra, botton),
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

  buildContainer(
    List<Produto> listaCompra,
    ProdutoProvider botton,
  ) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: ListView.builder(
        itemCount: listaCompra.length,
        itemBuilder: (context, index) {
          teste = (botton.counter.toDouble() *
              listaCompra[index].valor!.toDouble());
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 5,
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 0.0),
                            height: 70,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                  height: 80,
                                  width: 80,
                                  child: Image.network(
                                      (listaCompra[index].img.toString()))),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Column(
                        children: [
                          Text(
                            listaCompra[index].nome.toString(),
                            style: AppTextStyle.text1Font22,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Card(
                    elevation: 5,
                    child: Container(
                      height: 50,
                      color: Color(0xffB0D2E7FF),
                      width: double.infinity,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              botton.decrement();
                              teste = (botton.counter.toDouble() *
                                  listaCompra[index].valor!.toDouble());
                            },
                            icon: Icon(Icons.remove),
                          ),
                          IconButton(
                            onPressed: () {
                              botton.increment();
                              teste = (botton.counter.toDouble() *
                                  listaCompra[index].valor!);
                            },
                            icon: Icon(Icons.add),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'x',
                            style: AppTextStyle.text5Font18,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            botton.counter.toString(),
                            style: AppTextStyle.text2Font20,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Total',
                            style: AppTextStyle.text5Font18,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            NumberFormat('R\$ #.00', 'pt-BR').format(teste),
                            style: AppTextStyle.text2Font20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
