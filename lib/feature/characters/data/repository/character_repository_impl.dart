import 'package:dio/dio.dart';
import 'package:rich_and_morti_test_task/feature/characters/data/source/remote/character_api_remote_source.dart';
import 'package:rich_and_morti_test_task/feature/characters/domain/model/character_model.dart';
import 'package:rich_and_morti_test_task/feature/characters/domain/repository/character_repository.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  final CharacterApiRemoteSource characterApiRemoteSource;
  CharacterRepositoryImpl(this.characterApiRemoteSource);

  @override
  Future<AllCharacterModel> getAllCharacter(int page) async {
    try {
      final result = await characterApiRemoteSource.getAllCharacter(page);
      return result;
    } on DioException catch (error) {
      throw Exception(error.response?.data);
    }
  }
}
