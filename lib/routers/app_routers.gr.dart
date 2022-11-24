// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_routers.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    NewMovieRoute.name: (routeData) {
      final args = routeData.argsAs<NewMovieRouteArgs>(
          orElse: () => const NewMovieRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: NewMoviePage(key: args.key),
      );
    },
    UpdateMovieRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateMovieRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: UpdateMoviePage(
          key: args.key,
          id: args.id,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/home',
          fullMatch: true,
        ),
        RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        RouteConfig(
          NewMovieRoute.name,
          path: '/newMoviePage',
        ),
        RouteConfig(
          UpdateMovieRoute.name,
          path: '/updateMoviePage',
        ),
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [NewMoviePage]
class NewMovieRoute extends PageRouteInfo<NewMovieRouteArgs> {
  NewMovieRoute({Key? key})
      : super(
          NewMovieRoute.name,
          path: '/newMoviePage',
          args: NewMovieRouteArgs(key: key),
        );

  static const String name = 'NewMovieRoute';
}

class NewMovieRouteArgs {
  const NewMovieRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'NewMovieRouteArgs{key: $key}';
  }
}

/// generated route for
/// [UpdateMoviePage]
class UpdateMovieRoute extends PageRouteInfo<UpdateMovieRouteArgs> {
  UpdateMovieRoute({
    Key? key,
    required int id,
  }) : super(
          UpdateMovieRoute.name,
          path: '/updateMoviePage',
          args: UpdateMovieRouteArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'UpdateMovieRoute';
}

class UpdateMovieRouteArgs {
  const UpdateMovieRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'UpdateMovieRouteArgs{key: $key, id: $id}';
  }
}
