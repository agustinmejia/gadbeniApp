import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

// Widgets
import 'package:gadbeni/widgets/background_image_network_top.dart';
import 'package:gadbeni/widgets/description_view.dart';
import 'package:gadbeni/widgets/viewer_photos.dart';
import 'package:gadbeni/widgets/thumbnail_network.dart';

const _URL = 'http://10.0.2.2:8000';

class BlogDetails extends StatelessWidget {
  String title = "";
  String description = "";
  String pathImage = "";
  String gallery = "";
  BlogDetails(this.title, this.description, this.pathImage, this.gallery);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          BackgroundImageNetworkTop(pathImage),
          ListView(
            children: <Widget>[
              DescriptionView(title, description),
              PhotosListHorizontal(gallery),
              const SizedBox(height: 50),
            ],
          ),
        ],
      ),
    );
  }
}

class PhotosListHorizontal extends StatelessWidget {
  String string_gallery = "";
  PhotosListHorizontal(this.string_gallery);
  @override
  Widget build(BuildContext context) {
    List photosList = json.decode(string_gallery);
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding:
              const EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Galería",
                style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Monstserrat'),
              ),
              const SizedBox(height: 10),
              Container(
                height: 100,
                child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                    scrollDirection: Axis.horizontal,
                    itemCount: photosList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var banner = photosList[index];
                      return Material(
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => ViewerPhotos()));
                          },
                          child: ThumbnailNetwork("$_URL/storage/$banner"),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
