import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:showcase_the_movie_guide/core/constants.dart';
import 'package:showcase_the_movie_guide/core/di/modules/dio_module.dart';
import 'package:showcase_the_movie_guide/features/account/domain/entities/account_details.dart';
import 'package:showcase_the_movie_guide/features/account/domain/entities/favorite_media.dart';
import 'package:showcase_the_movie_guide/features/account/domain/entities/favorite_movies_page.dart';
import 'package:showcase_the_movie_guide/features/account/domain/entities/favorite_tv_page.dart';

part 'account_service.g.dart';

@LazySingleton()
@RestApi(baseUrl: '${Constants.tmdbApiUrl}/3/')
abstract class AccountService {
  @factoryMethod
  factory AccountService(@Named(kDioAuth) Dio dio) = _AccountService;

  @GET('/account')
  Future<AccountDetails> accountDetails();

  @GET('/account/{account_id}/favorite/movies')
  Future<FavoriteMoviesPage> favoriteMovies({
    @Path('account_id') String? accountId,
    @Query('page') int page = 1,
  });

  @GET('/account/{account_id}/favorite/tv')
  Future<FavoriteTvPage> favoriteTv({
    @Path('account_id') String? accountId,
    @Query('page') int page = 1,
  });

  @Headers({'Content-Type': 'application/json;charset=u'})
  @POST('/account/{account_id}/favorite')
  Future<void> favorite({
    @Path('account_id') String? accountId,
    @Body() required FavoriteMedia media,
  });
}
