part of 'character_bloc.dart';

abstract class CharacterEvent extends Equatable {
  const CharacterEvent();
}

class GetAllCharacter extends CharacterEvent {
  @override
  List<Object?> get props => [];
}
