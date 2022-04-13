abstract class SessionIdStorage {
  Future<String?> read();

  Future<void> save(String sessionId);

  Future<void> clear();
}