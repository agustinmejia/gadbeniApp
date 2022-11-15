import 'package:flutter/material.dart';

// Widgets
import 'package:gadbeni/widgets/background_image_top.dart';
import 'package:gadbeni/widgets/description_view.dart';

class ServiceGrant extends StatelessWidget {
  String descriptionDummy =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. \n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          BackgroundImageTop("assets/img/services/services_list/beca.jpg"),
          ListView(
            children: <Widget>[
              DescriptionView("Obtar por beca", descriptionDummy),
              Container(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  // style: style,
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => FormServiceHealth()));
                  },
                  child: const Text('Solicitar beca'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
