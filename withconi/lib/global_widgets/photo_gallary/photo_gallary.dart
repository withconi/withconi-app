import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/global_widgets/button/icon_button.dart';

import 'image_item.dart';

class PhotoView {
  void openPhotoView(final int index, List<ImageItem> galleryItems) {
    Get.to(
        GalleryPhotoViewWrapper(
          galleryItems: galleryItems,
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          initialIndex: index,
          scrollDirection: Axis.horizontal,
        ),
        duration: Duration(milliseconds: 300),
        transition: Transition.downToUp,
        fullscreenDialog: true);
  }
}

class GalleryPhotoViewWrapper extends StatefulWidget {
  GalleryPhotoViewWrapper({
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialIndex = 0,
    required this.galleryItems,
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(initialPage: initialIndex);

  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final List<ImageItem> galleryItems;
  final Axis scrollDirection;

  @override
  State<StatefulWidget> createState() {
    return _GalleryPhotoViewWrapperState();
  }
}

class _GalleryPhotoViewWrapperState extends State<GalleryPhotoViewWrapper> {
  late int currentIndex = widget.initialIndex;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onVerticalDragEnd: (DragEndDetails drag) {
          if (drag.velocity.pixelsPerSecond.dy > 600) {
            Get.back();
          }
        },
        child: SafeArea(
          child: Container(
            decoration: widget.backgroundDecoration,
            constraints: BoxConstraints.expand(
              height: MediaQuery.of(context).size.height,
            ),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                PhotoViewGallery.builder(
                  scrollPhysics: const BouncingScrollPhysics(),
                  builder: _buildItem,
                  itemCount: widget.galleryItems.length,
                  loadingBuilder: widget.loadingBuilder,
                  backgroundDecoration: widget.backgroundDecoration,
                  pageController: widget.pageController,
                  onPageChanged: onPageChanged,
                  scrollDirection: widget.scrollDirection,
                ),
                Container(
                  height: 35,
                  width: 64,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(154, 82, 88, 98),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "${currentIndex + 1} / ${widget.galleryItems.length}",
                    style: GoogleFonts.workSans(
                        fontSize: 17, color: WcColors.white),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 5,
                  child: WcIconButton(
                      touchHeight: 70,
                      touchWidth: 50,
                      iconHeight: 23,
                      iconMainAxisAlignment: MainAxisAlignment.center,
                      backgroundColor: Colors.transparent,
                      active: true,
                      onTap: () {
                        Get.back();
                      },
                      iconSrc: 'assets/icons/cancle.svg',
                      activeIconColor: WcColors.white,
                      inactiveIconColor: WcColors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final ImageItem item = widget.galleryItems[index];
    return PhotoViewGalleryPageOptions.customChild(
      childSize: Size(WcWidth, WcHeight - 300),
      child: Container(
        width: WcWidth,
        height: WcHeight - 300,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.contain,
              image: widget.galleryItems[index].getImageByType),
        ),
      ),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
      maxScale: PhotoViewComputedScale.covered * 4.1,
      heroAttributes: PhotoViewHeroAttributes(tag: item.id),
    );
  }
}
