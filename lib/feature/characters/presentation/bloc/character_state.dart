part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  @override
  List<Object> get props => [];
}

class CharacterInitial extends CharacterState {}

class CharacterError extends CharacterState {
  CharacterError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class CharacterSuccess extends CharacterState {
  CharacterSuccess(this.allCharacter);
  final AllCharacterModel allCharacter;

  @override
  List<Object> get props => [allCharacter];
}

class CharacterLoading extends CharacterState {}
