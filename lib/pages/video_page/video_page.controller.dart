import 'dart:collection';
import 'dart:io';
import 'package:dart_openai/dart_openai.dart';
import 'package:get/get.dart';
import 'package:vid_summary/pages/video_page/video_page.variables.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPageController extends GetxController with VideoPageVariables {
  Future<String> getVideoCaption(String videoId) async {
    try {
      String id = YoutubePlayer.convertUrlToId(videoId)!;
      YoutubeExplode yt = YoutubeExplode();
      ClosedCaptionManifest trackManifest =
          await yt.videos.closedCaptions.getManifest(id);
      List<ClosedCaptionTrackInfo> trackInfo =
          trackManifest.getByLanguage('en');
      if (trackInfo.isNotEmpty) {
        ClosedCaptionTrack track =
            await yt.videos.closedCaptions.get(trackInfo.first);
        UnmodifiableListView<ClosedCaption> caption = track.captions;
        String captionText = caption.map((e) => e.text).join(' ');
        yt.close();
        return captionText;
      } else {
        yt.close();
        return 'No English caption available';
      }
    } catch (e) {
      return 'No English caption available';
    }
  }

  Future<OpenAICompletionModelChoice?> getSummary(String text) async {
    OpenAI.apiKey = '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';
    final completion = await OpenAI.instance.completion.create(
      model: "gpt-3.5-turbo-0301",
      prompt: 'Summarize this text: $text',
    );
    return completion.choices.firstOrNull;
  }

  Future<File?> createVideo(String text) async {
    try {
      File file = File('${videoFilePath}video${random.nextInt(1000)}.mp4');
      final audioFile = await flutterTts.synthesizeToFile(text, file.path);
      final textOverlay =
          'drawtext=fontfile=/system/fonts/Arial.ttf:text=\'$text\':x=(w-tw)/2:y=h-(2*lh):fontcolor=white:fontsize=24';
      final command = "-i $audioFile -vf $textOverlay ${file.path}";
      await ffmpegInstance.executeAsync(
        command,
        (execution) {},
      );
      return file;
    } catch (e) {
      return null;
    }
  }

  speak(String text) async {
    await flutterTts.stop();
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  stopSpeak() async => await flutterTts.stop();

  @override
  void onClose() {
    stopSpeak();
    super.onClose();
  }
}
