import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_scafold/class/produto.dart';
import 'package:teste_scafold/components/custon_text.dart';
import 'package:teste_scafold/provider/produto_provider.dart';
import 'package:teste_scafold/screens/detalhaes.dart';
import 'package:intl/intl.dart';

Widget ListaFem(BuildContext context) {
  final provider = Provider.of<ProdutoProvider>(context);

  final listaFem = provider.carregaProdutos(Categorias.feminino);

  return Container(
    height: 200,
    width: double.infinity,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: listaFem!.length,
      itemBuilder: (context, index) => ChangeNotifierProvider(
        create: (context) => listaFem[index],
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
                              Detalhes(produto: listaFem[index])));
                },
                child: Image.network(
                  listaFem[index].img.toString(),
                  height: 90,
                  width: 90,
                ),
              ),
              Text(
                listaFem[index].nome.toString(),
                style: AppTextStyle.text3Font16,
              ),
              Text(
                NumberFormat('R\$ #.00', 'pt-BR').format(listaFem[index].valor),
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
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart_outlined,
                      color: Colors.red,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
