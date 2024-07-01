import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';

class TokenService {
  final _storage = FlutterSecureStorage();

  Future<void> storeToken(String token) async {
    await _storage.write(key: 'jwt_token', value: token);
  }

  Future<String?> getToken() async {
    String? token = await _storage.read(key: 'jwt_token');
    if (token != null) {}
    return token;
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: 'jwt_token');
  }

  Map<String, dynamic>? decodeToken(String token) {
    if (Jwt.isExpired(token)) {
      return null;
    }
    return Jwt.parseJwt(token);
  }

  String? getUsername(String token) {
    var decodedToken = decodeToken(token);
    if (decodedToken != null)
      return decodedToken[
          'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier'];
    return null;
  }

  String? getEmail(String token) {
    var decodedToken = decodeToken(token);
    if (decodedToken != null)
      return decodedToken[
          'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress'];
    return null;
  }

  List<String>? getRoles(String token) {
    var decodedToken = decodeToken(token);
    dynamic roleData = decodedToken![
        'http://schemas.microsoft.com/ws/2008/06/identity/claims/role'];
    List<String> roles;
    if (roleData is String) {
      roles = [roleData];
    } else if (roleData is List) {
      roles = List<String>.from(roleData);
    } else {
      roles = [];
    }
    return roles;
  }
}
