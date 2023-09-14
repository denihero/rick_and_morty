import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EpisodeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const EpisodeAppBar({Key? key, required this.isSearchOpen, required this.onPressedSearch, this.onChanged}) : super(key: key);

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
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
