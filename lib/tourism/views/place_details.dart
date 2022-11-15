import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

// Widgets
import 'package:gadbeni/widgets/background_image_network_top.dart';
import 'package:gadbeni/widgets/description_view.dart';
import 'package:gadbeni/widgets/viewer_photos.dart';
import 'package:gadbeni/widgets/thumbnail_network.dart';

// Widgets externals
import 'package:google_maps_flutter/google_maps_flutter.dart';

const _URL = 'https://mamore.beni.gob.bo';

class PlaceDetails extends StatelessWidget {
  String title = "";
  String description = "";
  String coordinates = "";
  String pathImage = "";
  String gallery = "";
  PlaceDetails(this.title, this.description, this.pathImage, this.gallery,
      this.coordinates);

  @override
  Widget build(BuildContext context) {
    final latLng = json.decode(coordinates)['coordinates'];
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          BackgroundImageNetworkTop(pathImage),
          ListView(
            children: <Widget>[
              DescriptionView(title, description),
              PhotosListHorizontal(gallery),
              const SizedBox(height: 30),
              Container(
                height: 300,
                child: MapSample(
                    title: title, latitude: latLng[1], longitude: latLng[0]),
              )
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

class MapSample extends StatefulWidget {
  String title = '';
  double latitude;
  double longitude;
  MapSample(
      {Key? key,
      required this.title,
      required this.latitude,
      required this.longitude})
      : super(key: key);
  @override
  State<MapSample> createState() => _MapSample();
}

class _MapSample extends State<MapSample> {
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
      markerId: MarkerId(widget.title),
      position: LatLng(widget.latitude, widget.longitude), //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: widget.title,
        // snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    return Scaffold(
        body: GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
        controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(widget.latitude, widget.longitude),
          zoom: 14.4746,
        )));
      },
      markers: markers,
    ));
  }
}
