import 'package:rich_and_morti_test_task/feature/characters/domain/model/character_model.dart';
import 'package:rich_and_morti_test_task/feature/episode/domain/model/episode_model.dart';

abstract class EpisodeRepository{
  Future<AllEpisodeModel> getAllEpisode(int page);
  Future<Character> getCharacterFromEpisode(int characterId);
  Future<EpisodeModel> getDetailEpisode(int episodeId);
}