import 'package:flutter/material.dart';

double? width;
double? height;

class DescriptionView extends StatelessWidget {
  String title;
  String description;

  DescriptionView(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.shortestSide;
    height = MediaQuery.of(context).size.longestSide;
    return Column(
      children: [
        const SizedBox(height: 220),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  width: (width! - 20),
                  child: Text(
                    title,
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
              ),
              Container(
                margin:
                    const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Text(
                  description,
                  style: const TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: "Montserrat",
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF56575a)),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
