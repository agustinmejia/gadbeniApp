import 'package:flutter/material.dart';

// Widgets
import 'package:gadbeni/widgets/background_image_top.dart';
import 'package:gadbeni/widgets/description_view.dart';

class ServiceGrant extends StatelessWidget {
  String descriptionDummy =
      "A través de este formulario puedes optar por las diferentes becas que tiene para ofrecer la gobernación del Beni en convenio de diferentes instituciones.";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          BackgroundImageTop("assets/img/services/services_list/beca.jpg"),
          ListView(
            children: <Widget>[
              DescriptionView("Optar por beca", descriptionDummy),
              Container(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  // style: style,
                  onPressed: null,
                  child: const Text('Solicitar beca (En desarrollo)'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
