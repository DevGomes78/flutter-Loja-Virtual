import 'package:flutter/material.dart';
import 'package:teste_scafold/components/custon_text.dart';
import 'lista_fem.dart';
import 'lista_masc.dart';

Widget CustonBody(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Coleção Masculino', style: AppTextStyle.text1Font22),
        SizedBox(
          height: 10,
        ),
        //aqui esta a lista masculina
        Masc(context),
        SizedBox(
          height: 10,
        ),
        Text(
          'Coleção Feminina',
          style: AppTextStyle.text1Font22,
        ),
        SizedBox(
          height: 10,
        ),
        //aqui esta a lista feminina
        ListaFem(context),
      ],
    ),
  );
}
