import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:showcase_the_movie_guide/features/auth/infrastructure/tmdb_api_interceptor.dart';
import 'package:showcase_the_movie_guide/features/auth/infrastructure/tmdb_auth_interceptor.dart';

const kDioAuth = 'dioAuth';

@module
abstract class DioModule {
  @LazySingleton()
  Dio getDio(TmdbApiInterceptor apiInterceptor) {
    final dio = Dio();

    dio.interceptors.addAll([
      LogInterceptor(responseBody: true),
      apiInterceptor,
    ]);

    return dio;
  }

  @Named(kDioAuth)
  @LazySingleton()
  Dio getDioAuth(
    TmdbApiInterceptor apiInterceptor,
    TmdbAuthInterceptor authInterceptor,
  ) {
    final dio = Dio();

    dio.interceptors.addAll([
      LogInterceptor(responseBody: true),
      apiInterceptor,
      authInterceptor,
    ]);

    return dio;
  }
}
