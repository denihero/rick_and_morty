import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rich_and_morti_test_task/app/navigation/router.gr.dart';
import 'package:rich_and_morti_test_task/feature/episode/domain/model/episode_model.dart';

class EpisodeCard extends StatelessWidget {
  const EpisodeCard({Key? key, required this.episode}) : super(key: key);

  final EpisodeModel episode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: GestureDetector(
        onTap: () {
          context.router.push(EpisodeDetailRoute(episode: episode));
        },
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(237, 230, 220, 1),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        episode.episode ?? '',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 200, child: Text(episode.name ?? '')),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  episode.airDate ?? '',
                  style: const TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
