import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vid_summary/pages/home_page/home_page.variables.dart';

class HomePageController extends GetxController with HomePageVariables {
  generateVideoSummaryPressed() async {
    if (form.currentState != null && form.currentState!.validate()) {
      loading.value = true;
      await sendVideo(textEditingController.text);
    }
  }

  sendVideo(String link) async {
    try {
      final response = await Dio().get(
        'https://hacktonapi1.onrender.com/run_subprocess',
        data: {
          'url': link,
        },
      );
      loading.value = false;
      Get.toNamed('/play', arguments: response);
    } catch (e) {
      loading.value = false;
      Get.toNamed('/yt', arguments: textEditingController.text);
    }
  }

  bool isValidYouTubeUrl(String url) {
    const pattern = r'^(https?://)?(www\.)?(youtube\.com|youtu\.be)/.+$';
    final regex = RegExp(pattern);
    return regex.hasMatch(url);
  }

  String? validateField(String? url) => (url == null || url.isEmpty)
      ? 'Please enter a YouTube video URL'
      : !isValidYouTubeUrl(url)
          ? 'Invalid YouTube video URL, please check'
          : null;

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }
}
