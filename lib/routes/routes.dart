import 'package:get/get.dart';
import 'package:vid_summary/pages/home_page/home_page.binding.dart';
import 'package:vid_summary/pages/home_page/home_page.view.dart';
import 'package:vid_summary/pages/play_page/play_page.binding.dart';
import 'package:vid_summary/pages/play_page/play_page.view.dart';
import 'package:vid_summary/pages/video_page/video_page.binding.dart';
import 'package:vid_summary/pages/video_page/video_page.view.dart';

class AppRoutes {
  static final List<GetPage> routes = [
    GetPage(
      name: '/',
      page: () => HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: '/yt',
      page: () => VideoPageView(),
      binding: VideoPageBinding(),
    ),
    GetPage(
      name: '/play',
      page: () => PlayPageView(),
      binding: PlayPageBinding(),
    ),
  ];
}
