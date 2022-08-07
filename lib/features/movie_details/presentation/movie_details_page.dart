import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcase_the_movie_guide/core/di/injectable.dart';
import 'package:showcase_the_movie_guide/features/movie_details/application/movie_details_bloc.dart';
import 'package:showcase_the_movie_guide/features/movie_details/presentation/moive_details_content.dart';
import 'package:showcase_the_movie_guide/features/movie_details/presentation/tv_details_content.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/media.dart';

class MovieDetailsPage extends StatelessWidget {
  final Media media;

  const MovieDetailsPage({
    Key? key,
    required this.media,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return getIt<MovieDetailsBloc>()
          ..add(MovieDetailsEvent.loadDetails(media));
      },
      child: Scaffold(
        body: media.maybeMap(
          movie: (movie) => MovieDetailsContent(movie: movie),
          tv: (tv) => TvDetailsContent(tv: tv),
          orElse: () => Container(),
        ),
      ),
    );
  }
}
