import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rich_and_morti_test_task/app/navigation/router.gr.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        CharacterRoute(),
        EpisodesRoute(),
      ],
      animationDuration: const Duration(microseconds: 0),
      bottomNavigationBuilder: (context, router) {
        return BottomNavigationBar(
          currentIndex: router.activeIndex,
          onTap: router.setActiveIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Герои'),
            BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Эпизоды'),
          ],
        );
      },
    );
  }
}
