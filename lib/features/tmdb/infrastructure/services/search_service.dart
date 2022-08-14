import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:showcase_the_movie_guide/core/constants.dart';
import 'package:showcase_the_movie_guide/features/tmdb/infrastructure/models/search_page_model.dart';

part 'search_service.g.dart';

@LazySingleton()
@RestApi(baseUrl: '${Constants.tmdbApiUrl}/3/search')
abstract class SearchService {
  @factoryMethod
  factory SearchService(Dio dio) = _SearchService;

  @GET('/multi')
  Future<SearchPageModel> multiSearch({
    @Query('query') required String query,
    @Query('page') int page = 1,
    @Query('include_adult') bool includeAdult = false,
  });
}
