import 'package:rich_and_morti_test_task/feature/characters/domain/model/character_model.dart';
import 'package:rich_and_morti_test_task/feature/episode/domain/model/episode_model.dart';

abstract class CharacterRepository {
  Future<AllCharacterModel> getAllCharacter(int page);
  Future<Character> getDetailCharacter(int characterId);
  Future<EpisodeModel> getEpisodeFromCharacter(int episodeId);
  Future<AllCharacterModel> filterAllCharacter(
      {String? name,
      String? status,
      String? species,
      String? type,
      String? gender,required int page});
}
