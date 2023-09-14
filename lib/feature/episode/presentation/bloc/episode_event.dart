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

class GetDetailEpisode extends EpisodeEvent {
  const GetDetailEpisode(this.episodeId);
  final int episodeId;

  @override
  List<Object?> get props => [episodeId];
}

class GetCharacterFromEpisode extends EpisodeEvent {
  const GetCharacterFromEpisode(this.characterId);
  final int characterId;

  @override
  List<Object?> get props => [characterId];
}
