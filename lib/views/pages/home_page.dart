import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/blocs/fetch_data_bloc/home_bloc.dart';
import '../../controllers/blocs/fetch_data_bloc/home_state.dart';
import '../../controllers/blocs/playback_bloc/playback_bloc.dart';

import 'package:visibility_detector/visibility_detector.dart';

import '../../models/video_model.dart';
import '../widgets/video_widget.dart';


class HomeScreen extends StatelessWidget {
  List<int> indexesList = [];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    final playbackBloc = BlocProvider.of<PlayBackBloc>(context);
    homeBloc.add(HomeEvents.fetchData);
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeStates>(
          builder: (context, state) {
            if (state.status == HomeStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.status == HomeStatus.loaded) {
              return ListView.builder(
                  itemCount: state.videosList.length,
                  itemBuilder: (context, index) {
                    VideoModel videoModel = state.videosList[index];
                    return VisibilityDetector(
                        key: Key("C$index"),
                        child: VideoWidget(
                          videoModel: videoModel,
                          height: height,
                          width: width,
                          index: index,
                        ),
                        onVisibilityChanged: (VisibilityInfo visibilityInfo) {
                          double visible = visibilityInfo.visibleFraction;
                          if (visible == 1.0) {
                            indexesList.add(index);
                          } else {
                            indexesList.remove(index);
                          }
                          playbackBloc.add(
                            PlayVideoEvent(indexList: indexesList),
                          );
                        });
                  });
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
