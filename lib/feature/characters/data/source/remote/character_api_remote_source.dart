import 'package:rich_and_morti_test_task/app/network/network_error.dart';
import 'package:rich_and_morti_test_task/feature/characters/data/data_source/character_data_source.dart';
import 'package:rich_and_morti_test_task/feature/characters/domain/model/character_model.dart';
import 'package:rich_and_morti_test_task/feature/episode/domain/model/episode_model.dart';

class CharacterApiRemoteSource {
  CharacterApiRemoteSource(this.characterDataSource);
  final CharacterDataSource characterDataSource;

  Future<AllCharacterModel> getAllCharacter(int page) async {
    final response = await characterDataSource.getAllCharacters(page);

    if (response.statusCode == 200) {
      return AllCharacterModel.fromJson(response.data);
    } else if (response.statusCode! >= 400) {
      throw Exception(response.statusCode);
    } else {
      throw ResponseError(message: 'Ошибка');
    }
  }

  Future<Character> getDetailCharacter(int characterId) async {
    final response = await characterDataSource.getDetailCharacter(characterId);

    if (response.statusCode == 200) {
      return Character.fromJson(response.data);
    } else if (response.statusCode! >= 400) {
      throw Exception(response.statusCode);
    } else {
      throw ResponseError(message: 'Ошибка');
    }
  }

  Future<EpisodeModel> getEpisodeFromCharacter(int episodeId) async {
    final response =
        await characterDataSource.getEpisodeFromCharacter(episodeId);

    if (response.statusCode == 200) {
      return EpisodeModel.fromJson(response.data);
    } else if (response.statusCode! >= 400) {
      throw Exception(response.statusCode);
    } else {
      throw ResponseError(message: 'Ошибка');
    }
  }

  Future<AllCharacterModel> filterAllCharacter({
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
    required int page,
  }) async {
    final response = await characterDataSource.filterAllCharacters(
        name: name,
        status: status,
        species: species,
        type: type,
        gender: gender,
        page: page);

    if (response.statusCode == 200) {
      return AllCharacterModel.fromJson(response.data);
    } else if (response.statusCode! >= 400) {
      throw Exception(response.statusCode);
    } else {
      throw ResponseError(message: 'Ошибка');
    }
  }
}
