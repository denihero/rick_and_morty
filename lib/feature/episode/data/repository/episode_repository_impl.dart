import 'package:dio/dio.dart';
import 'package:rich_and_morti_test_task/feature/episode/data/source/remote/episode_api_remote_source.dart';
import 'package:rich_and_morti_test_task/feature/episode/domain/model/episode_model.dart';
import 'package:rich_and_morti_test_task/feature/episode/domain/repository/episode_repository.dart';

class EpisodeRepositoryImpl extends EpisodeRepository {
  EpisodeRepositoryImpl(this.episodeApiRemoteSource);

  final EpisodeApiRemoteSource episodeApiRemoteSource;

  @override
  Future<AllEpisodeModel> getAllEpisode(int page) {
    try {
      final episodes = episodeApiRemoteSource.getAllEpisode(page);
      return episodes;
    } on DioException catch (error) {
      throw Exception(error.response?.data);
    }
  }
}
