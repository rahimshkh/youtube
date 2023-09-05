import '../helper/constants/app_keys.dart';

class VideoModel {
  String? description;
  String? url;
  String? title;
  String? thumbnail;

  VideoModel({
    this.description,
    this.title,
    this.url,
    this.thumbnail,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    String description = json[AppKeys.kModelDescription];
    String url = json[AppKeys.kModelUrl];
    String thumbnail = json[AppKeys.kThumb];
    String title = json[AppKeys.kModelTitle];
    return VideoModel(description: description, title: title, url: url, thumbnail: thumbnail);
  }
}
