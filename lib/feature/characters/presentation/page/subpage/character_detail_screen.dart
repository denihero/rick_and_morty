import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rich_and_morti_test_task/feature/characters/domain/model/character_model.dart';
import 'package:rich_and_morti_test_task/feature/characters/presentation/bloc/character_bloc.dart';
import 'package:rich_and_morti_test_task/feature/episode/presentation/widget/episode_card.dart';

@RoutePage()
class CharacterDetailScreen extends StatefulWidget {
  const CharacterDetailScreen({Key? key, required this.character})
      : super(key: key);

  final Character character;

  @override
  State<CharacterDetailScreen> createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  Character? character;

  @override
  void initState() {
    context.read<CharacterBloc>().add(
          GetDetailCharacter(
            widget.character.id ?? 0,
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: BlocConsumer<CharacterBloc, CharacterState>(
        listener: (context, state) {
          if (state is CharacterDetailSuccess) {
            character = state.allCharacter;
          }
        },
        builder: (context, state) {
          if (state is CharacterLoading) {
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
                      padding: const EdgeInsets.only(top: 20),
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: character?.image ?? '',
                            width: MediaQuery.sizeOf(context).width / 1.4,
                            height: 300,
                            fit: BoxFit.cover,
                            errorWidget: (context,_,__) => const Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          character?.name ?? '',
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    dividerText('Properties', 1.5),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        characterDetail('Gender', character?.gender ?? ''),
                        characterDetail('Species', character?.species ?? ''),
                        characterDetail('Status', character?.status ?? ''),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    dividerText('Location', 1.5),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        characterDetail(
                            'Origin', character?.origin?.name ?? ''),
                        characterDetail(
                            'Species', character?.location?.name ?? ''),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    dividerText('Series', 1.5),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: character?.episode?.length ?? 0,
                  (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 5),
                      child: EpisodeCard(
                        episode: character!.episode![index],
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget characterDetail(String title, String value) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(226, 220, 208, 1),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
                child: Text(
              title,
              style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500),
            )),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            width: 200,
            height: 40,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(237, 230, 220, 1),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget dividerText(String text, double? thickness) {
  return Row(
    children: [
      Expanded(
          child: Divider(
        thickness: thickness,
      )),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      Expanded(
          child: Divider(
        thickness: thickness,
      )),
    ],
  );
}
