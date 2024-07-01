import 'package:flutter/foundation.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';

class SignUpService {
  final SignUpApi _signUpApi;

  SignUpService({SignUpApi? signUpApi}) : _signUpApi = signUpApi ?? SignUpApi();

  Future<CreateUserEntityDTO?> createUser(
      CreateUserEntityDTO userEntityDTO) async {
    try {
      final response = await _signUpApi.apiSignUpCreatePlayerPost(
          createUserEntityDTO: userEntityDTO);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Exception when calling SignUpApi -> createPlayer: $e');
      }
      rethrow;
    }
  }
}
