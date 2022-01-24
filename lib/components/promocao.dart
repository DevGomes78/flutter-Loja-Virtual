import 'package:flutter/material.dart';
import 'package:teste_scafold/dados/promo.dart';
import 'custon_text.dart';
import 'package:intl/intl.dart';

Widget PromoCard() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueAccent,
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 30,
            width: 200,
            child: Column(
              children: ListaPromo.map((i) => Text(
                    i.titulo.toString(),
                    style: AppTextStyle.text4Font24,
                  )).toList(),
            ),
          ),
          Positioned(
            left: 20,
            top: 120,
            width: 200,
            child: Column(
              children: ListaPromo.map((i) => Text(
                    i.promo.toString(),
                    style: AppTextStyle.text6Font22,
                  )).toList(),
            ),
          ),
          Positioned(
            left: 230,
            top: 30,
            child: Column(
              children: ListaPromo.map((i) => Image.network(
                    i.img.toString(),
                    height: 150,
                  )).toList(),
            ),
          ),
        ],
      ),
    ),
  );
}
