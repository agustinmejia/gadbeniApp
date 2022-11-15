import 'package:flutter/material.dart';

import 'package:gadbeni/culture/widgets/card_culture_list.dart';

class Culture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Nuestra cultura"),
        ),
        body: Container(
          child: CardCultureList(),
        ));
  }
}
