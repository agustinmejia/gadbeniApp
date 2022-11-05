import 'package:flutter/material.dart';

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
          CardService("Servicios", "assets/img/services/servicios.jpg"),
          CardService("Turismo", "assets/img/services/turismo.jpg")
        ],
      ),
    );
  }
}
