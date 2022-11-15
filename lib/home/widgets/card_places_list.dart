import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

// Widgets
import 'package:gadbeni/tourism/views/place_details.dart';
import 'card_place.dart';

const _URL = 'https://mamore.beni.gob.bo';

class CardPlacesList extends StatefulWidget {
  String title = "";
  CardPlacesList(this.title);

  @override
  State<CardPlacesList> createState() => _CardPlacesListState();
}

class _CardPlacesListState extends State<CardPlacesList> {
  List placesList = [];
  bool isLoading = true;

  Future getPlaces() async {
    var baseUrl = "$_URL/api/places?limit=5";
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
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 50, bottom: 50),
      child: Column(
        children: [
          Text(
            widget.title,
            style: const TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 30,
                fontWeight: FontWeight.w500,
                fontFamily: 'Monstserrat'),
          ),
          const SizedBox(height: 10),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  height: 200,
                  child: ListView.builder(
                      padding: const EdgeInsets.all(5),
                      scrollDirection: Axis.horizontal,
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
                          child: CardPlace(
                              placesList[index]['title'],
                              placesList[index]['subtitle'],
                              "$_URL/storage/$banner"),
                        );
                      }))
        ],
      ),
    );
  }
}
