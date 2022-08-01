import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcase_the_movie_guide/core/di/injectable.dart';
import 'package:showcase_the_movie_guide/features/app/application/app/app_bloc_observer.dart';
import 'package:showcase_the_movie_guide/features/app/presentation/showcase_app.dart';

void main() {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      configureDependencies();

      runApp(ShowcaseApp());
    },
    blocObserver: AppBlocObserver(),
  );
}
