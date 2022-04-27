import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  final _apiKey = '35a52d3a97729104ddb4cb658b98c254';

  @LazySingleton()
  Dio getDio() {
    final dio = Dio();

    dio.interceptors.addAll([
      LogInterceptor(responseBody: true),
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // TODO: Rework.
          options.queryParameters['api_key'] = _apiKey;
          return handler.next(options);
        },
      )
    ]);

    return dio;
  }
}
