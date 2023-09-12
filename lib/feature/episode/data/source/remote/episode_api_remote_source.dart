import 'package:rich_and_morti_test_task/app/network/network_error.dart';
import 'package:rich_and_morti_test_task/feature/episode/data/data_source/episode_data_source.dart';
import 'package:rich_and_morti_test_task/feature/episode/domain/model/episode_model.dart';

class EpisodeApiRemoteSource{
  EpisodeApiRemoteSource(this.episodeDataSource);

  final EpisodeDataSource episodeDataSource;

  Future<AllEpisodeModel> getAllEpisode(int page) async{
    final response = await episodeDataSource.getAllEpisode(page);

    if(response.statusCode == 200){
      return AllEpisodeModel.fromJson(response.data);
    }else if(response.statusCode! >= 400){
      throw Exception(response.statusCode);
    }else {
      throw ResponseError(message: 'Ошибка');
    }
  }

}