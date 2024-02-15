import 'dart:math';

import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

mixin VideoPageVariables {
  RxString text = ''.obs;
  final FlutterTts flutterTts = FlutterTts();
  final FlutterFFmpeg ffmpegInstance = FlutterFFmpeg();
  final String videoFilePath = '/storage/emulated/0/Download/';
  Random random = Random();
}
