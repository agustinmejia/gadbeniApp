import 'package:flutter/material.dart';

// Widgets
import 'package:gadbeni/tourism/views/place_details.dart';

// Widgets
import 'package:gadbeni/widgets/card_horizontal.dart';

class CardPlacesList extends StatelessWidget {
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
                      builder: (context) => PlaceDetails("Laguna Suarez",
                          "assets/img/places/loma-suarez.jpg")));
            },
            child: CardHorizontal(
                "Loma Suarez",
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                "assets/img/places/loma-suarez.jpg"),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PlaceDetails("Laguna Suarez",
                          "assets/img/places/laguna-suarez.jpg")));
            },
            child: CardHorizontal(
                "Laguna Suarez",
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                "assets/img/places/laguna-suarez.jpg"),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PlaceDetails(
                          "Tomichucua", "assets/img/places/tomichucua.jpeg")));
            },
            child: CardHorizontal(
                "Tomichucua",
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                "assets/img/places/tomichucua.jpeg"),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PlaceDetails("Itauba Eco-Resort",
                          "assets/img/places/itauba.jpeg")));
            },
            child: CardHorizontal(
                "Itauba Eco-Resort",
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                "assets/img/places/itauba.jpeg"),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PlaceDetails(
                          "Chuchini", "assets/img/places/chuchini.jpg")));
            },
            child: CardHorizontal(
                "Chuchini",
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                "assets/img/places/chuchini.jpg"),
          )
        ],
      ),
    );
  }
}
