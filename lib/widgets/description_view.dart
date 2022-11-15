import 'package:flutter/material.dart';

class DescriptionView extends StatelessWidget {
  String title;
  String description;

  DescriptionView(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 220),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Text(
                      title,
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
