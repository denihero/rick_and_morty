// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:rich_and_morti_test_task/app/navigation/empty_route/character_empty_route.dart'
    as _i1;
import 'package:rich_and_morti_test_task/app/navigation/empty_route/episodes_empty_route.dart'
    as _i3;
import 'package:rich_and_morti_test_task/feature/characters/presentation/page/character_screen.dart'
    as _i2;
import 'package:rich_and_morti_test_task/feature/episode/presentation/page/epides_screen.dart'
    as _i4;
import 'package:rich_and_morti_test_task/feature/home/presentation/page/home_screen.dart'
    as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    CharacterEmptyRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CharacterEmptyRoute(),
      );
    },
    CharacterRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CharacterScreen(),
      );
    },
    EpisodesEmptyRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.EpisodesEmptyRoute(),
      );
    },
    EpisodesRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.EpisodesScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.CharacterEmptyRoute]
class CharacterEmptyRoute extends _i6.PageRouteInfo<void> {
  const CharacterEmptyRoute({List<_i6.PageRouteInfo>? children})
      : super(
          CharacterEmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'CharacterEmptyRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CharacterScreen]
class CharacterRoute extends _i6.PageRouteInfo<void> {
  const CharacterRoute({List<_i6.PageRouteInfo>? children})
      : super(
          CharacterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CharacterRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EpisodesEmptyRoute]
class EpisodesEmptyRoute extends _i6.PageRouteInfo<void> {
  const EpisodesEmptyRoute({List<_i6.PageRouteInfo>? children})
      : super(
          EpisodesEmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'EpisodesEmptyRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.EpisodesScreen]
class EpisodesRoute extends _i6.PageRouteInfo<void> {
  const EpisodesRoute({List<_i6.PageRouteInfo>? children})
      : super(
          EpisodesRoute.name,
          initialChildren: children,
        );

  static const String name = 'EpisodesRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
