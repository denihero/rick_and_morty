import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rich_and_morti_test_task/feature/episode/domain/model/episode_model.dart';
import 'package:rich_and_morti_test_task/feature/episode/presentation/bloc/episode_bloc.dart';
import 'package:rich_and_morti_test_task/feature/episode/presentation/widget/character_from_episode_card.dart';

@RoutePage()
class EpisodeDetailScreen extends StatefulWidget {
  const EpisodeDetailScreen({Key? key, required this.episode})
      : super(key: key);

  final EpisodeModel episode;

  @override
  State<EpisodeDetailScreen> createState() => _EpisodeDetailScreenState();
}

class _EpisodeDetailScreenState extends State<EpisodeDetailScreen> {
  EpisodeModel? episode;
  @override
  void initState() {
    context.read<EpisodeBloc>().add(GetDetailEpisode(widget.episode.id ?? 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.episode.episode ?? '',
          style: const TextStyle(color: Colors.black),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: BlocConsumer<EpisodeBloc, EpisodeState>(
        listener: (context, state) {
          if (state is EpisodeDetailedLoaded) {
            episode = state.episode;
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
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Text(
                        'Name: ${episode?.name ?? ' '}',
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Text(
                        'Episode: ${episode?.episode ?? ' '}',
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                      child: Text(
                        'AirDate: ${episode?.airDate ?? ' '}',
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                        child: Text(
                          'Characters:',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: episode?.listCharacters?.length ?? 0,
                  (context, index) {
                    return CharacterFromEpisodeCard(
                      character: episode?.listCharacters?[index],
                    );
                  },
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
