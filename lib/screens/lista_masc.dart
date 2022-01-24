import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_scafold/class/produto.dart';
import 'package:teste_scafold/components/custon_text.dart';
import 'package:teste_scafold/provider/produto_provider.dart';
import 'package:teste_scafold/screens/detalhaes.dart';
import 'package:intl/intl.dart';

Widget Masc(BuildContext context) {
  final provider = Provider.of<ProdutoProvider>(context);
  final produto = Provider.of<Produto>(context);


  final listaMasc = provider.carregaProdutos(Categorias.masculino);

  return Container(
    height: 210,
    width: double.infinity,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: listaMasc!.length,
      itemBuilder: (context, index) => ChangeNotifierProvider(
        create: (context) => listaMasc[index],
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 3),
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xffB0D2E7FF),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Detalhes(produto: listaMasc[index])));
                },
                child: Image.network(
                  listaMasc[index].img.toString(),
                  height: 100,
                  width: 100,
                ),
              ),
              Text(
                listaMasc[index].nome.toString(),
                style: AppTextStyle.text3Font16,
              ),
              Text(

             // produto.getCurrency() ,
                NumberFormat('R\$ #.00', 'pt-BR').format(listaMasc[index].valor),
                style: AppTextStyle.text5Font18,
              ),
              Divider(
                color: Colors.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<Produto>(
                    builder: (context, produto, child) => IconButton(
                      onPressed: () {
                        produto.toggleIsfavorito();
                        if (produto.isFavorito) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  const Text('Adicionado aos Favoritos!')));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text('Removido dos Favoritos!')));
                        }
                      },
                      icon: Icon(produto.isFavorito
                          ? Icons.favorite
                          : Icons.favorite_border),
                      color: Colors.red,
                    ),
                  ),
                  Consumer<Produto>(
                    builder: (context,produto,child)=>
                     IconButton(
                      onPressed: () {
                       produto.toggleIscompra();
                       if (produto.isCompra) {
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                             content:
                             const Text('Adicionado ao Carrinho!')));
                       } else {
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                             content: const Text('Removido do Carrinho!')));
                       }
                      },
                      icon: Icon(produto.isCompra?
                          Icons.shopping_cart:
                          Icons.shopping_cart_outlined
                      ),
                       color: Colors.red,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
