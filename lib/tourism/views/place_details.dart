import 'dart:async';
import 'package:flutter/material.dart';

// Widgets
import 'package:gadbeni/widgets/background_image_top.dart';

// Widgets externals
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceDetails extends StatelessWidget {
  String title = "";
  String descriptionDummy =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. \n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";
  String pathImage = "";
  PlaceDetails(this.title, this.pathImage);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          BackgroundImageTop(pathImage),
          ListView(
            children: <Widget>[
              DescriptionService(title, descriptionDummy),
              PhotosListHorizontal()
            ],
          ),
        ],
      ),
    );
  }
}

class DescriptionService extends StatelessWidget {
  String namePlace;
  String descriptionPlace;

  DescriptionService(this.namePlace, this.descriptionPlace);

  @override
  Widget build(BuildContext context) {
    final titleStars = Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Text(
            namePlace,
            style: const TextStyle(
              decoration: TextDecoration.none,
              fontFamily: "Montserrat",
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );

    final description = Container(
      margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Text(
        descriptionPlace,
        style: const TextStyle(
            decoration: TextDecoration.none,
            fontFamily: "Montserrat",
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            color: Color(0xFF56575a)),
      ),
    );

    return Column(
      children: [
        const SizedBox(height: 200),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[titleStars, description],
          ),
        )
      ],
    );
  }
}

class PhotosListHorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                child: ListView(
                  padding: const EdgeInsets.all(5),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Thumbnail("assets/img/places/chuchini.jpg"),
                    Thumbnail("assets/img/places/laguna-suarez.jpg"),
                    Thumbnail("assets/img/places/itauba.jpeg"),
                    Thumbnail("assets/img/places/loma-suarez.jpg"),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Container(
          height: 300,
          child: MapSample(),
        )
      ],
    );
  }
}

class Thumbnail extends StatelessWidget {
  String pathImage = "";
  Thumbnail(this.pathImage);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 150.0,
      margin: EdgeInsets.only(left: 3),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(pathImage),
            fit: BoxFit.cover,
          ),
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(3)),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black26, blurRadius: 5, offset: Offset(1, 5))
          ]),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => RenderMap();
}

class RenderMap extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-14.8350689, -64.9072383),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    final Set<Marker> markers = new Set();

    markers.add(Marker(
      //add second marker
      markerId: MarkerId("1234"),
      position: LatLng(-14.8350689, -64.9072383), //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: 'My Custom Title ',
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    return Scaffold(
        body: GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: markers,
    ));
  }
}
