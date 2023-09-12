import 'package:rich_and_morti_test_task/feature/characters/domain/model/character_model.dart';

abstract class CharacterRepository{
  Future<AllCharacterModel> getAllCharacter(int page);
}