part of 'episode_bloc.dart';

abstract class EpisodeEvent extends Equatable {
  const EpisodeEvent();

  @override
  List<Object?> get props => [];
}

class GetAllEpisode extends EpisodeEvent {
  const GetAllEpisode();

  @override
  List<Object?> get props => [];
}
