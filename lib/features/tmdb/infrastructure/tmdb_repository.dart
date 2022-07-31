import 'package:injectable/injectable.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/media.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/movie_details.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/movie_page.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/tv_details.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/tv_page.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/i_tmdb_repository.dart';
import 'package:showcase_the_movie_guide/features/tmdb/infrastructure/services/tmdb_movie_service.dart';
import 'package:showcase_the_movie_guide/features/tmdb/infrastructure/services/tmdb_tv_service.dart';

@LazySingleton(as: ITmdbRepository)
class TmdbRepository implements ITmdbRepository {
  final TmdbMovieService _movieService;
  final TmdbTvService _tvService;

  TmdbRepository(this._movieService, this._tvService);

  @override
  Future<MoviePage> loadNowPlayingMovies({int page = 0}) {
    return _movieService
        .getNowPlaying(page: page)
        .then((value) => value.toDomain());
  }

  @override
  Future<MoviePage> loadPopularMovies({int page = 0}) {
    return _movieService
        .getPopular(page: page)
        .then((value) => value.toDomain());
  }

  @override
  Future<MoviePage> loadTopRatedMovies({int page = 0}) {
    return _movieService
        .getTopRated(page: page)
        .then((value) => value.toDomain());
  }

  @override
  Future<MoviePage> loadUpcomingMovies({int page = 0}) {
    return _movieService
        .getUpcoming(page: page)
        .then((value) => value.toDomain());
  }

  @override
  Future<TvPage> loadAiringTodayTv({int page = 0}) {
    return _tvService
        .getAiringToday(page: page)
        .then((value) => value.toDomain());
  }

  @override
  Future<TvPage> loadOnTheAirTv({int page = 0}) {
    return _tvService.getOnTheAir(page: page).then((value) => value.toDomain());
  }

  @override
  Future<TvPage> loadPopularTv({int page = 0}) {
    return _tvService.getPopular(page: page).then((value) => value.toDomain());
  }

  @override
  Future<TvPage> loadTopRatedTv({int page = 0}) {
    return _tvService.getTopRated(page: page).then((value) => value.toDomain());
  }

  @override
  Future<MovieDetails> loadMovieDetails(String id) {
    return _movieService.getMovieDetails(id).then((value) => value.toDomain());
  }

  @override
  Future<TvDetails> loadTvDetails(String id) {
    return _tvService.getTvDetails(id).then((value) => value.toDomain());
  }
}
