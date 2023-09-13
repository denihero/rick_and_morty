import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rich_and_morti_test_task/feature/characters/domain/model/character_model.dart';
import 'package:rich_and_morti_test_task/feature/episode/domain/model/episode_model.dart';
import 'package:rich_and_morti_test_task/feature/episode/domain/repository/episode_repository.dart';

part 'episode_event.dart';
part 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final EpisodeRepository episodeRepository;
  EpisodeBloc(this.episodeRepository) : super(EpisodeInitial()) {
    on<GetAllEpisode>(getAllEpisodes);
    on<GetDetailEpisode>(getDetailEpisode);
  }
  int page = 1;
  List<EpisodeModel> episodes = [];

  void getAllEpisodes(GetAllEpisode event, Emitter emit) async {
    page == 1 ? emit(EpisodeLoading()) : emit(EpisodeLoadMore());
    try {
      final result = await episodeRepository.getAllEpisode(page);
      episodes.addAll(result.results!);
      emit(
        EpisodeSuccess(
          AllEpisodeModel(info: result.info, results: episodes),
        ),
      );
    } catch (e) {
      emit(EpisodeError(e.toString()));
    }
  }

  void getDetailEpisode(GetDetailEpisode event, Emitter emit) async {
    List<Character> characterFromEpisode = [];
    emit(EpisodeLoading());
    try {
      final episodeResult =
          await episodeRepository.getDetailEpisode(event.episodeId);

      await Future.wait(episodeResult.charactersUrl!.map((e) async {
        String characterId = e.replaceAll(RegExp(r"\D"), "");
        final character = await episodeRepository
            .getCharacterFromEpisode(int.parse(characterId));
        characterFromEpisode.add(character);
        return character;
      }));

      emit(
        EpisodeDetailedLoaded(
          EpisodeModel(
            listCharacters: characterFromEpisode,
            name: episodeResult.name,
            url: episodeResult.url,
            episode: episodeResult.episode,
            airDate: episodeResult.airDate,
          ),
        ),
      );
    } catch (e) {
      emit(EpisodeError(e.toString()));
    }
  }
}
