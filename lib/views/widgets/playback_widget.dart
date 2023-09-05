import 'package:flutter/material.dart';
import 'package:youtube/helper/constants/app_sizes.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube/models/video_model.dart';

class PlayBackWidget extends StatefulWidget {
  final double height;
  final double width;
  final VideoModel videoModel;

  const PlayBackWidget({
    super.key,
    required this.videoModel,
    required this.width,
    required this.height,
  });

  @override
  State<PlayBackWidget> createState() => _PlayBackWidgetState();
}

class _PlayBackWidgetState extends State<PlayBackWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    if (widget.videoModel.url != null) {
      Uri url = Uri.parse(widget.videoModel.url!);
      _controller = VideoPlayerController.networkUrl(url)
        ..initialize()
        ..play()
        ..setLooping(false);
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSizes.kVideoCardRadius),
      child: VideoPlayer(
        _controller,
      ),
    );
  }
}
