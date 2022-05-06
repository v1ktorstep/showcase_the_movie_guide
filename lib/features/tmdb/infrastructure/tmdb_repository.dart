import 'package:injectable/injectable.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/media.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/media_page.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/i_tmdb_repository.dart';
import 'package:showcase_the_movie_guide/features/tmdb/infrastructure/tmdb_movie_service.dart';

@LazySingleton(as: ITmdbRepository)
class TmdbRepository implements ITmdbRepository {
  final TmdbMovieService _movieService;

  TmdbRepository(this._movieService);

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
}
