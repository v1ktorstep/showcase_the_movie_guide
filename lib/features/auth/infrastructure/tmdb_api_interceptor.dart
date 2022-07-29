import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class TmdbApiInterceptor extends Interceptor {
  final _apiKey = '35a52d3a97729104ddb4cb658b98c254';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters['api_key'] = _apiKey;

    super.onRequest(options, handler);
  }
}
