part of 'playback_bloc.dart';

class PlayBackStates extends Equatable {
  final int index;

  const PlayBackStates({this.index = 0});

  PlayBackStates copyWith({int? index}) {
    return PlayBackStates(index: index ?? this.index);
  }

  @override
  String toString() {
    return "current index is : $index";
  }

  @override
  List<Object> get props => [index];
}
