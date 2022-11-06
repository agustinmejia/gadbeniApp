import 'package:flutter/material.dart';

// Widgets
import 'package:gadbeni/widgets/background_image_top.dart';

class ServiceLegalStatus extends StatelessWidget {
  String descriptionDummy =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. \n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          BackgroundImageTop(
              "assets/img/services/services_list/personeria.jpg"),
          ListView(
            children: <Widget>[
              DescriptionService("Personería jurídica", 4, descriptionDummy),
            ],
          ),
        ],
      ),
    );
  }
}

class DescriptionService extends StatelessWidget {
  String namePlace;
  int stars;
  String descriptionPlace;

  DescriptionService(this.namePlace, this.stars, this.descriptionPlace);

  @override
  Widget build(BuildContext context) {
    final titleStars = Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Text(
            namePlace,
            style: const TextStyle(
              decoration: TextDecoration.none,
              fontFamily: "Montserrat",
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );

    final description = Container(
      margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Text(
        descriptionPlace,
        style: const TextStyle(
            decoration: TextDecoration.none,
            fontFamily: "Montserrat",
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            color: Color(0xFF56575a)),
      ),
    );

    return Column(
      children: [
        const SizedBox(height: 200),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[titleStars, description],
          ),
        )
      ],
    );
  }
}
