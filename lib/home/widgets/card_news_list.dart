import 'package:flutter/material.dart';

// Widgets
import 'card_news.dart';

class CardNewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Text(
            "Noticias",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                fontFamily: 'Monstserrat'),
          ),
          Column(
            children: [
              CardNews(
                  "Servicios",
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                  "assets/img/services/servicios.jpg"),
              CardNews(
                  "Turismo",
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                  "assets/img/services/turismo.jpg")
            ],
          )
        ],
      ),
    );
  }
}
