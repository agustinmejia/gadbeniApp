import 'package:flutter/material.dart';

// Widgets
import 'package:gadbeni/widgets/clipper08.dart';
import 'package:gadbeni/home/widgets/card_services_list.dart';
import 'package:gadbeni/home/widgets/card_blog_list.dart';
import 'package:gadbeni/home/widgets/card_places_list.dart';

import 'package:gadbeni/widgets/banner_advertising.dart';

import 'package:gadbeni/widgets/background_gradient_top.dart';

ThemeData appTheme = ThemeData(
    primaryColor: const Color(0xff039847),
    /* Colors.tealAccent,*/
    secondaryHeaderColor: const Color(0xff00361f) /* Colors.teal*/
    // fontFamily:
    );

int sel = 0;
double? width;
double? height;

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.shortestSide;
    height = MediaQuery.of(context).size.longestSide;
    double h = 50;
    double w = 50;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: Clipper08(),
            child: BackgroundGradientTop(),
          ),
          ListView(
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 50, left: 50, bottom: 0),
                    child: Column(
                      children: const <Widget>[
                        Image(
                          image: AssetImage("assets/img/icon-alt.png"),
                          width: 250,
                        ),
                      ],
                    ),
                  ),
                  CardServicesList(),
                  // CardBlogList(),
                  CardPlacesList("Lugares Turístico"),
                  BannerAdvertising()
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
