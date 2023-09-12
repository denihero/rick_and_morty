import 'package:dio/dio.dart';
import 'package:rich_and_morti_test_task/app/network/network_error.dart';
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

  @override
  Future<AllCharacterModel> filterAllCharacter(
      {String? name,
      String? status,
      String? species,
      String? type,
      String? gender,
      required int page}) async {
    try {
      final result = await characterApiRemoteSource.filterAllCharacter(
          page: page,
          name: name,
          species: species,
          status: status,
          gender: gender,
          type: type);
      return result;
    } on DioException catch (error) {
      throw ResponseError(message: error.response?.data['error']);
    }
  }
}
