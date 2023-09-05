import 'package:equatable/equatable.dart';
import '../../../models/video_model.dart';

enum HomeStatus { loading, loaded, error }

class HomeStates extends Equatable {
  final HomeStatus status;
  final List<VideoModel> videosList;

  const HomeStates(
      {this.status = HomeStatus.loading,
        this.videosList = const <VideoModel>[]});

  HomeStates copyWith({HomeStatus? status, List<VideoModel>? videosList}) {
    return HomeStates(
      status: status ?? this.status,
      videosList: videosList ?? this.videosList,
    );
  }

  @override
  String toString() {
    return "status is : $status, videos list is $videosList";
  }

  @override
  List<Object> get props => [status, videosList];
}
