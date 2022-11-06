import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
    primaryColor: const Color(0xff039847),
    /* Colors.tealAccent,*/
    secondaryHeaderColor: const Color(0xff00361f) /* Colors.teal*/
    // fontFamily:
    );

int sel = 0;
double? width;
double? height;

class BannerAdvertising extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.shortestSide;
    height = MediaQuery.of(context).size.longestSide;
    return Container(
      // height: 300,
      padding: const EdgeInsets.only(left: 10, top: 30, right: 10, bottom: 30),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [appTheme.primaryColor, appTheme.secondaryHeaderColor],
              tileMode: TileMode.clamp)),
      child: Row(
        children: [
          Container(
            height: 180.0,
            width: 180.0,
            decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/img/banner-1.png"),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10)),
          ),
          Padding(
              padding:
                  const EdgeInsets.only(left: 10, top: 2, right: 10, bottom: 2),
              child: Container(
                // alignment: ,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: (width! - 250.0),
                      child: const Text(
                        "Feliz 180 Aniversario",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: (width! - 250.0),
                      child: const Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
