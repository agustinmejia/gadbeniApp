import 'package:flutter/material.dart';

class CardNews extends StatelessWidget {
  String title = "";
  String description = "";
  String pathImage = "";
  CardNews(this.title, this.description, this.pathImage);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          shape: BoxShape.rectangle,
          border: Border.all(width: 1, color: Colors.black26),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black38, blurRadius: 15, offset: Offset(0, 7))
          ]),
      child: Row(children: [
        Container(
          height: 120.0,
          width: 150.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(pathImage),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10))),
        ),
        Container(
          // alignment: ,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 13,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600),
              ),
              Text(
                description,
                style: const TextStyle(
                    fontSize: 12,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF56575a)),
              )
            ],
          ),
        )
      ]),
    );
  }
}
