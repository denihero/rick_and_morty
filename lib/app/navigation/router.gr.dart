// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:rich_and_morti_test_task/app/navigation/empty_route/character_empty_route.dart'
    as _i2;
import 'package:rich_and_morti_test_task/app/navigation/empty_route/episodes_empty_route.dart'
    as _i5;
import 'package:rich_and_morti_test_task/feature/characters/domain/model/character_model.dart'
    as _i10;
import 'package:rich_and_morti_test_task/feature/characters/presentation/page/character_screen.dart'
    as _i3;
import 'package:rich_and_morti_test_task/feature/characters/presentation/page/subpage/character_detail_screen.dart'
    as _i1;
import 'package:rich_and_morti_test_task/feature/episode/domain/model/episode_model.dart'
    as _i11;
import 'package:rich_and_morti_test_task/feature/episode/presentation/page/epides_screen.dart'
    as _i6;
import 'package:rich_and_morti_test_task/feature/episode/presentation/page/subpage/episode_detail_screen.dart'
    as _i4;
import 'package:rich_and_morti_test_task/feature/home/presentation/page/home_screen.dart'
    as _i7;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    CharacterDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CharacterDetailRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CharacterDetailScreen(
          key: args.key,
          character: args.character,
        ),
      );
    },
    CharacterEmptyRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CharacterEmptyRoute(),
      );
    },
    CharacterRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CharacterScreen(),
      );
    },
    EpisodeDetailRoute.name: (routeData) {
      final args = routeData.argsAs<EpisodeDetailRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.EpisodeDetailScreen(
          key: args.key,
          episode: args.episode,
        ),
      );
    },
    EpisodesEmptyRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.EpisodesEmptyRoute(),
      );
    },
    EpisodesRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.EpisodesScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.HomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.CharacterDetailScreen]
class CharacterDetailRoute extends _i8.PageRouteInfo<CharacterDetailRouteArgs> {
  CharacterDetailRoute({
    _i9.Key? key,
    required _i10.Character character,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          CharacterDetailRoute.name,
          args: CharacterDetailRouteArgs(
            key: key,
            character: character,
          ),
          initialChildren: children,
        );

  static const String name = 'CharacterDetailRoute';

  static const _i8.PageInfo<CharacterDetailRouteArgs> page =
      _i8.PageInfo<CharacterDetailRouteArgs>(name);
}

class CharacterDetailRouteArgs {
  const CharacterDetailRouteArgs({
    this.key,
    required this.character,
  });

  final _i9.Key? key;

  final _i10.Character character;

  @override
  String toString() {
    return 'CharacterDetailRouteArgs{key: $key, character: $character}';
  }
}

/// generated route for
/// [_i2.CharacterEmptyRoute]
class CharacterEmptyRoute extends _i8.PageRouteInfo<void> {
  const CharacterEmptyRoute({List<_i8.PageRouteInfo>? children})
      : super(
          CharacterEmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'CharacterEmptyRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CharacterScreen]
class CharacterRoute extends _i8.PageRouteInfo<void> {
  const CharacterRoute({List<_i8.PageRouteInfo>? children})
      : super(
          CharacterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CharacterRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.EpisodeDetailScreen]
class EpisodeDetailRoute extends _i8.PageRouteInfo<EpisodeDetailRouteArgs> {
  EpisodeDetailRoute({
    _i9.Key? key,
    required _i11.EpisodeModel episode,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          EpisodeDetailRoute.name,
          args: EpisodeDetailRouteArgs(
            key: key,
            episode: episode,
          ),
          initialChildren: children,
        );

  static const String name = 'EpisodeDetailRoute';

  static const _i8.PageInfo<EpisodeDetailRouteArgs> page =
      _i8.PageInfo<EpisodeDetailRouteArgs>(name);
}

class EpisodeDetailRouteArgs {
  const EpisodeDetailRouteArgs({
    this.key,
    required this.episode,
  });

  final _i9.Key? key;

  final _i11.EpisodeModel episode;

  @override
  String toString() {
    return 'EpisodeDetailRouteArgs{key: $key, episode: $episode}';
  }
}

/// generated route for
/// [_i5.EpisodesEmptyRoute]
class EpisodesEmptyRoute extends _i8.PageRouteInfo<void> {
  const EpisodesEmptyRoute({List<_i8.PageRouteInfo>? children})
      : super(
          EpisodesEmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'EpisodesEmptyRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.EpisodesScreen]
class EpisodesRoute extends _i8.PageRouteInfo<void> {
  const EpisodesRoute({List<_i8.PageRouteInfo>? children})
      : super(
          EpisodesRoute.name,
          initialChildren: children,
        );

  static const String name = 'EpisodesRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
