import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcase_the_movie_guide/features/movie_details/application/movie_details_bloc.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/media.dart';

class MovieDetailsContent extends StatelessWidget {
  final Movie movie;

  const MovieDetailsContent({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: movie.backdropPath ?? '',
          height: 240,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            movie.title,
            style: theme.textTheme.headlineSmall,
          ),
        ),
        BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            return state.maybeWhen(
              movieDetailsLoaded: (details) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Release Date'),
                            Text(details.releaseDate),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Genre'),
                            Text(details.genres.map((e) => e.name).join(', '))
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              orElse: () => Container(),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Overview',
            style: theme.textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            movie.overview,
            style: theme.textTheme.bodyMedium,
          ),
        )
      ],
    );
  }
}
