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
                  MaterialPageRoute(builder: (context) => ServiceHealth()));
            },
            child: CardHorizontal(
                "Atención médica en línea",
                "El Gobierno autónomo del Beni, implementando el servicio de fichaje en línea, un servicio que permitirá al paciente recabar su ficha de atención médica en línea desde su dispositivo móvil en la comodidad de su hogar.",
                "assets/img/services/services_list/salud.jpg"),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ServiceDonation()));
            },
            child: CardHorizontal(
                "Solicitar donación",
                "Puedes solicitar donaciones de medicamentos, ropa, viveres, etc.",
                "assets/img/services/services_list/donacion.jpg"),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ServiceGrant()));
            },
            child: CardHorizontal(
                "Optar por beca",
                "A través de este formulario puedes optar por las diferentes becas que tiene para ofrecer la gobernación del Beni en convenio de diferentes instituciones.",
                "assets/img/services/services_list/beca.jpg"),
          ),
          // InkWell(
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => ServiceLegalStatus()));
          //   },
          //   child: CardHorizontal(
          //       "Personería jurídica",
          //       "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
          //       "assets/img/services/services_list/personeria.jpg"),
          // )
        ],
      ),
    );
  }
}
