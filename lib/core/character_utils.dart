
import 'package:flutter/material.dart';

Color characterStatusColor(String status) {
  switch (status) {
    case 'Alive':
      return Colors.green;
    case 'Dead':
      return Colors.red;
    case 'unknown':
      return Colors.grey;
    default:
      return Colors.red;
  }
}

IconData characterGender(String gender) {
  switch (gender) {
    case 'Male':
      return Icons.male;
    case 'Female':
      return Icons.female;
    case 'unknown':
      return Icons.transgender;
    default:
      return Icons.question_mark;
  }
}

Color characterGenderColor(String gender) {
  switch (gender) {
    case 'Male':
      return Colors.blue;
    case 'Female':
      return Colors.pink;
    case 'unknown':
      return Colors.grey;
    default:
      return Colors.red;
  }
}