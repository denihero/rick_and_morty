import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rich_and_morti_test_task/app/navigation/router.gr.dart';
import 'package:rich_and_morti_test_task/feature/characters/domain/model/character_model.dart';

class CharacterFromEpisodeCard extends StatelessWidget {
  const CharacterFromEpisodeCard({Key? key, required this.character}) : super(key: key);

  final Character? character;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(CharacterDetailRoute(character: character!));
      },
      child: GridTile(
        footer: Container(
          width: double.infinity,
          height: 20,
          color: Colors.black,
          child: Text(
            character?.name ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 17),
          ),
        ),
        child: CachedNetworkImage(
          imageUrl: character?.image ?? '',
          errorWidget: (context,_,__) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
