import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/movie_details.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/movie_page.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/search_page.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/tv_details.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/tv_page.dart';

abstract class ITmdbRepository {
  Future<MoviePage> loadNowPlayingMovies({int page});

  Future<MoviePage> loadPopularMovies({int page});

  Future<MoviePage> loadTopRatedMovies({int page});

  Future<MoviePage> loadUpcomingMovies({int page});

  Future<TvPage> loadAiringTodayTv({int page});

  Future<TvPage> loadOnTheAirTv({int page});

  Future<TvPage> loadPopularTv({int page});

  Future<TvPage> loadTopRatedTv({int page});

  Future<MovieDetails> loadMovieDetails(int id);

  Future<TvDetails> loadTvDetails(int id);

  Future<SearchPage> search(String query, {int page});
}
