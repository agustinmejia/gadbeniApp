import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

// Widgets
import 'package:gadbeni/culture/views/culture_details.dart';

// Widgets
import 'package:gadbeni/widgets/card_horizontal_network.dart';

const _URL = 'http://10.0.2.2:8000';

class CardCultureList extends StatefulWidget {
  @override
  State<CardCultureList> createState() => _CardCultureListState();
}

class _CardCultureListState extends State<CardCultureList> {
  List culturesList = [];
  bool isLoading = true;

  Future getCultures() async {
    var baseUrl = "$_URL/api/cultures";
    http.Response response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() => {culturesList = jsonData['cultures']});
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCultures();
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
                itemCount: culturesList.length,
                itemBuilder: (BuildContext context, int index) {
                  var banner = culturesList[index]['banner'];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CultureDetails(
                                    culturesList[index]['title'],
                                    culturesList[index]['description'],
                                    "$_URL/storage/$banner",
                                    culturesList[index]['gallery'] != null
                                        ? culturesList[index]['gallery']
                                        : "[]",
                                  )));
                    },
                    child: CardHorizontalNetwork(
                        culturesList[index]['title'],
                        culturesList[index]['subtitle'],
                        "$_URL/storage/$banner"),
                  );
                }));
  }
}
