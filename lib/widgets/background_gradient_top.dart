import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
    primaryColor: const Color(0xff039847),
    /* Colors.tealAccent,*/
    secondaryHeaderColor: const Color(0xff00361f) /* Colors.teal*/
    // fontFamily:
    );

class BackgroundGradientTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 400.0, //Tamaño del Appbar
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            appTheme.primaryColor,
            appTheme.secondaryHeaderColor
          ], tileMode: TileMode.clamp)),
          alignment: const Alignment(-0.9, -0.55),
        )
      ],
    );
  }
}
