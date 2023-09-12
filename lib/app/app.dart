import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rich_and_morti_test_task/app/di/dependecy_injection.dart';
import 'package:rich_and_morti_test_task/app/navigation/router.gr.dart';
import 'package:rich_and_morti_test_task/feature/characters/presentation/bloc/character_bloc.dart';
import 'package:rich_and_morti_test_task/feature/episode/presentation/bloc/episode_bloc.dart';

import '../feature/home/presentation/page/home_screen.dart';
import 'navigation/router.dart';

class RichAndMortApp extends StatefulWidget {
  const RichAndMortApp({Key? key}) : super(key: key);

  @override
  State<RichAndMortApp> createState() => _RichAndMortAppState();
}

class _RichAndMortAppState extends State<RichAndMortApp> {

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CharacterBloc>(
          create: (context) => diInstance<CharacterBloc>(),
        ),
        BlocProvider<EpisodeBloc>(
          create: (context) => diInstance<EpisodeBloc>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ru'),
        ],
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
