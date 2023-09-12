part of 'character_bloc.dart';

abstract class CharacterEvent extends Equatable {
  const CharacterEvent();
}

class GetAllCharacter extends CharacterEvent {
  const GetAllCharacter(this.page);

  final int page;
  @override
  List<Object?> get props => [page];
}
