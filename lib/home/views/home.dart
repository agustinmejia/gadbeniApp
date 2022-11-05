import 'package:flutter/material.dart';

// Widgets
import 'package:gadbeniapp/widgets/clipper08.dart';
import 'package:gadbeniapp/home/widgets/card_services_list.dart';
import 'package:gadbeniapp/home/widgets/card_news_list.dart';

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
      body: ListView(
        children: [
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: Clipper08(),
                child: Container(
                  height: height! * .65 < 450 ? height! * .65 : 420, //400
                  //color: Colors.tealAccent,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    appTheme.primaryColor,
                    appTheme.secondaryHeaderColor
                  ])),
                  child: Column(
                    children: <Widget>[
                      // SizedBox(
                      //   height: height! / 50,
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, right: 50, left: 50, bottom: 0),
                        child: Column(
                          children: const <Widget>[
                            Image(
                              image: AssetImage("assets/img/icon-alt.png"),
                              width: 250,
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(height: height! * 0.0375),
                      CardServicesList()
                    ],
                  ),
                ),
              )
            ],
          ),
          CardNewsList()
        ],
      ),
    );
  }
}
