import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vid_summary/pages/play_page/play_page.controller.dart';
import 'package:video_player/video_player.dart';

class PlayPageView extends GetResponsiveView<PlayPageController> {
  PlayPageView({super.key});

  @override
  Widget? builder() {
    return Scaffold(
      appBar: AppBar(title: const Text('Play')),
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: VideoPlayer(
            VideoPlayerController.networkUrl(Get.arguments),
          ),
        ),
      ),
    );
  }
}
