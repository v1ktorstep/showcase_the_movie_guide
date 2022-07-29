import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:showcase_the_movie_guide/features/auth/infrastructure/tmdb_auth.dart';

@Injectable()
class TmdbAuthInterceptor extends Interceptor {
  final TmdbAuth _tmdbAuth;

  TmdbAuthInterceptor(this._tmdbAuth);

  String? _sessionId;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    _sessionId ??= await _tmdbAuth.getSessionId();
    if (_sessionId != null) {
      options.queryParameters['session_id'] = _sessionId;
    }

    super.onRequest(options, handler);
  }
}
