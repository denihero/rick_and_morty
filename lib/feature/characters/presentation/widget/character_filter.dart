import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rich_and_morti_test_task/core/filter_utils.dart';
import 'package:rich_and_morti_test_task/core/widget/primary_button.dart';
import 'package:rich_and_morti_test_task/feature/characters/presentation/bloc/character_bloc.dart';

class CharacterFilter extends StatefulWidget {
  const CharacterFilter(
      {Key? key,
      required this.selectedGender,
      required this.selectedStatus,
      required this.selectedSpecies,
      required this.selectedType,
      required this.onPressed})
      : super(key: key);

  final int? selectedGender;
  final int? selectedStatus;
  final int? selectedSpecies;
  final int? selectedType;
  final Function(
    int? selectedGender,
    int? selectedStatus,
    int? selectedSpecies,
    int? selectedType,
  ) onPressed;

  @override
  State<CharacterFilter> createState() => _CharacterFilterState();
}

class _CharacterFilterState extends State<CharacterFilter> {
  @override
  initState() {
    selectedType = widget.selectedType;
    selectedGender = widget.selectedGender;
    selectedSpecies = widget.selectedSpecies;
    selectedStatus = widget.selectedStatus;
    super.initState();
  }

  int? selectedGender;
  int? selectedStatus;
  int? selectedSpecies;
  int? selectedType;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Filter',
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                    Material(
                      child: IconButton(
                        onPressed: () {
                          context.router.pop();
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 45,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Gender',
                      style: TextStyle(fontSize: 18),
                    ),
                    Row(
                      children: genderChips(),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('Status', style: TextStyle(fontSize: 18)),
                    Row(
                      children: statusChips(),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('Species', style: TextStyle(fontSize: 18)),
                    Wrap(
                      children: speciesChip(),
                    ),
                    const Text('type', style: TextStyle(fontSize: 18)),
                    Wrap(
                      children: typeChip(),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      PrimaryButton(
                        onPressed: useFilter,
                        height: 50,
                        title: 'Apply',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      PrimaryButton(
                          onPressed: cleanFilter,
                          height: 50,
                          title: 'Clean')
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void useFilter() {
    context.router.pop();
    context
        .read<CharacterBloc>()
        .filteredCharacterList
        .clear();
    context.read<CharacterBloc>().page = 1;
    widget.onPressed.call(
      selectedGender,
      selectedStatus,
      selectedSpecies,
      selectedType,
    );
    context.read<CharacterBloc>().add(
      FilterCharacter(
        gender: selectedGender != null
            ? gender[selectedGender!]
            : '',
        status: selectedStatus != null
            ? status[selectedStatus!]
            : '',
        species: selectedSpecies != null
            ? species[selectedSpecies!]
            : '',
        type: selectedType != null
            ? type[selectedType!]
            : null,
      ),
    );
  }
  void cleanFilter() {
    setState(() {
      selectedStatus = null;
      selectedGender = null;
      selectedType = null;
      selectedSpecies = null;
    });
    widget.onPressed.call(
      selectedGender,
      selectedStatus,
      selectedSpecies,
      selectedType,
    );
  }

  List<Widget> genderChips() {
    List<Widget> chips = [];

    for (int i = 0; i < gender.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: ChoiceChip(
          label: Text(gender[i]),
          labelStyle: const TextStyle(color: Colors.white),
          backgroundColor: Colors.blue,
          selected: selectedGender == i,
          selectedColor: Colors.black,
          onSelected: (bool value) {
            setState(() {
              selectedGender = i;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  List<Widget> statusChips() {
    List<Widget> chips = [];

    for (int i = 0; i < status.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: ChoiceChip(
          label: Text(status[i]),
          labelStyle: const TextStyle(color: Colors.white),
          backgroundColor: Colors.blue,
          selected: selectedStatus == i,
          selectedColor: Colors.black,
          onSelected: (bool value) {
            setState(() {
              selectedStatus = i;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  List<Widget> speciesChip() {
    List<Widget> chips = [];

    for (int i = 0; i < species.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: ChoiceChip(
          label: Text(species[i]),
          labelStyle: const TextStyle(color: Colors.white),
          backgroundColor: Colors.blue,
          selected: selectedSpecies == i,
          selectedColor: Colors.black,
          onSelected: (bool value) {
            setState(() {
              selectedSpecies = i;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  List<Widget> typeChip() {
    List<Widget> chips = [];

    for (int i = 0; i < type.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: ChoiceChip(
          label: Text(type[i]),
          labelStyle: const TextStyle(color: Colors.white),
          backgroundColor: Colors.blue,
          selected: selectedType == i,
          selectedColor: Colors.black,
          onSelected: (bool value) {
            setState(() {
              selectedType = i;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }
}
