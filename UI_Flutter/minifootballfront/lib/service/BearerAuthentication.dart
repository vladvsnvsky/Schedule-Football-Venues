import 'package:minifootballfront/openapifiles/lib/api.dart';

class BearerAuthentication implements Authentication {
  final String token;

  BearerAuthentication(this.token);

  @override
  Future<void> applyToParams(
      List<QueryParam> queryParams, Map<String, String> headerParams) async {
    headerParams['Authorization'] =
        'Bearer $token'; // Set the Authorization header
  }
}
