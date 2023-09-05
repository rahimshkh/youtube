import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/utils/fetch_data_utils.dart';
import '../../../models/video_model.dart';
import 'home_state.dart';

enum HomeEvents { fetchData }

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  HomeBloc() : super(const HomeStates()) {
    on<HomeEvents>(onHomeEvents);
  }

  onHomeEvents(HomeEvents event, Emitter<HomeStates> emit) async {
    if (event == HomeEvents.fetchData) {
      List<VideoModel> videosList = await VideoUtils.getVideosData();
      emit(state.copyWith(status: HomeStatus.loaded, videosList: videosList));
    }
  }
}
