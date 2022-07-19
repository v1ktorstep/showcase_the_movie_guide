import 'package:injectable/injectable.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/media.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/media_page.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/movie_details.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/i_tmdb_repository.dart';
import 'package:showcase_the_movie_guide/features/tmdb/infrastructure/services/tmdb_movie_service.dart';
import 'package:showcase_the_movie_guide/features/tmdb/infrastructure/services/tmdb_tv_service.dart';

@LazySingleton(as: ITmdbRepository)
class TmdbRepository implements ITmdbRepository {
  final TmdbMovieService _movieService;
  final TmdbTvService _tvService;

  TmdbRepository(this._movieService, this._tvService);

  @override
  Future<MediaPage<Movie>> loadNowPlayingMovies({int page = 0}) {
    return _movieService
        .getNowPlaying(page: page)
        .then((value) => value.toDomain());
  }

  @override
  Future<MediaPage<Movie>> loadPopularMovies({int page = 0}) {
    return _movieService
        .getPopular(page: page)
        .then((value) => value.toDomain());
  }

  @override
  Future<MediaPage<Movie>> loadTopRatedMovies({int page = 0}) {
    return _movieService
        .getTopRated(page: page)
        .then((value) => value.toDomain());
  }

  @override
  Future<MediaPage<Movie>> loadUpcomingMovies({int page = 0}) {
    return _movieService
        .getUpcoming(page: page)
        .then((value) => value.toDomain());
  }

  @override
  Future<MediaPage<Tv>> loadAiringTodayTv({int page = 0}) {
    return _tvService
        .getAiringToday(page: page)
        .then((value) => value.toDomain());
  }

  @override
  Future<MediaPage<Tv>> loadOnTheAirTv({int page = 0}) {
    return _tvService.getOnTheAir(page: page).then((value) => value.toDomain());
  }

  @override
  Future<MediaPage<Tv>> loadPopularTv({int page = 0}) {
    return _tvService.getPopular(page: page).then((value) => value.toDomain());
  }

  @override
  Future<MediaPage<Tv>> loadTopRatedTv({int page = 0}) {
    return _tvService.getTopRated(page: page).then((value) => value.toDomain());
  }

  @override
  Future<MovieDetails> loadMovieDetails(String id) {
    return _movieService.getMovieDetails(id).then((value) => value.toDomain());
  }
}
