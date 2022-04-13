import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:showcase_the_movie_guide/features/auth/infrastructure/session_id_storage.dart';

@LazySingleton(as: SessionIdStorage)
class SecureSessionIdStorage implements SessionIdStorage {
  final FlutterSecureStorage _storage;

  SecureSessionIdStorage(this._storage);

  final _key = 'session_id';
  String? _cachedSessionId;

  @override
  Future<String?> read() async {
    return _cachedSessionId ??= await _storage.read(key: _key);
  }

  @override
  Future<void> save(String sessionId) {
    _cachedSessionId = sessionId;
    return _storage.write(key: _key, value: sessionId);
  }

  @override
  Future<void> clear() {
    _cachedSessionId = null;
    return _storage.delete(key: _key);
  }
}
