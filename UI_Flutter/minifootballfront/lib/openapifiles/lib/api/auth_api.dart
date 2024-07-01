//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AuthApi {
  AuthApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /api/Auth/admin-sign-in' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [UserSignIn] userSignIn:
  Future<Response> apiAuthAdminSignInPostWithHttpInfo({ UserSignIn? userSignIn, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Auth/admin-sign-in';

    // ignore: prefer_final_locals
    Object? postBody = userSignIn;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'text/json', 'application/*+json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [UserSignIn] userSignIn:
  Future<String?> apiAuthAdminSignInPost({ UserSignIn? userSignIn, }) async {
    final response = await apiAuthAdminSignInPostWithHttpInfo( userSignIn: userSignIn, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'String',) as String;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/Auth/check-by-email' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [EmailRequestDio] emailRequestDio:
  Future<Response> apiAuthCheckByEmailPostWithHttpInfo({ EmailRequestDio? emailRequestDio, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Auth/check-by-email';

    // ignore: prefer_final_locals
    Object? postBody = emailRequestDio;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'text/json', 'application/*+json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [EmailRequestDio] emailRequestDio:
  Future<bool?> apiAuthCheckByEmailPost({ EmailRequestDio? emailRequestDio, }) async {
    final response = await apiAuthCheckByEmailPostWithHttpInfo( emailRequestDio: emailRequestDio, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'bool',) as bool;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/Auth/create-field-manager' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] body:
  Future<Response> apiAuthCreateFieldManagerPostWithHttpInfo({ int? body, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Auth/create-field-manager';

    // ignore: prefer_final_locals
    Object? postBody = body;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'text/json', 'application/*+json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] body:
  Future<void> apiAuthCreateFieldManagerPost({ int? body, }) async {
    final response = await apiAuthCreateFieldManagerPostWithHttpInfo( body: body, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /api/Auth/set-admin' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] body:
  Future<Response> apiAuthSetAdminPostWithHttpInfo({ int? body, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Auth/set-admin';

    // ignore: prefer_final_locals
    Object? postBody = body;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'text/json', 'application/*+json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] body:
  Future<void> apiAuthSetAdminPost({ int? body, }) async {
    final response = await apiAuthSetAdminPostWithHttpInfo( body: body, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /api/Auth/sign-in' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [UserSignIn] userSignIn:
  Future<Response> apiAuthSignInPostWithHttpInfo({ UserSignIn? userSignIn, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Auth/sign-in';

    // ignore: prefer_final_locals
    Object? postBody = userSignIn;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'text/json', 'application/*+json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [UserSignIn] userSignIn:
  Future<String?> apiAuthSignInPost({ UserSignIn? userSignIn, }) async {
    final response = await apiAuthSignInPostWithHttpInfo( userSignIn: userSignIn, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'String',) as String;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/Auth/sign-up' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [CreateUserEntityDTO] createUserEntityDTO:
  Future<Response> apiAuthSignUpPostWithHttpInfo({ CreateUserEntityDTO? createUserEntityDTO, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Auth/sign-up';

    // ignore: prefer_final_locals
    Object? postBody = createUserEntityDTO;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'text/json', 'application/*+json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [CreateUserEntityDTO] createUserEntityDTO:
  Future<CreateUserEntityDTO?> apiAuthSignUpPost({ CreateUserEntityDTO? createUserEntityDTO, }) async {
    final response = await apiAuthSignUpPostWithHttpInfo( createUserEntityDTO: createUserEntityDTO, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateUserEntityDTO',) as CreateUserEntityDTO;
    
    }
    return null;
  }
}
