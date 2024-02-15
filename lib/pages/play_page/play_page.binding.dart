import 'package:get/get.dart';
import 'package:vid_summary/pages/play_page/play_page.controller.dart';

class PlayPageBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => PlayPageController());
}
