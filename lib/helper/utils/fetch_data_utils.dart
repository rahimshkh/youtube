import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:youtube/helper/constants/app_keys.dart';

import '../../models/video_model.dart';

class VideoUtils {
  static getVideosData() async {
    String jsonPath = await rootBundle.loadString(
      AppKeys.kVideoFileKey,
    );
    List<dynamic> decode = await jsonDecode(jsonPath);
    List<VideoModel> videosList = [];
    for (Map<String, dynamic> videoData in decode) {
      VideoModel videoModel = VideoModel.fromJson(videoData);
      videosList.add(videoModel);
    }
    return videosList;
  }
}
