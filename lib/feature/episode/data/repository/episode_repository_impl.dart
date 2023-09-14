import 'package:dio/dio.dart';
import 'package:rich_and_morti_test_task/feature/characters/domain/model/character_model.dart';
import 'package:rich_and_morti_test_task/feature/episode/data/source/remote/episode_api_remote_source.dart';
import 'package:rich_and_morti_test_task/feature/episode/domain/model/episode_model.dart';
import 'package:rich_and_morti_test_task/feature/episode/domain/repository/episode_repository.dart';

class EpisodeRepositoryImpl extends EpisodeRepository {
  EpisodeRepositoryImpl(this.episodeApiRemoteSource);

  final EpisodeApiRemoteSource episodeApiRemoteSource;

  @override
  Future<AllEpisodeModel> getAllEpisode(int page) async {
    try {
      final episodes = await episodeApiRemoteSource.getAllEpisode(page);
      return episodes;
    } on DioException catch (error) {
      throw Exception(error.response?.data);
    }
  }

  @override
  Future<Character> getCharacterFromEpisode(int characterId) async {
    try {
      final episodes =
          await episodeApiRemoteSource.getCharactersFromEpisode(characterId);
      return episodes;
    } on DioException catch (error) {
      throw Exception(error.response?.data);
    }
  }

  @override
  Future<EpisodeModel> getDetailEpisode(int episodeId) async {
    try {
      final detailEpisode =
          await episodeApiRemoteSource.getDetailEpisode(episodeId);
      return detailEpisode;
    } on DioException catch (error) {
      throw Exception(error.response?.data);
    }
  }
}
