import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:rich_and_morti_test_task/app/navigation/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/main',
          initial: true,
          children: [
            AutoRoute(
                page: CharacterEmptyRoute.page,
                path: 'character',
                children: [
                  AutoRoute(page: CharacterRoute.page, path: ''),
                  AutoRoute(page: CharacterDetailRoute.page, path: ':id')
                ]),
            AutoRoute(
                page: EpisodesEmptyRoute.page,
                path: 'episodes',
                children: [
                  AutoRoute(page: EpisodesRoute.page, path: ''),
                  AutoRoute(page: EpisodeDetailRoute.page, path: ':id')
                ]),
          ],
        )
      ];
}
