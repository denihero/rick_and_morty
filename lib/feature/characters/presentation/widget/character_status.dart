import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rich_and_morti_test_task/core/character_utils.dart';

class CharacterStatus extends StatelessWidget {
  const CharacterStatus({Key? key, required this.status}) : super(key: key);

  final String status;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          color: characterStatusColor(status),
          size: 10,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          status,
          style: const TextStyle(
              color: Colors.black, fontSize: 15),
        ),
      ],
    );
  }
}
