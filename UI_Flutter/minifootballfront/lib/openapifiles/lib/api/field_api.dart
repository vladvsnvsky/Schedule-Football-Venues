//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class FieldApi {
  FieldApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'GET /api/Field/available-hours' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] day:
  ///
  /// * [int] month:
  ///
  /// * [int] year:
  ///
  /// * [int] fieldId:
  Future<Response> apiFieldAvailableHoursGetWithHttpInfo({ int? day, int? month, int? year, int? fieldId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Field/available-hours';

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
    if (fieldId != null) {
      queryParams.addAll(_queryParams('', 'fieldId', fieldId));
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
  /// * [int] day:
  ///
  /// * [int] month:
  ///
  /// * [int] year:
  ///
  /// * [int] fieldId:
  Future<List<TimeSpan>?> apiFieldAvailableHoursGet({ int? day, int? month, int? year, int? fieldId, }) async {
    final response = await apiFieldAvailableHoursGetWithHttpInfo( day: day, month: month, year: year, fieldId: fieldId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<TimeSpan>') as List)
        .cast<TimeSpan>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'POST /api/Field/create' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [CreateFieldDTO] createFieldDTO:
  Future<Response> apiFieldCreatePostWithHttpInfo({ CreateFieldDTO? createFieldDTO, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Field/create';

    // ignore: prefer_final_locals
    Object? postBody = createFieldDTO;

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
  /// * [CreateFieldDTO] createFieldDTO:
  Future<void> apiFieldCreatePost({ CreateFieldDTO? createFieldDTO, }) async {
    final response = await apiFieldCreatePostWithHttpInfo( createFieldDTO: createFieldDTO, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'DELETE /api/Field/delete/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiFieldDeleteIdDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Field/delete/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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
  /// * [int] id (required):
  Future<void> apiFieldDeleteIdDelete(int id,) async {
    final response = await apiFieldDeleteIdDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /api/Field/get-by-city/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiFieldGetByCityIdGetWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Field/get-by-city/{id}'
      .replaceAll('{id}', id.toString());

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

  /// Parameters:
  ///
  /// * [int] id (required):
  Future<List<FieldDTO>?> apiFieldGetByCityIdGet(int id,) async {
    final response = await apiFieldGetByCityIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<FieldDTO>') as List)
        .cast<FieldDTO>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'GET /api/Field/get-by-city-paginated' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] cityId:
  ///
  /// * [int] pageNumber:
  ///
  /// * [int] pageSize:
  Future<Response> apiFieldGetByCityPaginatedGetWithHttpInfo({ int? cityId, int? pageNumber, int? pageSize, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Field/get-by-city-paginated';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (cityId != null) {
      queryParams.addAll(_queryParams('', 'cityId', cityId));
    }
    if (pageNumber != null) {
      queryParams.addAll(_queryParams('', 'pageNumber', pageNumber));
    }
    if (pageSize != null) {
      queryParams.addAll(_queryParams('', 'pageSize', pageSize));
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
  ///
  /// * [int] pageNumber:
  ///
  /// * [int] pageSize:
  Future<VenueDetailsDTOPaginatedResponse?> apiFieldGetByCityPaginatedGet({ int? cityId, int? pageNumber, int? pageSize, }) async {
    final response = await apiFieldGetByCityPaginatedGetWithHttpInfo( cityId: cityId, pageNumber: pageNumber, pageSize: pageSize, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'VenueDetailsDTOPaginatedResponse',) as VenueDetailsDTOPaginatedResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/Field/get/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiFieldGetIdGetWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Field/get/{id}'
      .replaceAll('{id}', id.toString());

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

  /// Parameters:
  ///
  /// * [int] id (required):
  Future<FieldDTO?> apiFieldGetIdGet(int id,) async {
    final response = await apiFieldGetIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'FieldDTO',) as FieldDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'PUT /api/Field/set-active' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] fieldId:
  Future<Response> apiFieldSetActivePutWithHttpInfo({ int? fieldId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Field/set-active';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (fieldId != null) {
      queryParams.addAll(_queryParams('', 'fieldId', fieldId));
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
  /// * [int] fieldId:
  Future<FieldDTOUpdateRequestResponse?> apiFieldSetActivePut({ int? fieldId, }) async {
    final response = await apiFieldSetActivePutWithHttpInfo( fieldId: fieldId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'FieldDTOUpdateRequestResponse',) as FieldDTOUpdateRequestResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'PUT /api/Field/set-inactive' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] fieldId:
  Future<Response> apiFieldSetInactivePutWithHttpInfo({ int? fieldId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Field/set-inactive';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (fieldId != null) {
      queryParams.addAll(_queryParams('', 'fieldId', fieldId));
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
  /// * [int] fieldId:
  Future<FieldDTOUpdateRequestResponse?> apiFieldSetInactivePut({ int? fieldId, }) async {
    final response = await apiFieldSetInactivePutWithHttpInfo( fieldId: fieldId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'FieldDTOUpdateRequestResponse',) as FieldDTOUpdateRequestResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'PUT /api/Field/update-by-id' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id:
  ///
  /// * [VenueDetailsDTO] venueDetailsDTO:
  Future<Response> apiFieldUpdateByIdPutWithHttpInfo({ int? id, VenueDetailsDTO? venueDetailsDTO, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Field/update-by-id';

    // ignore: prefer_final_locals
    Object? postBody = venueDetailsDTO;

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
  /// * [VenueDetailsDTO] venueDetailsDTO:
  Future<FieldDTO?> apiFieldUpdateByIdPut({ int? id, VenueDetailsDTO? venueDetailsDTO, }) async {
    final response = await apiFieldUpdateByIdPutWithHttpInfo( id: id, venueDetailsDTO: venueDetailsDTO, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'FieldDTO',) as FieldDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/Field/venue-details-by-city-id' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id:
  Future<Response> apiFieldVenueDetailsByCityIdGetWithHttpInfo({ int? id, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Field/venue-details-by-city-id';

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
  Future<List<VenueDetailsDTO>?> apiFieldVenueDetailsByCityIdGet({ int? id, }) async {
    final response = await apiFieldVenueDetailsByCityIdGetWithHttpInfo( id: id, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<VenueDetailsDTO>') as List)
        .cast<VenueDetailsDTO>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'GET /api/Field/venue-details-byid' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id:
  Future<Response> apiFieldVenueDetailsByidGetWithHttpInfo({ int? id, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Field/venue-details-byid';

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
  Future<VenueDetailsDTO?> apiFieldVenueDetailsByidGet({ int? id, }) async {
    final response = await apiFieldVenueDetailsByidGetWithHttpInfo( id: id, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'VenueDetailsDTO',) as VenueDetailsDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/Field/venue-details' operation and returns the [Response].
  Future<Response> apiFieldVenueDetailsGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/Field/venue-details';

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

  Future<List<VenueDetailsDTO>?> apiFieldVenueDetailsGet() async {
    final response = await apiFieldVenueDetailsGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<VenueDetailsDTO>') as List)
        .cast<VenueDetailsDTO>()
        .toList(growable: false);

    }
    return null;
  }
}
