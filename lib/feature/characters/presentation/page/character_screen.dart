import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rich_and_morti_test_task/core/filter_utils.dart';
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

  int? selectedGender;
  int? selectedStatus;
  int? selectedSpecies;
  int? selectedType;

  @override
  void initState() {
    scrollController = ScrollController();
    context.read<CharacterBloc>().add(GetAllCharacter());
    scrollController.addListener(() {
      var nextPageTrigger = 0.8 * scrollController.position.maxScrollExtent;
      if (scrollController.position.pixels > nextPageTrigger) {
        paginate();
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
        selectedGender: selectedGender,
        selectedStatus: selectedStatus,
        selectedSpecies: selectedSpecies,
        selectedType: selectedType,
        onPressed: (int? selectedGender, int? selectedStatus,
            int? selectedSpecies, int? selectedType) {
          setState(() {
            this.selectedSpecies = selectedSpecies;
            this.selectedStatus = selectedStatus;
            this.selectedGender = selectedGender;
            this.selectedType = selectedType;
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

  void paginate() {
    if (!isPaginate) {
      context.read<CharacterBloc>().page += 1;
      if (isSelectedFilter()) {
        useFilter();
      }else{
        getAllCharacters();
      }
      isPaginate = true;
    }
  }

  bool isSelectedFilter(){
    return selectedSpecies != null ||
        selectedStatus != null ||
        selectedType != null ||
        selectedGender != null;
  }

  void getAllCharacters(){
    context.read<CharacterBloc>().add(GetAllCharacter());
  }

  void useFilter(){
    context.read<CharacterBloc>().add(
      FilterCharacter(
        gender:
        selectedGender != null ? gender[selectedGender!] : '',
        status:
        selectedStatus != null ? status[selectedStatus!] : '',
        species: selectedSpecies != null
            ? species[selectedSpecies!]
            : '',
        type: selectedType != null ? type[selectedType!] : null,
      ),
    );
  }
}
