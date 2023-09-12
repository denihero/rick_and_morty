import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rich_and_morti_test_task/app/navigation/router.gr.dart';
import 'package:rich_and_morti_test_task/feature/characters/domain/model/character_model.dart';
import 'package:rich_and_morti_test_task/feature/characters/presentation/widget/character_gender.dart';
import 'package:rich_and_morti_test_task/feature/characters/presentation/widget/character_status.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({Key? key, required this.character}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {
          context.router.push(
            CharacterDetailRoute(character: character),
          );
        },
        child: Container(
          height: 140,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(228, 220, 206, 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12)),
                child: CachedNetworkImage(
                  imageUrl: character.image ?? '',
                  width: 160,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        width: 200,
                        child: Text(
                          character.name ?? '',
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        character.species ?? '',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          SizedBox(
                              child: CharacterStatus(
                                  status: character.status ?? '')),
                          const SizedBox(
                            width: 20,
                          ),
                          CharacterGender(gender: character.gender ?? '')
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
