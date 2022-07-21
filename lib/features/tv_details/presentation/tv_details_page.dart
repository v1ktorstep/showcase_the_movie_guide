import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcase_the_movie_guide/core/di/injectable.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/media.dart';
import 'package:showcase_the_movie_guide/features/tv_details/application/tv_details_bloc.dart';

class TvDetailsPage extends StatelessWidget {
  final Tv tv;

  const TvDetailsPage({
    Key? key,
    required this.tv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return getIt<TvDetailsBloc>()
          ..add(TvDetailsEvent.loadDetails(tv.id.toString()));
      },
      child: Scaffold(
        body: _TvDetails(tv: tv),
      ),
    );
  }
}

class _TvDetails extends StatelessWidget {
  final Tv tv;

  const _TvDetails({
    Key? key,
    required this.tv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: tv.backdropPath ?? '',
          height: 240,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            tv.originalName,
            style: theme.textTheme.headlineSmall,
          ),
        ),
        BlocBuilder<TvDetailsBloc, TvDetailsState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (details) {
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
                            Text(details.firstAirDate),
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
            tv.overview,
            style: theme.textTheme.bodyMedium,
          ),
        )
      ],
    );
  }
}
