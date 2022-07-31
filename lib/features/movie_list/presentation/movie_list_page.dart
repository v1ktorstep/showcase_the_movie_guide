import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcase_the_movie_guide/core/di/injectable.dart';
import 'package:showcase_the_movie_guide/features/movie_list/application/item_source.dart';
import 'package:showcase_the_movie_guide/features/movie_list/application/movie_list_bloc.dart';
import 'package:showcase_the_movie_guide/features/movie_list/presentation/movie_category.dart';
import 'package:showcase_the_movie_guide/features/movie_list/presentation/tv_category.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/movie_page.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/tv_page.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return getIt<MovieListBloc>()..add(const MovieListEvent.load());
      },
      child: Scaffold(
        body: BlocBuilder<MovieListBloc, MovieListState>(
          builder: (context, state) {
            return state.when(
              initial: () => const _MovieListLoading(),
              loading: () => const _MovieListLoading(),
              error: () => const _MovieListError(),
              loaded: (
                movieCategories,
                tvCategories,
              ) {
                return _MovieList(
                  movieCategories: movieCategories,
                  tvCategories: tvCategories,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _MovieListLoading extends StatelessWidget {
  const _MovieListLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _MovieListError extends StatelessWidget {
  const _MovieListError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Error'),
    );
  }
}

class _MovieList extends StatelessWidget {
  final List<ItemSource<MoviePage>> movieCategories;
  final List<ItemSource<TvPage>> tvCategories;

  const _MovieList({
    Key? key,
    required this.movieCategories,
    required this.tvCategories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movieCategories.length + tvCategories.length,
      itemBuilder: (context, index) {
        if (index < movieCategories.length) {
          return MovieCategory(itemSource: movieCategories[index]);
        } else {
          return TvCategory(
            itemSource: tvCategories[index - movieCategories.length],
          );
        }
      },
    );
  }
}
