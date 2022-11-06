import 'package:flutter/material.dart';
import 'package:gadbeni/services/views/service_donation.dart';
import 'package:gadbeni/services/views/service_grant.dart';
import 'package:gadbeni/services/views/service_health.dart';
import 'package:gadbeni/services/views/service_legal_status.dart';

// Widgets
import 'package:gadbeni/widgets/card_horizontal.dart';

class CardServicesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ServiceHealt()));
            },
            child: CardHorizontal(
                "Atención médica en línea",
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                "assets/img/services/services_list/salud.jpg"),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ServiceDonation()));
            },
            child: CardHorizontal(
                "Solicitar donación",
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                "assets/img/services/services_list/donacion.jpg"),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ServiceGrant()));
            },
            child: CardHorizontal(
                "Optar por beca",
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                "assets/img/services/services_list/beca.jpg"),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ServiceLegalStatus()));
            },
            child: CardHorizontal(
                "Personería jurídica",
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                "assets/img/services/services_list/personeria.jpg"),
          )
        ],
      ),
    );
  }
}
