import 'package:flutter/material.dart';

class BackgroundImageNetworkTop extends StatelessWidget {
  String pathImage = "";
  BackgroundImageNetworkTop(this.pathImage);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 270.0, //Tamaño del Appbar
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(pathImage)),
          ),
          alignment: const Alignment(-0.9, -0.55),
        )
      ],
    );
  }
}
