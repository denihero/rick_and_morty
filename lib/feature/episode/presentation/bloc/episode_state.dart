part of 'episode_bloc.dart';

abstract class EpisodeState extends Equatable {
  @override
  List<Object> get props => [];
}

class EpisodeInitial extends EpisodeState {}

class EpisodeError extends EpisodeState {
  EpisodeError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class EpisodeLoading extends EpisodeState {}

class EpisodeSuccess extends EpisodeState {
  EpisodeSuccess(this.allEpisode);

  final AllEpisodeModel allEpisode;
  @override
  List<Object> get props => [allEpisode];
}
