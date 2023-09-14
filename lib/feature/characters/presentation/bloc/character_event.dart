part of 'character_bloc.dart';

abstract class CharacterEvent extends Equatable {
  const CharacterEvent();
}

class GetAllCharacter extends CharacterEvent {
  @override
  List<Object?> get props => [];
}

class GetDetailCharacter extends CharacterEvent {
  const GetDetailCharacter(this.characterId);
  final int characterId;
  @override
  List<Object?> get props => [characterId];
}

class CleanFilter extends CharacterEvent {
  @override
  List<Object?> get props => [];
}

class FilterCharacter extends CharacterEvent {
  final String? name;
  final String? gender;
  final String? type;
  final String? species;
  final String? status;

  const FilterCharacter(
      {this.name, this.gender, this.type, this.species, this.status});
  @override
  List<Object?> get props => [name, gender, type, species, status];
}
