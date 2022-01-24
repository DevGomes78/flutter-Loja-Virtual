import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:teste_scafold/class/produto.dart';
import 'package:teste_scafold/components/custon_text.dart';
import 'package:teste_scafold/provider/produto_provider.dart';
import 'package:intl/intl.dart';

class Detalhes extends StatelessWidget {
  final Produto produto;

  Detalhes({required this.produto});


  @override
  Widget build(BuildContext context) {

    final botton = Provider.of<ProdutoProvider>(context);
    final provider = Provider.of<ProdutoProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Detalhes do produto',style: AppTextStyle.text4Font24,),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Image.network(produto.img.toString(),height: 150,width: 290,),
              SizedBox(
                height: 20,
              ),
              Text(
                produto.nome.toString(),
                style: AppTextStyle.text1Font22,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  NumberFormat('R\$ #.00', 'pt-BR').format (produto.valor),
                style: AppTextStyle.text5Font18,
              ),
              SizedBox(
                height: 120,
              ),
              GestureDetector(
                onTap: (){

                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue,
                  ),
                  child:  Row(
                    mainAxisAlignment:  MainAxisAlignment.center,
                    children: [
                      Text('Adicionar ao Carrinho',
                        style: AppTextStyle.text6Font22,),
                    ],
                  ),
                ),
              ),
            ],
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
