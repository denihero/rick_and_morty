import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:rich_and_morti_test_task/feature/episode/domain/model/episode_model.dart';

@RoutePage()
class EpisodeDetailScreen extends StatefulWidget {
  const EpisodeDetailScreen({Key? key, required this.episode})
      : super(key: key);

  final EpisodeModel episode;

  @override
  State<EpisodeDetailScreen> createState() => _EpisodeDetailScreenState();
}

class _EpisodeDetailScreenState extends State<EpisodeDetailScreen> {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                widget.episode.name ?? '',
                style: const TextStyle(fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
