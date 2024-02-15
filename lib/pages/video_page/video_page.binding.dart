import 'package:get/get.dart';
import 'package:vid_summary/pages/video_page/video_page.controller.dart';

class VideoPageBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => VideoPageController());
}
