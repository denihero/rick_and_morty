import 'package:flutter/material.dart';
import 'package:rich_and_morti_test_task/feature/characters/presentation/widget/character_filter.dart';

class CharacterAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CharacterAppBar({
    Key? key,
    required this.isSearchOpen,
    required this.onPressedSearch,
    required this.selectedGender,
    required this.selectedStatus,
    required this.selectedSpecies,
    required this.selectedType,
    required this.onPressed,
    this.onChanged,
  }) : super(key: key);

  final bool isSearchOpen;
  final Function() onPressedSearch;
  final ValueChanged<String>? onChanged;
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
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: isSearchOpen
          ? TextFormField(
              onChanged: onChanged,
              decoration: const InputDecoration(hintText: 'Поиск...'),
            )
          : const SizedBox(),
      actions: [
        IconButton(
            onPressed: onPressedSearch,
            icon: Icon(
              isSearchOpen ? Icons.close : Icons.search,
              color: Colors.black,
            )),
        IconButton(
            onPressed: () {
              showAdaptiveDialog(
                  context: context,
                  builder: (context) {
                    return Material(
                        child: CharacterFilter(
                      selectedGender: selectedGender,
                      selectedStatus: selectedStatus,
                      selectedSpecies: selectedSpecies,
                      selectedType: selectedType,
                      onPressed: onPressed,
                    ));
                  });
            },
            icon: const Icon(
              Icons.filter_alt,
              color: Colors.black,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
