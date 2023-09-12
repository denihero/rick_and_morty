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
  late ScrollController scrollController;
  bool isPaginate = false;

  @override
  void initState() {
    scrollController = ScrollController();
    context.read<EpisodeBloc>().add(const GetAllEpisode());
    scrollController.addListener(() {
      var nextPageTrigger = 0.8 * scrollController.position.maxScrollExtent;
      if (scrollController.position.pixels > nextPageTrigger) {
        if (!isPaginate) {
          context.read<EpisodeBloc>().page += 1;
          context.read<EpisodeBloc>().add(const GetAllEpisode());
          isPaginate = true;
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Rick and Morty Series',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<EpisodeBloc>().add(const GetAllEpisode());
        },
        child: BlocConsumer<EpisodeBloc, EpisodeState>(
          listener: (context, state) {
            if (state is EpisodeSuccess) {
              allEpisode = state.allEpisode;
              isPaginate = false;
            }
          },
          builder: (context, state) {
            if (state is EpisodeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomScrollView(
              controller: scrollController,
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
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      if (state is EpisodeLoadMore &&
                          allEpisode?.info?.next != null)
                        const Center(
                          child: CircularProgressIndicator(),
                        )
                    ],
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
