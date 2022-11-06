import 'package:flutter/material.dart';

// Widgets
import 'package:gadbeni/widgets/card_horizontal.dart';

class CardNewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 70),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Noticias",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                fontFamily: 'Monstserrat'),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              CardHorizontal(
                  "Lorem ipsum dolor",
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                  "assets/img/services/servicios.jpg"),
              CardHorizontal(
                  "consectetur adipiscing",
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                  "assets/img/services/turismo.jpg"),
              CardHorizontal(
                  "ed do eiusmod tempor, consectetur",
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                  "assets/img/services/denuncias.jpg")
            ],
          )
        ],
      ),
    );
  }
}
