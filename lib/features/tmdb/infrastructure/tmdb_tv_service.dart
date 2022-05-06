import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:showcase_the_movie_guide/core/consts.dart';
import 'package:showcase_the_movie_guide/features/tmdb/infrastructure/models/tv_page_model.dart';

part 'tmdb_tv_service.g.dart';

@LazySingleton()
@RestApi(baseUrl: '${Consts.tmdbApiUrl}/3/tv/')
abstract class TmdbTvService {
  @factoryMethod
  factory TmdbTvService(Dio dio) = _TmdbTvService;

  @GET('/airing_today')
  Future<TvPageModel> getAiringToday({@Query('page') int page = 0});

  @GET('/on_the_air')
  Future<TvPageModel> getOnTheAir({@Query('page') int page = 0});

  @GET('/popular')
  Future<TvPageModel> getPopular({@Query('page') int page = 0});

  @GET('/top_rated')
  Future<TvPageModel> getTopRated({@Query('page') int page = 0});
}
