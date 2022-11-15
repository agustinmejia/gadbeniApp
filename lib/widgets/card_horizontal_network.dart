import 'package:flutter/material.dart';

double? width;
double? height;

class CardHorizontalNetwork extends StatelessWidget {
  String title = "";
  String description = "";
  String pathImage = "";
  CardHorizontalNetwork(this.title, this.description, this.pathImage);
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.shortestSide;
    height = MediaQuery.of(context).size.longestSide;
    return Container(
      height: 125,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
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
                image: NetworkImage(pathImage),
                fit: BoxFit.cover,
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
              SizedBox(
                width: (width! - 220.0),
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: const TextStyle(
                      fontSize: 15,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: (width! - 220.0),
                child: Text(
                  description,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: const TextStyle(
                      fontSize: 12,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF56575a)),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
