//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class UserApi {
  UserApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'GET /api/User/address-by-jwt' operation and returns the [Response].
  Future<Response> apiUserAddressByJwtGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/User/address-by-jwt';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  Future<AddressDTO?> apiUserAddressByJwtGet() async {
    final response = await apiUserAddressByJwtGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AddressDTO',) as AddressDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/User/admins' operation and returns the [Response].
  Future<Response> apiUserAdminsGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/User/admins';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  Future<List<UserEntityDTO>?> apiUserAdminsGet() async {
    final response = await apiUserAdminsGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<UserEntityDTO>') as List)
        .cast<UserEntityDTO>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'GET /api/User/all' operation and returns the [Response].
  Future<Response> apiUserAllGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/User/all';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  Future<List<UserEntityDTO>?> apiUserAllGet() async {
    final response = await apiUserAllGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<UserEntityDTO>') as List)
        .cast<UserEntityDTO>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'PUT /api/User/ban-player' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id:
  Future<Response> apiUserBanPlayerPutWithHttpInfo({ int? id, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/User/ban-player';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (id != null) {
      queryParams.addAll(_queryParams('', 'id', id));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id:
  Future<void> apiUserBanPlayerPut({ int? id, }) async {
    final response = await apiUserBanPlayerPutWithHttpInfo( id: id, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /api/User/banned-users' operation and returns the [Response].
  Future<Response> apiUserBannedUsersGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/User/banned-users';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  Future<List<UserEntityDTO>?> apiUserBannedUsersGet() async {
    final response = await apiUserBannedUsersGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<UserEntityDTO>') as List)
        .cast<UserEntityDTO>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'GET /api/User/by-city-id' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] cityId:
  Future<Response> apiUserByCityIdGetWithHttpInfo({ int? cityId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/User/by-city-id';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (cityId != null) {
      queryParams.addAll(_queryParams('', 'cityId', cityId));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] cityId:
  Future<List<UserEntityDTO>?> apiUserByCityIdGet({ int? cityId, }) async {
    final response = await apiUserByCityIdGetWithHttpInfo( cityId: cityId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<UserEntityDTO>') as List)
        .cast<UserEntityDTO>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'GET /api/User/by-details-id' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id:
  Future<Response> apiUserByDetailsIdGetWithHttpInfo({ int? id, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/User/by-details-id';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (id != null) {
      queryParams.addAll(_queryParams('', 'id', id));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id:
  Future<UserDetailsDTO?> apiUserByDetailsIdGet({ int? id, }) async {
    final response = await apiUserByDetailsIdGetWithHttpInfo( id: id, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserDetailsDTO',) as UserDetailsDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/User/by-email' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] email:
  Future<Response> apiUserByEmailGetWithHttpInfo({ String? email, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/User/by-email';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (email != null) {
      queryParams.addAll(_queryParams('', 'email', email));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] email:
  Future<UserEntityDTO?> apiUserByEmailGet({ String? email, }) async {
    final response = await apiUserByEmailGetWithHttpInfo( email: email, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserEntityDTO',) as UserEntityDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/User/by-jwt' operation and returns the [Response].
  Future<Response> apiUserByJwtGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/User/by-jwt';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  Future<UserEntityDTO?> apiUserByJwtGet() async {
    final response = await apiUserByJwtGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserEntityDTO',) as UserEntityDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/User/by-match' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] matchId:
  Future<Response> apiUserByMatchGetWithHttpInfo({ int? matchId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/User/by-match';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (matchId != null) {
      queryParams.addAll(_queryParams('', 'matchId', matchId));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] matchId:
  Future<List<UserEntityDTO>?> apiUserByMatchGet({ int? matchId, }) async {
    final response = await apiUserByMatchGetWithHttpInfo( matchId: matchId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<UserEntityDTO>') as List)
        .cast<UserEntityDTO>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'GET /api/User/by-username' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] username:
  Future<Response> apiUserByUsernameGetWithHttpInfo({ String? username, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/User/by-username';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (username != null) {
      queryParams.addAll(_queryParams('', 'username', username));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] username:
  Future<UserEntityDTO?> apiUserByUsernameGet({ String? username, }) async {
    final response = await apiUserByUsernameGetWithHttpInfo( username: username, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserEntityDTO',) as UserEntityDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /api/User/delete-user' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id:
  Future<Response> apiUserDeleteUserDeleteWithHttpInfo({ int? id, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/User/delete-user';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (id != null) {
      queryParams.addAll(_queryParams('', 'id', id));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id:
  Future<void> apiUserDeleteUserDelete({ int? id, }) async {
    final response = await apiUserDeleteUserDeleteWithHttpInfo( id: id, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /api/User/details-by-jwt' operation and returns the [Response].
  Future<Response> apiUserDetailsByJwtGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/User/details-by-jwt';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  Future<UserDetailsDTO?> apiUserDetailsByJwtGet() async {
    final response = await apiUserDetailsByJwtGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserDetailsDTO',) as UserDetailsDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'PUT /api/User/remove-admin' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id:
  Future<Response> apiUserRemoveAdminPutWithHttpInfo({ int? id, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/User/remove-admin';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (id != null) {
      queryParams.addAll(_queryParams('', 'id', id));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id:
  Future<void> apiUserRemoveAdminPut({ int? id, }) async {
    final response = await apiUserRemoveAdminPutWithHttpInfo( id: id, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /api/User/search' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] currentPage:
  ///
  /// * [int] pageSize:
  ///
  /// * [String] str:
  Future<Response> apiUserSearchGetWithHttpInfo({ int? currentPage, int? pageSize, String? str, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/User/search';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (currentPage != null) {
      queryParams.addAll(_queryParams('', 'currentPage', currentPage));
    }
    if (pageSize != null) {
      queryParams.addAll(_queryParams('', 'pageSize', pageSize));
    }
    if (str != null) {
      queryParams.addAll(_queryParams('', 'str', str));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] currentPage:
  ///
  /// * [int] pageSize:
  ///
  /// * [String] str:
  Future<UserEntityDTOPaginatedResponse?> apiUserSearchGet({ int? currentPage, int? pageSize, String? str, }) async {
    final response = await apiUserSearchGetWithHttpInfo( currentPage: currentPage, pageSize: pageSize, str: str, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserEntityDTOPaginatedResponse',) as UserEntityDTOPaginatedResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'PUT /api/User/set-admin' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id:
  Future<Response> apiUserSetAdminPutWithHttpInfo({ int? id, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/User/set-admin';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (id != null) {
      queryParams.addAll(_queryParams('', 'id', id));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id:
  Future<void> apiUserSetAdminPut({ int? id, }) async {
    final response = await apiUserSetAdminPutWithHttpInfo( id: id, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /api/User/unban-player' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id:
  Future<Response> apiUserUnbanPlayerPutWithHttpInfo({ int? id, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/User/unban-player';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (id != null) {
      queryParams.addAll(_queryParams('', 'id', id));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id:
  Future<void> apiUserUnbanPlayerPut({ int? id, }) async {
    final response = await apiUserUnbanPlayerPutWithHttpInfo( id: id, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /api/User/update-address' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] cityId:
  ///
  /// * [String] streetAndNo:
  Future<Response> apiUserUpdateAddressPutWithHttpInfo({ int? cityId, String? streetAndNo, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/User/update-address';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (cityId != null) {
      queryParams.addAll(_queryParams('', 'cityId', cityId));
    }
    if (streetAndNo != null) {
      queryParams.addAll(_queryParams('', 'streetAndNo', streetAndNo));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] cityId:
  ///
  /// * [String] streetAndNo:
  Future<UserEntityDTOUpdateRequestResponse?> apiUserUpdateAddressPut({ int? cityId, String? streetAndNo, }) async {
    final response = await apiUserUpdateAddressPutWithHttpInfo( cityId: cityId, streetAndNo: streetAndNo, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserEntityDTOUpdateRequestResponse',) as UserEntityDTOUpdateRequestResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'PUT /api/User/update-birthdate' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] day:
  ///
  /// * [int] month:
  ///
  /// * [int] year:
  Future<Response> apiUserUpdateBirthdatePutWithHttpInfo({ int? day, int? month, int? year, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/User/update-birthdate';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (day != null) {
      queryParams.addAll(_queryParams('', 'day', day));
    }
    if (month != null) {
      queryParams.addAll(_queryParams('', 'month', month));
    }
    if (year != null) {
      queryParams.addAll(_queryParams('', 'year', year));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] day:
  ///
  /// * [int] month:
  ///
  /// * [int] year:
  Future<UserEntityDTOUpdateRequestResponse?> apiUserUpdateBirthdatePut({ int? day, int? month, int? year, }) async {
    final response = await apiUserUpdateBirthdatePutWithHttpInfo( day: day, month: month, year: year, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserEntityDTOUpdateRequestResponse',) as UserEntityDTOUpdateRequestResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'PUT /api/User/update-email' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] email:
  Future<Response> apiUserUpdateEmailPutWithHttpInfo({ String? email, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/User/update-email';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (email != null) {
      queryParams.addAll(_queryParams('', 'email', email));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] email:
  Future<UserEntityDTOUpdateRequestResponse?> apiUserUpdateEmailPut({ String? email, }) async {
    final response = await apiUserUpdateEmailPutWithHttpInfo( email: email, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserEntityDTOUpdateRequestResponse',) as UserEntityDTOUpdateRequestResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'PUT /api/User/update-password' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] password:
  Future<Response> apiUserUpdatePasswordPutWithHttpInfo({ String? password, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/User/update-password';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (password != null) {
      queryParams.addAll(_queryParams('', 'password', password));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] password:
  Future<UserEntityDTOUpdateRequestResponse?> apiUserUpdatePasswordPut({ String? password, }) async {
    final response = await apiUserUpdatePasswordPutWithHttpInfo( password: password, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserEntityDTOUpdateRequestResponse',) as UserEntityDTOUpdateRequestResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'PUT /api/User/update-phone-number' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] phoneNumber:
  Future<Response> apiUserUpdatePhoneNumberPutWithHttpInfo({ String? phoneNumber, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/User/update-phone-number';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (phoneNumber != null) {
      queryParams.addAll(_queryParams('', 'phoneNumber', phoneNumber));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] phoneNumber:
  Future<UserEntityDTOUpdateRequestResponse?> apiUserUpdatePhoneNumberPut({ String? phoneNumber, }) async {
    final response = await apiUserUpdatePhoneNumberPutWithHttpInfo( phoneNumber: phoneNumber, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserEntityDTOUpdateRequestResponse',) as UserEntityDTOUpdateRequestResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'PUT /api/User/update-user' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id:
  ///
  /// * [UpdateUserEntityDTO] updateUserEntityDTO:
  Future<Response> apiUserUpdateUserPutWithHttpInfo({ int? id, UpdateUserEntityDTO? updateUserEntityDTO, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/User/update-user';

    // ignore: prefer_final_locals
    Object? postBody = updateUserEntityDTO;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (id != null) {
      queryParams.addAll(_queryParams('', 'id', id));
    }

    const contentTypes = <String>['application/json', 'text/json', 'application/*+json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id:
  ///
  /// * [UpdateUserEntityDTO] updateUserEntityDTO:
  Future<void> apiUserUpdateUserPut({ int? id, UpdateUserEntityDTO? updateUserEntityDTO, }) async {
    final response = await apiUserUpdateUserPutWithHttpInfo( id: id, updateUserEntityDTO: updateUserEntityDTO, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /api/User/update-username' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] username:
  Future<Response> apiUserUpdateUsernamePutWithHttpInfo({ String? username, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/User/update-username';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (username != null) {
      queryParams.addAll(_queryParams('', 'username', username));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] username:
  Future<UserEntityDTOUpdateRequestResponse?> apiUserUpdateUsernamePut({ String? username, }) async {
    final response = await apiUserUpdateUsernamePutWithHttpInfo( username: username, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserEntityDTOUpdateRequestResponse',) as UserEntityDTOUpdateRequestResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/User/user-by-id' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id:
  Future<Response> apiUserUserByIdGetWithHttpInfo({ int? id, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/User/user-by-id';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (id != null) {
      queryParams.addAll(_queryParams('', 'id', id));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id:
  Future<UserEntityDTO?> apiUserUserByIdGet({ int? id, }) async {
    final response = await apiUserUserByIdGetWithHttpInfo( id: id, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserEntityDTO',) as UserEntityDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/User/users-paginated' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] currentPage:
  ///
  /// * [int] pageSize:
  ///
  /// * [int] id:
  ///
  /// * [int] countryId:
  ///
  /// * [int] cityId:
  ///
  /// * [bool] isBanned:
  ///
  /// * [String] name:
  ///
  /// * [String] email:
  ///
  /// * [int] dayOfBirth:
  ///
  /// * [int] monthOfBirth:
  ///
  /// * [int] yearOfBirth:
  ///
  /// * [bool] isAdmin:
  ///
  /// * [bool] orderByAgeAsc:
  ///
  /// * [bool] orderByCreationDateAsc:
  Future<Response> apiUserUsersPaginatedGetWithHttpInfo({ int? currentPage, int? pageSize, int? id, int? countryId, int? cityId, bool? isBanned, String? name, String? email, int? dayOfBirth, int? monthOfBirth, int? yearOfBirth, bool? isAdmin, bool? orderByAgeAsc, bool? orderByCreationDateAsc, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/User/users-paginated';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (currentPage != null) {
      queryParams.addAll(_queryParams('', 'currentPage', currentPage));
    }
    if (pageSize != null) {
      queryParams.addAll(_queryParams('', 'pageSize', pageSize));
    }
    if (id != null) {
      queryParams.addAll(_queryParams('', 'Id', id));
    }
    if (countryId != null) {
      queryParams.addAll(_queryParams('', 'CountryId', countryId));
    }
    if (cityId != null) {
      queryParams.addAll(_queryParams('', 'CityId', cityId));
    }
    if (isBanned != null) {
      queryParams.addAll(_queryParams('', 'IsBanned', isBanned));
    }
    if (name != null) {
      queryParams.addAll(_queryParams('', 'Name', name));
    }
    if (email != null) {
      queryParams.addAll(_queryParams('', 'Email', email));
    }
    if (dayOfBirth != null) {
      queryParams.addAll(_queryParams('', 'DayOfBirth', dayOfBirth));
    }
    if (monthOfBirth != null) {
      queryParams.addAll(_queryParams('', 'MonthOfBirth', monthOfBirth));
    }
    if (yearOfBirth != null) {
      queryParams.addAll(_queryParams('', 'YearOfBirth', yearOfBirth));
    }
    if (isAdmin != null) {
      queryParams.addAll(_queryParams('', 'IsAdmin', isAdmin));
    }
    if (orderByAgeAsc != null) {
      queryParams.addAll(_queryParams('', 'OrderByAgeAsc', orderByAgeAsc));
    }
    if (orderByCreationDateAsc != null) {
      queryParams.addAll(_queryParams('', 'OrderByCreationDateAsc', orderByCreationDateAsc));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] currentPage:
  ///
  /// * [int] pageSize:
  ///
  /// * [int] id:
  ///
  /// * [int] countryId:
  ///
  /// * [int] cityId:
  ///
  /// * [bool] isBanned:
  ///
  /// * [String] name:
  ///
  /// * [String] email:
  ///
  /// * [int] dayOfBirth:
  ///
  /// * [int] monthOfBirth:
  ///
  /// * [int] yearOfBirth:
  ///
  /// * [bool] isAdmin:
  ///
  /// * [bool] orderByAgeAsc:
  ///
  /// * [bool] orderByCreationDateAsc:
  Future<UserEntityDTOPaginatedResponse?> apiUserUsersPaginatedGet({ int? currentPage, int? pageSize, int? id, int? countryId, int? cityId, bool? isBanned, String? name, String? email, int? dayOfBirth, int? monthOfBirth, int? yearOfBirth, bool? isAdmin, bool? orderByAgeAsc, bool? orderByCreationDateAsc, }) async {
    final response = await apiUserUsersPaginatedGetWithHttpInfo( currentPage: currentPage, pageSize: pageSize, id: id, countryId: countryId, cityId: cityId, isBanned: isBanned, name: name, email: email, dayOfBirth: dayOfBirth, monthOfBirth: monthOfBirth, yearOfBirth: yearOfBirth, isAdmin: isAdmin, orderByAgeAsc: orderByAgeAsc, orderByCreationDateAsc: orderByCreationDateAsc, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserEntityDTOPaginatedResponse',) as UserEntityDTOPaginatedResponse;
    
    }
    return null;
  }
}
