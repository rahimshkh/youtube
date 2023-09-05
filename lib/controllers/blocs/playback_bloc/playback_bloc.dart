import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'playback_events.dart';

part 'playback_states.dart';

class PlayBackBloc extends Bloc<PlayVideoEvent, PlayBackStates> {
  PlayBackBloc() : super(const PlayBackStates()) {
    on<PlayVideoEvent>(onPlayVideo);
  }

  onPlayVideo(PlayVideoEvent event, Emitter<PlayBackStates> emit) {
    List<int> indexesList = event.indexList;
    List<int> filteredIndexes = [];

    for (int number in indexesList) {
      if (!filteredIndexes.contains(number)) {
        filteredIndexes.add(number);
      }
    }
    if(filteredIndexes.isNotEmpty){
      int smallestIndex = filteredIndexes
          .reduce((value, element) => value < element ? value : element);

      emit(state.copyWith(index: smallestIndex));
    }
  }
}
