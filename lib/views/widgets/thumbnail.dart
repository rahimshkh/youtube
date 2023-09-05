import 'package:flutter/material.dart';
import 'package:youtube/helper/constants/app_sizes.dart';
import 'package:youtube/models/video_model.dart';

class Thumbnail extends StatelessWidget {
  final VideoModel videoModel;

  const Thumbnail({
    super.key,
    required this.videoModel,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSizes.kThumbnailRadius),
      child: GridTile(
        footer: Container(
          color: Theme.of(context).colorScheme.primary.withOpacity(AppSizes.kTitleBarOpacity),
          alignment: Alignment.center,
          child: Text(
            videoModel.title!,
            softWrap: true,
            style: const TextStyle(
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        child: Image.network(
          videoModel.thumbnail!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
