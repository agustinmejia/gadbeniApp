import 'dart:async';
import 'package:flutter/material.dart';

// Widgets
import 'package:gadbeni/widgets/background_image_top.dart';
import 'package:gadbeni/widgets/description_view.dart';
import 'package:gadbeni/widgets/viewer_photos.dart';
import 'package:gadbeni/widgets/thumbnail.dart';

// Widgets External
// import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class CultureDetails extends StatelessWidget {
  String title = "";
  String descriptionDummy =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. \n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";
  String pathImage = "";
  CultureDetails(this.title, this.pathImage);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          BackgroundImageTop(pathImage),
          ListView(
            children: <Widget>[
              DescriptionView(title, descriptionDummy),
              // PhotosListHorizontal(),
            ],
          ),
        ],
      ),
    );
  }
}

// class PhotosListHorizontal extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           color: Colors.white,
//           padding:
//               const EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "Galería",
//                 style: TextStyle(
//                     color: Colors.black,
//                     decoration: TextDecoration.none,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w500,
//                     fontFamily: 'Monstserrat'),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 height: 100,
//                 child: ListView(
//                   padding: const EdgeInsets.all(5),
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     Material(
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => ViewerPhotos()));
//                         },
//                         child: Thumbnail("assets/img/culture/macheteros.jpg"),
//                       ),
//                     ),
//                     Material(
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => ViewerPhotos()));
//                         },
//                         child: Thumbnail("assets/img/culture/judas.jpg"),
//                       ),
//                     ),
//                     Material(
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => ViewerPhotos()));
//                         },
//                         child: Thumbnail("assets/img/culture/tobas.jpg"),
//                       ),
//                     ),
//                     Material(
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => ViewerPhotos()));
//                         },
//                         child: Thumbnail("assets/img/culture/achus.jpg"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
