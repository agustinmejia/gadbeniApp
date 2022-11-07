import 'package:flutter/material.dart';

// Widgets
import 'package:gadbeni/widgets/card_horizontal.dart';

import 'package:gadbeni/blog/views/blog_details.dart';

class CardBlogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 80),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Noticias",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                fontFamily: 'Monstserrat'),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlogDetails("Lorem ipsum dolor",
                              "assets/img/services/servicios.jpg")));
                },
                child: CardHorizontal(
                    "Lorem ipsum dolor",
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                    "assets/img/services/servicios.jpg"),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlogDetails(
                              "Consectetur adipiscing",
                              "assets/img/services/turismo.jpg")));
                },
                child: CardHorizontal(
                    "Consectetur adipiscing",
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                    "assets/img/services/turismo.jpg"),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlogDetails(
                              "Ed do eiusmod tempor, consectetur",
                              "assets/img/services/denuncias.jpg")));
                },
                child: CardHorizontal(
                    "Ed do eiusmod tempor, consectetur",
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                    "assets/img/services/denuncias.jpg"),
              )
            ],
          )
        ],
      ),
    );
  }
}
