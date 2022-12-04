import 'package:get/get.dart';

import '../controllers/youtube_gallery_controller.dart';

class YoutubeGalleryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YoutubeGalleryController>(
      () => YoutubeGalleryController(),
    );
  }
}
