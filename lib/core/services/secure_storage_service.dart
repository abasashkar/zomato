import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const _storage= FlutterSecureStorage();
  static const String accessTokenKey='access_token';
  static const String refreshTokenKey='refresh_token';


Future<void> saveAccessToken(String token)async{
 await _storage.write(key: accessTokenKey, value: token);
}
Future<void> saveRefreshToken(String token)async{
  await _storage.write(key: refreshTokenKey, value: token);
}

Future<String?> getAccessToken()async{
return _storage.read(key: accessTokenKey);
}
Future<String?> getRefreshToken()async{
  return _storage.read(key: refreshTokenKey);
}

Future<void> deleteAccessToken()async{
  await _storage.delete(key: accessTokenKey);
}
Future<void> deleteRefreshToken()async{
  await _storage.delete(key: refreshTokenKey);
}

Future<void>clearAll()async{
  await _storage.deleteAll();
}

Future<bool>isLoggedin()async{
  final token=await getAccessToken();
  return token!=null && token.isNotEmpty;
}
}