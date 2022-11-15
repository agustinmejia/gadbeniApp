import 'package:flutter/material.dart';

// Widgets External
// import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ViewerPhotos extends StatefulWidget {
  const ViewerPhotos({Key? key}) : super(key: key);

  @override
  State<ViewerPhotos> createState() => _ViewerPhotosState();
}

class _ViewerPhotosState extends State<ViewerPhotos> {
  // int currentIndex = 0;
  // PageController pageController = PageController();

  List<GalleryItem> galleryItems = <GalleryItem>[
    GalleryItem(
      id: "tag1",
      image: "assets/img/culture/macheteros.jpg",
    ),
    GalleryItem(
      id: "tag2",
      image: "assets/img/culture/judas.jpg",
    ),
    GalleryItem(
      id: "tag3",
      image: "assets/img/culture/tobas.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// UNCOMMENT THIS IF YOU ONLY WANT TO USE THE PHOTOVIEW
      /// for simple photoview for zooming in & out
      // body: PhotoView(
      //   imageProvider: AssetImage("assets/galaxy.jpeg"), /// or use: NetworkImage()
      //   enableRotation: true,
      // ),

      /// COMMENT THIS IF YOU ONLY WANT TO USE THE PHOTOVIEW
      /// photo_view gallery
      body: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: AssetImage(galleryItems[index].image),

            /// or NetworkImage()
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained * 0.7,
            maxScale: PhotoViewComputedScale.covered * 3,
            heroAttributes:
                PhotoViewHeroAttributes(tag: galleryItems[index].id),
          );
        },
        itemCount: galleryItems.length,
        loadingBuilder: (context, event) => Center(
          child: Container(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(
              value: event == null
                  ? 0
                  : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
            ),
          ),
        ),
        // pageController: pageController,
        // onPageChanged: onPageChanged,
      ),
    );
  }

  // void onPageChanged(int index) {
  //   setState(() {
  //     currentIndex = index;
  //   });
  // }

}

class GalleryItem {
  final String id;
  final String image;

  GalleryItem({
    required this.id,
    required this.image,
  });
}
