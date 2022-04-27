import 'package:injectable/injectable.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/movie_page.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/i_tmdb_repository.dart';
import 'package:showcase_the_movie_guide/features/tmdb/infrastructure/tmdb_movie_service.dart';

@LazySingleton(as: ITmdbMovieRepository)
class TmdbMovieRepository implements ITmdbMovieRepository {
  final TmdbMovieService _service;

  TmdbMovieRepository(this._service);

  @override
  Future<MoviePage> loadNowPlaying({int page = 0}) {
    return _service.getNowPlaying(page: page).then((value) => value.toDomain());
  }

  @override
  Future<MoviePage> loadPopular({int page = 0}) {
    return _service.getPopular(page: page).then((value) => value.toDomain());
  }

  @override
  Future<MoviePage> loadTopRated({int page = 0}) {
    return _service.getTopRated(page: page).then((value) => value.toDomain());
  }

  @override
  Future<MoviePage> loadUpcoming({int page = 0}) {
    return _service.getUpcoming(page: page).then((value) => value.toDomain());
  }
}
