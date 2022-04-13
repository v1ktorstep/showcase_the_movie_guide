import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:showcase_the_movie_guide/features/auth/domain/request_token.dart';
import 'package:showcase_the_movie_guide/features/auth/domain/session.dart';

part 'tmdb_auth_service.g.dart';

@LazySingleton()
@RestApi(baseUrl: 'https://api.themoviedb.org/3/authentication/')
abstract class TmdbAuthService {
  @factoryMethod
  factory TmdbAuthService(Dio dio) = _TmdbAuthService;

  @GET('/token/new')
  Future<RequestToken> createRequestToken();

  @POST('/session/new')
  Future<Session> createSession(@Field('request_token') String requestToken);

  @DELETE('/session')
  Future<void> deleteSession(@Field('session_id') String sessionId);
}
