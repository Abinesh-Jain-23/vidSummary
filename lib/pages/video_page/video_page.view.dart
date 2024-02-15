import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vid_summary/components/youtube_video.dart';
import 'package:vid_summary/pages/video_page/video_page.controller.dart';

class VideoPageView extends GetResponsiveView<VideoPageController> {
  VideoPageView({super.key});
  @override
  Widget? builder() {
    return Scaffold(
        appBar: AppBar(title: const Text('YouTube')),
        body: ListView(
          children: [
            YouTubeVideo(youTubeLink: Get.arguments),
            ElevatedButton(
              onPressed: () async {
                final text = await controller.getVideoCaption(Get.arguments);
                controller.text.value = text;
                final path = await controller.createVideo(text);
                path != null
                    ? [
                        Get.snackbar(
                          'File Saved',
                          path.path,
                          snackPosition: SnackPosition.BOTTOM,
                        ),
                        // Get.toNamed('/play', arguments: path),
                      ]
                    : null;
              },
              child: const Text('Generate Summary'),
            ),
            Obx(
              () => controller.text.isEmpty
                  ? const SizedBox.shrink()
                  : Text(controller.text.value),
            )
          ],
        ),
        floatingActionButton: Obx(
          () => IconButton(
            onPressed: controller.text.isNotEmpty
                ? () => controller.speak(controller.text.value)
                : null,
            icon: const Icon(Icons.speaker_notes),
          ),
        ));
  }
}
