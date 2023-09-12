import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rich_and_morti_test_task/feature/episode/domain/model/episode_model.dart';
import 'package:rich_and_morti_test_task/feature/episode/presentation/bloc/episode_bloc.dart';
import 'package:rich_and_morti_test_task/feature/episode/presentation/widget/episode_card.dart';

@RoutePage()
class EpisodesScreen extends StatefulWidget {
  const EpisodesScreen({Key? key}) : super(key: key);

  @override
  State<EpisodesScreen> createState() => _EpisodesScreenState();
}

class _EpisodesScreenState extends State<EpisodesScreen> {
  AllEpisodeModel? allEpisode;

  @override
  void initState() {
    context.read<EpisodeBloc>().add(const GetAllEpisode(1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<EpisodeBloc>().add(const GetAllEpisode(1));
        },
        child: BlocConsumer<EpisodeBloc, EpisodeState>(
          listener: (context, state) {
            if (state is EpisodeSuccess) {
              allEpisode = state.allEpisode;
            }
          },
          builder: (context, state) {
            if (state is EpisodeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: allEpisode?.results?.length ?? 0,
                    (context, index) {
                      return EpisodeCard(
                        episode: allEpisode!.results![index],
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
