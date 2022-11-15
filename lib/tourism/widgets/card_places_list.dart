import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

// Widgets
import 'package:gadbeni/tourism/views/place_details.dart';

// Widgets
import 'package:gadbeni/widgets/card_horizontal_network.dart';

const _URL = 'https://mamore.beni.gob.bo';

class CardPlacesList extends StatefulWidget {
  @override
  State<CardPlacesList> createState() => _CardPlacesListState();
}

class _CardPlacesListState extends State<CardPlacesList> {
  List placesList = [];
  bool isLoading = true;

  Future getPlaces() async {
    var baseUrl = "$_URL/api/places";
    http.Response response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() => {placesList = jsonData['places']});
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            padding: const EdgeInsets.only(top: 30),
            child: ListView.builder(
                itemCount: placesList.length,
                itemBuilder: (BuildContext context, int index) {
                  var banner = placesList[index]['banner'];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlaceDetails(
                                    placesList[index]['title'],
                                    placesList[index]['description'],
                                    "$_URL/storage/$banner",
                                    placesList[index]['gallery'] != null
                                        ? placesList[index]['gallery']
                                        : "[]",
                                    placesList[index]['location'],
                                  )));
                    },
                    child: CardHorizontalNetwork(placesList[index]['title'],
                        placesList[index]['subtitle'], "$_URL/storage/$banner"),
                  );
                }));
  }
}
