import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rich_and_morti_test_task/feature/characters/domain/model/character_model.dart';
import 'package:rich_and_morti_test_task/feature/characters/domain/model/character_model.dart';
import 'package:rich_and_morti_test_task/feature/characters/presentation/bloc/character_bloc.dart';
import 'package:rich_and_morti_test_task/feature/characters/presentation/widget/character_card.dart';

@RoutePage()
class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  AllCharacterModel? allCharacter;

  @override
  void initState() {
    context.read<CharacterBloc>().add(const GetAllCharacter(1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<CharacterBloc>().add(const GetAllCharacter(1));
        },
        child: BlocConsumer<CharacterBloc, CharacterState>(
          listener: (context, state) {
            if (state is CharacterSuccess) {
              allCharacter = state.allCharacter;
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
                  delegate: SliverChildBuilderDelegate(
                    childCount: allCharacter?.results?.length ?? 0,
                    (context, index) {
                      return CharacterCard(
                        character: allCharacter!.results![index],
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
