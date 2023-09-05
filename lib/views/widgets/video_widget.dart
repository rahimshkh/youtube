import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube/helper/constants/app_sizes.dart';
import 'package:youtube/views/widgets/playback_widget.dart';
import 'package:youtube/views/widgets/thumbnail.dart';
import '../../controllers/blocs/playback_bloc/playback_bloc.dart';
import '../../models/video_model.dart';

class VideoWidget extends StatelessWidget {
  final double height;
  final double width;
  final int index;
  final VideoModel videoModel;

  const VideoWidget({
    super.key,
    required this.videoModel,
    required this.height,
    required this.width,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayBackBloc, PlayBackStates>(
      builder: (context, state) {
        return Container(
          height: height / AppSizes.kVideoCardHeight,
          margin: const EdgeInsets.all(AppSizes.kVideoCardMargin),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.kVideoCardRadius),
            border: Border.all(),
          ),
          child: (state.index == index)
              ? PlayBackWidget(
                  videoModel: videoModel,
                  width: width,
                  height: height,
                )
              : Thumbnail(
                  videoModel: videoModel,
                ),
        );
      },
    );
  }
}
