import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:showcase_the_movie_guide/features/auth/application/auth_bloc.dart';
import 'package:showcase_the_movie_guide/features/auth/presentation/authorization_page.dart';
import 'package:showcase_the_movie_guide/features/auth/presentation/sign_in_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SignInPage, initial: true),
    AutoRoute<AuthorizationStatus>(page: AuthorizationPage),
  ],
)
class AppRouter extends _$AppRouter {}
