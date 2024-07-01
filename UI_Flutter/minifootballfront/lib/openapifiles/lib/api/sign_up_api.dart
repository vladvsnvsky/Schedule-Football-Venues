//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class SignUpApi {
  SignUpApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /api/SignUp/create-player-from-list' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [List<CreateUserEntityDTO>] createUserEntityDTO:
  Future<Response> apiSignUpCreatePlayerFromListPostWithHttpInfo({ List<CreateUserEntityDTO>? createUserEntityDTO, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/SignUp/create-player-from-list';

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
  /// * [List<CreateUserEntityDTO>] createUserEntityDTO:
  Future<List<CreateUserEntityDTO>?> apiSignUpCreatePlayerFromListPost({ List<CreateUserEntityDTO>? createUserEntityDTO, }) async {
    final response = await apiSignUpCreatePlayerFromListPostWithHttpInfo( createUserEntityDTO: createUserEntityDTO, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<CreateUserEntityDTO>') as List)
        .cast<CreateUserEntityDTO>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'POST /api/SignUp/create-player' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [CreateUserEntityDTO] createUserEntityDTO:
  Future<Response> apiSignUpCreatePlayerPostWithHttpInfo({ CreateUserEntityDTO? createUserEntityDTO, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/SignUp/create-player';

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
  Future<CreateUserEntityDTO?> apiSignUpCreatePlayerPost({ CreateUserEntityDTO? createUserEntityDTO, }) async {
    final response = await apiSignUpCreatePlayerPostWithHttpInfo( createUserEntityDTO: createUserEntityDTO, );
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
