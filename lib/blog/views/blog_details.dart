import 'package:flutter/material.dart';

// Widgets
import 'package:gadbeni/widgets/background_image_top.dart';

class BlogDetails extends StatelessWidget {
  String title = "";
  String imagePath = "";
  String descriptionDummy =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. \n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";
  BlogDetails(this.title, this.imagePath);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          BackgroundImageTop(imagePath),
          ListView(
            children: <Widget>[
              DescriptionService(title, descriptionDummy),
            ],
          ),
        ],
      ),
    );
  }
}

double? width;
double? height;

class DescriptionService extends StatelessWidget {
  String namePlace;
  String descriptionPlace;

  DescriptionService(this.namePlace, this.descriptionPlace);

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.shortestSide;
    height = MediaQuery.of(context).size.longestSide;
    final titleStars = Row(
      children: <Widget>[
        Container(
          width: (width! - 50.0),
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Text(
            namePlace,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
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

    final footer = Container(
      alignment: Alignment.centerRight,
      margin:
          const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0, bottom: 50),
      child: Text(
        "Sábado, 05 de Noviembre de 2022",
        style: const TextStyle(
            decoration: TextDecoration.none,
            fontFamily: "Montserrat",
            fontSize: 13.0,
            fontWeight: FontWeight.normal,
            color: Colors.black45),
      ),
    );

    return Column(
      children: [
        const SizedBox(height: 220),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[titleStars, description, description, footer],
          ),
        )
      ],
    );
  }
}
