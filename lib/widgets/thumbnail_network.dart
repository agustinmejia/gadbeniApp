import 'package:flutter/material.dart';

class ThumbnailNetwork extends StatelessWidget {
  String pathImage = "";
  ThumbnailNetwork(this.pathImage);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 150.0,
      margin: EdgeInsets.only(left: 3),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(pathImage),
            fit: BoxFit.cover,
          ),
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(3)),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black26, blurRadius: 5, offset: Offset(1, 5))
          ]),
    );
  }
}
