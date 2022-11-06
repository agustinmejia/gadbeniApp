import 'package:flutter/material.dart';

import 'package:gadbeni/services/widgets/card_services_list.dart';

class Services extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de servicios"),
        ),
        body: ListView(children: [
          CardServicesList(),
        ]));
  }
}
