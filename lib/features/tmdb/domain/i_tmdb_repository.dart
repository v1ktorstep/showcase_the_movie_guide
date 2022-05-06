import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/media.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/media_page.dart';

abstract class ITmdbRepository {
  Future<MediaPage<Movie>> loadNowPlayingMovies({int page});

  Future<MediaPage<Movie>> loadPopularMovies({int page});

  Future<MediaPage<Movie>> loadTopRatedMovies({int page});

  Future<MediaPage<Movie>> loadUpcomingMovies({int page});

  Future<MediaPage<Tv>> loadAiringTodayTv({int page});

  Future<MediaPage<Tv>> loadOnTheAirTv({int page});

  Future<MediaPage<Tv>> loadPopularTv({int page});

  Future<MediaPage<Tv>> loadTopRatedTv({int page});
}
