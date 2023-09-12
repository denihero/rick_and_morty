import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rich_and_morti_test_task/feature/characters/domain/model/character_model.dart';
import 'package:rich_and_morti_test_task/feature/characters/domain/repository/character_repository.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterRepository characterRepository;
  CharacterBloc(this.characterRepository) : super(CharacterInitial()) {
    on<GetAllCharacter>(getAllCharacters);
    on<FilterCharacter>(filterCharacter);
  }

  List<Character> characterList = [];
  List<Character> filteredCharacters = [];
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
