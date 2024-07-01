import 'package:http/http.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:minifootballfront/service/tokenservice.dart';

class AuthService {
  final SignUpApi _signUpApi = SignUpApi();
  final AuthApi _authApi = AuthApi();
  Future<void> signUp(CreateUserEntityDTO signUpRequest) async {
    try {
      await _signUpApi.apiSignUpCreatePlayerPost(
          createUserEntityDTO: signUpRequest);
    } catch (e) {
      print('Exception when calling SignUpApi->apiSignUpCreatePlayerPost: $e');
      rethrow;
    }
  }

  Future<String> signIn(UserSignIn userSignInRequest) async {
    try {
      String? token =
          await _authApi.apiAuthSignInPost(userSignIn: userSignInRequest);
      if (token == null)
        throw Exception(
            "Sign In failed! Check credentials or create an account!");
      await TokenService().storeToken(token);
      return 'Success';
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> signOut() async {
    TokenService().deleteToken();
  }
}
