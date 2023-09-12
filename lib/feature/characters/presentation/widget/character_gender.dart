import 'package:flutter/material.dart';
import 'package:rich_and_morti_test_task/core/character_utils.dart';

class CharacterGender extends StatelessWidget {
  const CharacterGender({Key? key, required this.gender}) : super(key: key);

  final String gender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          characterGender(gender),
          color: characterGenderColor(gender),
        ),
        Text(
          gender,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
