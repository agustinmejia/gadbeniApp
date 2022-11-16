import 'package:flutter/material.dart';

// Views
import 'package:gadbeni/complaint/views/complaint.dart';
import 'package:gadbeni/culture/views/culture.dart';
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
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Culture()));
            },
            child: CardService("Cultura", "assets/img/services/cultura.jpg"),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Complaint()));
            },
            child:
                CardService("Denuncias", "assets/img/services/denuncias.jpg"),
          ),
          CardService("Contacto", "assets/img/services/contacto.jpg")
        ],
      ),
    );
  }
}
