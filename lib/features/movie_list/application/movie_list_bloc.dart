import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/movie_page.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/tv_page.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/i_tmdb_repository.dart';
import 'package:showcase_the_movie_guide/features/movie_list/application/item_source.dart';

part 'movie_list_event.dart';

part 'movie_list_state.dart';

part 'movie_list_bloc.freezed.dart';

@Injectable()
class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final ITmdbRepository _movieRepository;

  MovieListBloc(
    this._movieRepository,
  ) : super(const MovieListState.initial()) {
    on<Load>(_load);
    on<Refresh>(_refresh);
  }

  FutureOr<void> _load(Load event, Emitter<MovieListState> emit) async {
    emit(const MovieListState.loading());

    final movieCategories = <ItemSource<MoviePage>>[
      ItemSource(
        key: 'popularMovies',
        source: _movieRepository.loadPopularMovies,
      ),
      ItemSource(
        key: 'topRatedMovies',
        source: _movieRepository.loadTopRatedMovies,
      ),
      ItemSource(
        key: 'upcomingMovies',
        source: _movieRepository.loadUpcomingMovies,
      ),
    ];

    final tvCategories = <ItemSource<TvPage>>[
      ItemSource(
        key: 't',
        source: _movieRepository.loadPopularTv,
      ),
    ];

    try {
      for (var i = 0; i < movieCategories.length; i++) {
        final category = movieCategories[i];
        final preloaded = await category.source(page: 1);

        movieCategories[i] = category.copyWith(preloaded: preloaded);
      }

      emit(MovieListState.loaded(movieCategories, tvCategories));
    } catch (e) {
      // TODO: Handle exceptions.
    }
  }

  FutureOr<void> _refresh(Refresh event, Emitter<MovieListState> emit) {}
}
