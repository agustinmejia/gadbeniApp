import 'package:flutter/material.dart';

// Widgets
import 'package:gadbeni/tourism/views/place_details.dart';
import 'card_place.dart';

class CardPlacesList extends StatelessWidget {
  String title = "";
  CardPlacesList(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 50, bottom: 50),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 30,
                fontWeight: FontWeight.w500,
                fontFamily: 'Monstserrat'),
          ),
          const SizedBox(height: 10),
          Container(
            height: 200,
            child: ListView(
              padding: const EdgeInsets.all(5),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlaceDetails(
                                "Chuchini", "assets/img/places/chuchini.jpg")));
                  },
                  child: CardPlace("Chuchini", "Lugar turístico de Trinidad",
                      "assets/img/places/chuchini.jpg"),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlaceDetails("Loma Suarez",
                                "assets/img/places/loma-suarez.jpg")));
                  },
                  child: CardPlace("Loma Suarez", "Lugar turístico de Trinidad",
                      "assets/img/places/loma-suarez.jpg"),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlaceDetails("Tomichucua",
                                "assets/img/places/tomichucua.jpeg")));
                  },
                  child: CardPlace("Tomichucua", "Lugar turístico de Riberalta",
                      "assets/img/places/tomichucua.jpeg"),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlaceDetails(
                                "Itauba", "assets/img/places/itauba.jpeg")));
                  },
                  child: CardPlace("Itauba", "Balneario en Guayaramerín",
                      "assets/img/places/itauba.jpeg"),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlaceDetails("Laguna Suarez",
                                "assets/img/places/laguna-suarez.jpg")));
                  },
                  child: CardPlace(
                      "Laguna Suarez",
                      "Lugar turístico de Trinidad",
                      "assets/img/places/laguna-suarez.jpg"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
