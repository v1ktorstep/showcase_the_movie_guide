import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:showcase_the_movie_guide/core/consts.dart';
import 'package:showcase_the_movie_guide/features/tmdb/infrastructure/models/movie_page_model.dart';

part 'tmdb_movie_service.g.dart';

@LazySingleton()
@RestApi(baseUrl: '${Consts.tmdbApiUrl}/3/movie/')
abstract class TmdbMovieService {
  @factoryMethod
  factory TmdbMovieService(Dio dio) = _TmdbMovieService;

  @GET('/now_playing')
  Future<MoviePageModel> getNowPlaying({@Query('page') int page = 0});

  @GET('/popular')
  Future<MoviePageModel> getPopular({@Query('page') int page = 0});

  @GET('/top_rated')
  Future<MoviePageModel> getTopRated({@Query('page') int page = 0});

  @GET('/upcoming')
  Future<MoviePageModel> getUpcoming({@Query('page') int page = 0});
}
