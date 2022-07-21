import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:showcase_the_movie_guide/features/auth/application/auth_bloc.dart';
import 'package:showcase_the_movie_guide/features/auth/presentation/authorization_page.dart';
import 'package:showcase_the_movie_guide/features/auth/presentation/sign_in_page.dart';
import 'package:showcase_the_movie_guide/features/movie_details/presentation/movie_details_page.dart';
import 'package:showcase_the_movie_guide/features/movie_list/presentation/movie_list_page.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/media.dart';
import 'package:showcase_the_movie_guide/features/tv_details/presentation/tv_details_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SignInPage),
    AutoRoute<AuthorizationStatus>(page: AuthorizationPage),
    AutoRoute(page: MovieListPage, initial: true),
    AutoRoute(page: MovieDetailsPage),
    AutoRoute(page: TvDetailsPage),
  ],
)
class AppRouter extends _$AppRouter {}
