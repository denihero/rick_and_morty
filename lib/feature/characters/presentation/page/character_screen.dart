import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rich_and_morti_test_task/feature/characters/domain/model/character_model.dart';
import 'package:rich_and_morti_test_task/feature/characters/presentation/bloc/character_bloc.dart';
import 'package:rich_and_morti_test_task/feature/characters/presentation/widget/character_app_bar.dart';
import 'package:rich_and_morti_test_task/feature/characters/presentation/widget/character_card.dart';

@RoutePage()
class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  AllCharacterModel? allCharacter;
  late ScrollController scrollController;
  bool isPaginate = false;
  bool isSearchOpen = false;
  List<Character>? listCharacter = [];

  @override
  void initState() {
    scrollController = ScrollController();
    context.read<CharacterBloc>().add(GetAllCharacter());
    scrollController.addListener(() {
      var nextPageTrigger = 0.8 * scrollController.position.maxScrollExtent;
      if (scrollController.position.pixels > nextPageTrigger) {
        if (isPaginate == false) {
          context.read<CharacterBloc>().page += 1;
          context.read<CharacterBloc>().add(GetAllCharacter());
          isPaginate = true;
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CharacterAppBar(
        isSearchOpen: isSearchOpen,
        onPressedSearch: () {
          if (isSearchOpen) {
            setState(() {
              isSearchOpen = false;
              listCharacter = allCharacter?.results;
            });
          } else {
            setState(() {
              isSearchOpen = true;
            });
          }
        },
        onChanged: (value) {
          setState(() {
            listCharacter = allCharacter?.results
                ?.where((element) =>
                    element.name!.toLowerCase().contains(value.toLowerCase()))
                .toList();
          });
        },
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<CharacterBloc>().add(GetAllCharacter());
        },
        child: BlocConsumer<CharacterBloc, CharacterState>(
          listener: (context, state) {
            if (state is CharacterSuccess) {
              allCharacter = state.allCharacter;
              listCharacter = state.allCharacter.results;
              isPaginate = false;
            } else if (state is CharacterError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is CharacterLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: listCharacter?.length ?? 0,
                    (context, index) {
                      return CharacterCard(
                        character: listCharacter![index],
                      );
                    },
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      if (state is CharacterLoadMore &&
                          allCharacter?.info?.next != null)
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
