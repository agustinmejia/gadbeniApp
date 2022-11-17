import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Screens
import 'home/views/home.dart';
import 'package:gadbeni/services/views/service_conferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));
    return MaterialApp(
      title: 'GADBENI',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      // routes: <String, WidgetBuilder>{
      //   '/': (BuildContext context) => Home(),
      //   '/meet': (BuildContext context) => ServiceConferences('')
      // },
      home: Home(),
      onGenerateRoute: (settings) {
        String args = settings.name.toString();
        if (args.contains('/meet')) {
          return MaterialPageRoute(
              builder: (context) => ServiceConferences(
                  'https://conferencias.beni.gob.bo/meet/testing-gadbeni'));
        }

        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
    );
  }
}
