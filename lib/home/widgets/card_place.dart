import 'package:flutter/material.dart';

class CardPlace extends StatelessWidget {
  String title = "";
  String description = "";
  String pathImage = "";
  CardPlace(this.title, this.description, this.pathImage);
  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: 180,
      width: 250,
      margin: const EdgeInsets.only(top: 10, left: 20, bottom: 10),
      decoration: BoxDecoration(
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImage)),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          shape: BoxShape.rectangle,
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black38, blurRadius: 15, offset: Offset(0, 7))
          ]),
    );

    return Stack(
      alignment: const Alignment(1, 0.8),
      children: <Widget>[
        card,
        Container(
            width: 250,
            height: 60,
            decoration: const BoxDecoration(
              color: Colors.black54,
            ),
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, top: 2, right: 10, bottom: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: const TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Monstserrat')),
                    Text(description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: const TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Monstserrat'))
                  ],
                )))
      ],
    );
  }
}
