abstract class AuthLocalDataSources {
  Future<void> saveToken(String token);
  Future<String?> getToken();
}