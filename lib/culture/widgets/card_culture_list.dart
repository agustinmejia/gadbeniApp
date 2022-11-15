import 'package:flutter/material.dart';

// Widgets
import 'package:gadbeni/culture/views/culture_details.dart';

// Widgets
import 'package:gadbeni/widgets/card_horizontal.dart';

class CardCultureList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CultureDetails(
                          "Macheteros", "assets/img/culture/macheteros.jpg")));
            },
            child: CardHorizontal(
                "Macheteros",
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                "assets/img/culture/macheteros.jpg"),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CultureDetails(
                          "Judas", "assets/img/culture/judas.jpg")));
            },
            child: CardHorizontal(
                "Judas",
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                "assets/img/culture/judas.jpg"),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CultureDetails(
                          "Tobas", "assets/img/culture/tobas.jpg")));
            },
            child: CardHorizontal(
                "Tobas",
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                "assets/img/culture/tobas.jpg"),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CultureDetails(
                          "Achus", "assets/img/culture/achus.jpg")));
            },
            child: CardHorizontal(
                "Achus",
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                "assets/img/culture/achus.jpg"),
          )
        ],
      ),
    );
  }
}
