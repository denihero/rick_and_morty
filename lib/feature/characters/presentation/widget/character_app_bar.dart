import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rich_and_morti_test_task/feature/characters/presentation/widget/character_filter.dart';

class CharacterAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CharacterAppBar({
    Key? key,
    required this.isSearchOpen,
    required this.onPressedSearch,
    this.onChanged,
  }) : super(key: key);

  final bool isSearchOpen;
  final Function() onPressedSearch;
  final ValueChanged<String>? onChanged;

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
                    return const Material(child: CharacterFilter());
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
