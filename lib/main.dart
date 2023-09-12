import 'package:flutter/material.dart';
import 'package:rich_and_morti_test_task/app/app.dart';
import 'package:rich_and_morti_test_task/app/di/dependecy_injection.dart';

void main() async{
  await initServiceLocator();
  runApp(const RichAndMortApp());
}

