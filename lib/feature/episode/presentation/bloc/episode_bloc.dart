import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rich_and_morti_test_task/feature/characters/presentation/bloc/character_bloc.dart';
import 'package:rich_and_morti_test_task/feature/episode/domain/model/episode_model.dart';
import 'package:rich_and_morti_test_task/feature/episode/domain/repository/episode_repository.dart';

part 'episode_event.dart';
part 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final EpisodeRepository episodeRepository;
  EpisodeBloc(this.episodeRepository) : super(EpisodeInitial()) {
    on<GetAllEpisode>(getAllEpisodes);
  }

  void getAllEpisodes(GetAllEpisode event, Emitter emit) async {
    emit(EpisodeLoading());
    try {
      final allEpisode = await episodeRepository.getAllEpisode(event.page);
      emit(EpisodeSuccess(allEpisode));
    } catch (e) {
      emit(EpisodeError(e.toString()));
    }
  }
}
