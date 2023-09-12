import 'package:rich_and_morti_test_task/feature/episode/domain/model/episode_model.dart';

abstract class EpisodeRepository{
  Future<AllEpisodeModel> getAllEpisode(int page);
}