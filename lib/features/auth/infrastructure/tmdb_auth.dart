import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:showcase_the_movie_guide/features/auth/domain/request_token.dart';
import 'package:showcase_the_movie_guide/features/auth/infrastructure/session_id_storage.dart';
import 'package:showcase_the_movie_guide/features/auth/infrastructure/tmdb_auth_service.dart';

@LazySingleton()
class TmdbAuth {
  final SessionIdStorage _storage;
  final TmdbAuthService _authService;

  TmdbAuth(this._storage, this._authService);

  final _authorizationUrl = 'https://www.themoviedb.org/authenticate/';
  final _redirectionUrl = 'https://localhost:3000/callback';

  final _controller = StreamController<bool>.broadcast();

  Future<String?> getSessionId() async {
    return _storage.read();
  }

  Future<bool> isSignedIn() => getSessionId().then((value) => value != null);

  Stream<bool> watchSignIn({bool triggerImmediately = false}) {
    if (triggerImmediately) {
      isSignedIn().then(_controller.add);
    }

    return _controller.stream;
  }

  Future<RequestToken> createRequestToken() {
    return _authService.createRequestToken();
  }

  String getAuthorizationUrl(RequestToken token) {
    return _authorizationUrl +
        token.requestToken +
        '?redirect_to=$_redirectionUrl';
  }

  Future<void> createSession(RequestToken token) async {
    final session = await _authService.createSession(token.requestToken);
    _storage.save(session.sessionId);
    _controller.add(true);
  }

  Future<void> signOut() async {
    final sessionId = await _storage.read();

    if (sessionId != null) {
      _controller.add(false);
      await _storage.clear();
      await _authService.deleteSession(sessionId);
    }
  }
}
