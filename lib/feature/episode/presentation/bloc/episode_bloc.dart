
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rich_and_morti_test_task/feature/episode/domain/model/episode_model.dart';
import 'package:rich_and_morti_test_task/feature/episode/domain/repository/episode_repository.dart';

part 'episode_event.dart';
part 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final EpisodeRepository episodeRepository;
  EpisodeBloc(this.episodeRepository) : super(EpisodeInitial()) {
    on<GetAllEpisode>(getAllEpisodes);
  }
  int page = 1;
  List<EpisodeModel> episodes = [];

  void getAllEpisodes(GetAllEpisode event, Emitter emit) async {
    page == 1 ? emit(EpisodeLoading()) : emit(EpisodeLoadMore());
    try {
      final result = await episodeRepository.getAllEpisode(page);
      episodes.addAll(result.results!);
      emit(
        EpisodeSuccess(
          AllEpisodeModel(info: result.info, results: episodes),
        ),
      );
    } catch (e) {
      emit(EpisodeError(e.toString()));
    }
  }
}
