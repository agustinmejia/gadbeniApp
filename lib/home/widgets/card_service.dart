import 'package:flutter/material.dart';

class CardService extends StatelessWidget {
  String title = "";
  String pathImage = "";
  CardService(this.title, this.pathImage);
  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: 150,
      width: 230,
      margin: const EdgeInsets.only(top: 10, left: 20),
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
      alignment: const Alignment(-0.6, 0.8),
      children: <Widget>[
        card,
        Container(
            decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(5.0)),
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, top: 2, right: 10, bottom: 2),
                child: Text(title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Monstserrat'))))
      ],
    );
  }
}
