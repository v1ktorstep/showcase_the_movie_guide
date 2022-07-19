import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/movie_details.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/i_tmdb_repository.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

part 'movie_details_bloc.freezed.dart';

@Injectable()
class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final ITmdbRepository _repository;

  MovieDetailsBloc(
    this._repository,
  ) : super(const MovieDetailsState.initial()) {
    on<LoadDetails>(_loadDetails);
  }

  FutureOr<void> _loadDetails(
    LoadDetails event,
    Emitter<MovieDetailsState> emit,
  ) async {
    try {
      final details = await _repository.loadMovieDetails(event.movieId);

      emit(MovieDetailsState.loaded(details));
    } catch (e) {
      // TODO: Handle exceptions.
    }
  }
}
