//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class CityApi {
  CityApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /api/City/create' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [CreateCityDTO] createCityDTO:
  Future<Response> apiCityCreatePostWithHttpInfo({ CreateCityDTO? createCityDTO, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/City/create';

    // ignore: prefer_final_locals
    Object? postBody = createCityDTO;

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
  /// * [CreateCityDTO] createCityDTO:
  Future<CityDTO?> apiCityCreatePost({ CreateCityDTO? createCityDTO, }) async {
    final response = await apiCityCreatePostWithHttpInfo( createCityDTO: createCityDTO, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CityDTO',) as CityDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /api/City/delete' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id:
  Future<Response> apiCityDeleteDeleteWithHttpInfo({ int? id, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/City/delete';

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
  Future<void> apiCityDeleteDelete({ int? id, }) async {
    final response = await apiCityDeleteDeleteWithHttpInfo( id: id, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /api/City' operation and returns the [Response].
  Future<Response> apiCityGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/City';

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

  Future<List<CityDTO>?> apiCityGet() async {
    final response = await apiCityGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<CityDTO>') as List)
        .cast<CityDTO>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'GET /api/City/get-by-id' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id:
  Future<Response> apiCityGetByIdGetWithHttpInfo({ int? id, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/City/get-by-id';

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
  Future<CityDTO?> apiCityGetByIdGet({ int? id, }) async {
    final response = await apiCityGetByIdGetWithHttpInfo( id: id, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CityDTO',) as CityDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'PUT /api/City/update' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id:
  ///
  /// * [CreateCityDTO] createCityDTO:
  Future<Response> apiCityUpdatePutWithHttpInfo({ int? id, CreateCityDTO? createCityDTO, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/City/update';

    // ignore: prefer_final_locals
    Object? postBody = createCityDTO;

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
  /// * [CreateCityDTO] createCityDTO:
  Future<CityDTO?> apiCityUpdatePut({ int? id, CreateCityDTO? createCityDTO, }) async {
    final response = await apiCityUpdatePutWithHttpInfo( id: id, createCityDTO: createCityDTO, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CityDTO',) as CityDTO;
    
    }
    return null;
  }
}
