import 'dart:async';

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
  }

  void getAllCharacters(GetAllCharacter event, Emitter emit) async {
    emit(CharacterLoading());
    try {
      final result = await characterRepository.getAllCharacter(event.page);
      emit(CharacterSuccess(result));
    } catch (e) {
      emit(CharacterError(e.toString()));
    }
  }
}
