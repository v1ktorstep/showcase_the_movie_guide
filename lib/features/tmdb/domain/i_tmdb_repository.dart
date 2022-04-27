import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/movie_page.dart';

abstract class ITmdbMovieRepository {
  Future<MoviePage> loadNowPlaying({int page});

  Future<MoviePage> loadPopular({int page});

  Future<MoviePage> loadTopRated({int page});

  Future<MoviePage> loadUpcoming({int page});
}
