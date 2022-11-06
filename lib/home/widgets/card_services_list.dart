import 'package:flutter/material.dart';
import 'package:gadbeni/services/views/services.dart';
import 'package:gadbeni/tourism/views/tourism.dart';

// Widgets
import 'card_service.dart';

class CardServicesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView(
        padding: const EdgeInsets.all(5),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          InkWell(
            onTap: () {
              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(
              //     content: Text("Servicios"),
              //   ),
              // );
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Services()));
            },
            child:
                CardService("Servicios", "assets/img/services/servicios.jpg"),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Tourism()));
            },
            child: CardService("Turismo", "assets/img/services/turismo.jpg"),
          ),
          CardService("Cultura", "assets/img/services/cultura.jpg"),
          CardService("Denuncias", "assets/img/services/denuncias.jpg"),
          CardService("Contacto", "assets/img/services/contacto.jpg")
        ],
      ),
    );
  }
}
