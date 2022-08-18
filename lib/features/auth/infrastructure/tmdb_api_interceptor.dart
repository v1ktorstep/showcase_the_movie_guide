import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:showcase_the_movie_guide/secrets.dart';

@Injectable()
class TmdbApiInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters['api_key'] = apiKey;

    super.onRequest(options, handler);
  }
}
