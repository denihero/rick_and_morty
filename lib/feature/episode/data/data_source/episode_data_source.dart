import 'package:dio/dio.dart';
import 'package:rich_and_morti_test_task/app/network/dio_settings.dart';

class EpisodeDataSource{
  EpisodeDataSource({required this.client});

  final DioSetting client;

  Future<Response> getAllEpisode(int page){
    return client.dio.get('/api/episode?page=$page');
  }

  Future<Response> getDetailEpisode(int episodeId){
    return client.dio.get('/api/episode/$episodeId');
  }

  Future<Response> getCharacterFromEpisode(int characterId){
    return client.dio.get('/api/character/$characterId');
  }
}