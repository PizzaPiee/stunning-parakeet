import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Tokens {
  String? access_token;
  String? refresh_token;

  Tokens(this.access_token, this.refresh_token);
}

class SecureStorageService {
  final _storage = const FlutterSecureStorage();

  void saveTokens(String token, String rt) async {
    await _storage.write(key: 'access_token', value: token);
    await _storage.write(key: 'refresh_token', value: rt);
  }

  Future<Tokens> getTokens() async {
    String? accessToken = await _storage.read(key: 'access_token');
    String? refreshToken = await _storage.read(key: 'refresh_token');
    return Tokens(accessToken, refreshToken);
  }
}
