import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rich_and_morti_test_task/feature/episode/domain/model/episode_model.dart';

class EpisodeCard extends StatelessWidget {
  const EpisodeCard({Key? key, required this.episode}) : super(key: key);

  final EpisodeModel episode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 160,
        width: double.infinity,
        color: Colors.blue,
      ),
    );
  }
}
