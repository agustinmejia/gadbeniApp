import 'package:flutter/material.dart';

import 'package:gadbeni/tourism/widgets/card_places_list.dart';

class Tourism extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lugares turísticos"),
        ),
        body: Container(child: CardPlacesList()));
  }
}
