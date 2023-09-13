import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rich_and_morti_test_task/feature/characters/domain/model/character_model.dart';
import 'package:rich_and_morti_test_task/feature/characters/domain/repository/character_repository.dart';
import 'package:rich_and_morti_test_task/feature/episode/domain/model/episode_model.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterRepository characterRepository;
  CharacterBloc(this.characterRepository) : super(CharacterInitial()) {
    on<GetAllCharacter>(getAllCharacters);
    on<FilterCharacter>(filterCharacter);
    on<GetDetailCharacter>(getDetailCharacter);
  }

  List<Character> characterList = [];
  int page = 1;

  void getAllCharacters(GetAllCharacter event, Emitter emit) async {
    page == 1 ? emit(CharacterLoading()) : emit(CharacterLoadMore());
    try {
      final result = await characterRepository.getAllCharacter(page);
      characterList.addAll(result.results!);
      emit(
        CharacterSuccess(
          AllCharacterModel(
            info: result.info,
            results: characterList,
          ),
        ),
      );
    } catch (e) {
      emit(CharacterError(e.toString()));
    }
  }

  void getDetailCharacter(GetDetailCharacter event, Emitter emit) async {
    List<EpisodeModel> episodeList = [];
    emit(CharacterLoading());
    try {
      final character =
          await characterRepository.getDetailCharacter(event.characterId);

      await Future.wait(
        character.episodeUrl!.map(
          (e) async {
            String episodeId = e.replaceAll(RegExp(r"\D"), "");
            final episode = await characterRepository.getEpisodeFromCharacter(
              int.parse(
                episodeId,
              ),
            );
            episodeList.add(episode);
            return episodeList;
          },
        ),
      );

      emit(
        CharacterDetailSuccess(
          Character(
            name: character.name,
            species: character.species,
            status: character.status,
            gender: character.gender,
            episode: episodeList,
            origin: character.origin,
            id: character.id,
            image: character.image,
            location: character.origin,
          ),
        ),
      );
    } catch (e) {
      emit(CharacterError(e.toString()));
    }
  }

  void filterCharacter(FilterCharacter event, Emitter emit) async {
    try {
      emit(CharacterLoading());
      final filteredResult = await characterRepository.filterAllCharacter(
        page: page,
        status: event.status,
        species: event.species,
        type: event.type,
        gender: event.gender,
        name: event.name,
      );
      emit(CharacterSuccess(filteredResult));
    } catch (e) {
      emit(CharacterError(e.toString()));
    }
  }
}
