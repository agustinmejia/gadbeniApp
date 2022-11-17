import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

// Widgets
import 'package:gadbeni/widgets/card_horizontal_network.dart';

import 'package:gadbeni/blog/views/blog_details.dart';

const _URL = 'https://mamore.beni.gob.bo';

class CardBlogList extends StatefulWidget {
  @override
  State<CardBlogList> createState() => _CardBlogListState();
}

class _CardBlogListState extends State<CardBlogList> {
  List postsList = [];
  bool isLoading = true;

  Future getPosts() async {
    var baseUrl = "$_URL/api/posts?limit=5";
    http.Response response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() => {postsList = jsonData['posts']});
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 80),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Noticias destacadas",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                fontFamily: 'Monstserrat'),
          ),
          const SizedBox(height: 20),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: postsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var banner = postsList[index]['banner'];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BlogDetails(
                                      postsList[index]['title'],
                                      postsList[index]['description'],
                                      "$_URL/storage/$banner",
                                      postsList[index]['gallery'] != null
                                          ? postsList[index]['gallery']
                                          : "[]",
                                    )));
                      },
                      child: CardHorizontalNetwork(
                          postsList[index]['title'],
                          postsList[index]['subtitle'],
                          "$_URL/storage/$banner"),
                    );
                  })
        ],
      ),
    );
  }
}
