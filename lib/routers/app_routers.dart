
import 'package:auto_route/auto_route.dart';
import 'package:ctd_movie/routers/routers.dart';
import 'package:flutter/cupertino.dart';

import '../pages/home_page.dart';
import '../pages/new_movie_page.dart';
import '../pages/update_movie_page.dart';

part 'app_routers.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: Routers.home,
      page: HomePage,
      initial: true,
    ),
        AutoRoute(
      path: Routers.newMovie,
      page: NewMoviePage,
    ),
    AutoRoute(
      path: Routers.updateMovie,
      page: UpdateMoviePage,
    ),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter{}