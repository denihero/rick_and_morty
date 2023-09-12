import 'package:flutter/material.dart';
import 'package:rich_and_morti_test_task/feature/characters/domain/model/character_model.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({Key? key, required this.character}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: 50,
        height: 170,
        color: Colors.red,
      ),
    );
  }
}
