import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rich_and_morti_test_task/feature/characters/presentation/bloc/character_bloc.dart';

class CharacterFilter extends StatefulWidget {
  const CharacterFilter({Key? key}) : super(key: key);

  @override
  State<CharacterFilter> createState() => _CharacterFilterState();
}

class _CharacterFilterState extends State<CharacterFilter> {
  List<String> status = ['Alive', 'Dead', 'unknown'];
  int? selectedGender;

  List<String> gender = ['Female', 'Male', 'Genderless', 'unknown'];
  int? selectedStatus;

  List<String> selectedItem = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Фильтрация',
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
                Text('Gender'),
                Row(
                  children: genderChips(),
                ),
                Text('Status'),
                Row(
                  children: statusChips(),
                )
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                context.router.pop();
                context.read<CharacterBloc>().add(
                      FilterCharacter(
                        gender: selectedGender != null
                            ? gender[selectedGender!]
                            : '',
                        status: selectedStatus != null
                            ? status[selectedStatus!]
                            : '',
                      ),
                    );
              },
              child: const Text('Применить')),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedStatus = null;
                  selectedGender = null;
                });
              },
              child: const Text('Очистить'))
        ],
      ),
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
}
