//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class MatchApi {
  MatchApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'GET /Match/active-by-city' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] cityId:
  Future<Response> matchActiveByCityGetWithHttpInfo({ int? cityId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Match/active-by-city';

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
  Future<List<GameDetailsDTO>?> matchActiveByCityGet({ int? cityId, }) async {
    final response = await matchActiveByCityGetWithHttpInfo( cityId: cityId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<GameDetailsDTO>') as List)
        .cast<GameDetailsDTO>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'GET /Match/active-by-city-paginated' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] cityId:
  ///
  /// * [int] pageNumber:
  ///
  /// * [int] pageSize:
  Future<Response> matchActiveByCityPaginatedGetWithHttpInfo({ int? cityId, int? pageNumber, int? pageSize, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Match/active-by-city-paginated';

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
  Future<GameDetailsDTOPaginatedResponse?> matchActiveByCityPaginatedGet({ int? cityId, int? pageNumber, int? pageSize, }) async {
    final response = await matchActiveByCityPaginatedGetWithHttpInfo( cityId: cityId, pageNumber: pageNumber, pageSize: pageSize, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GameDetailsDTOPaginatedResponse',) as GameDetailsDTOPaginatedResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /Match/active-by-field' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] fieldId:
  Future<Response> matchActiveByFieldGetWithHttpInfo({ int? fieldId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Match/active-by-field';

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
  /// * [int] fieldId:
  Future<List<GameDetailsDTO>?> matchActiveByFieldGet({ int? fieldId, }) async {
    final response = await matchActiveByFieldGetWithHttpInfo( fieldId: fieldId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<GameDetailsDTO>') as List)
        .cast<GameDetailsDTO>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'GET /Match/active-by-player' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] pageNumber:
  ///
  /// * [int] pageSize:
  Future<Response> matchActiveByPlayerGetWithHttpInfo({ int? pageNumber, int? pageSize, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Match/active-by-player';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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
  /// * [int] pageNumber:
  ///
  /// * [int] pageSize:
  Future<GameDetailsDTOPaginatedResponse?> matchActiveByPlayerGet({ int? pageNumber, int? pageSize, }) async {
    final response = await matchActiveByPlayerGetWithHttpInfo( pageNumber: pageNumber, pageSize: pageSize, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GameDetailsDTOPaginatedResponse',) as GameDetailsDTOPaginatedResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /Match/active' operation and returns the [Response].
  Future<Response> matchActiveGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/Match/active';

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

  Future<List<GameDetailsDTO>?> matchActiveGet() async {
    final response = await matchActiveGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<GameDetailsDTO>') as List)
        .cast<GameDetailsDTO>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'GET /Match/by-filters' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] organizerId:
  ///
  /// * [int] fieldId:
  ///
  /// * [int] countryId:
  ///
  /// * [int] cityId:
  ///
  /// * [DateTime] startDateFrom:
  ///
  /// * [DateTime] startDateTo:
  ///
  /// * [DateTime] endDateFrom:
  ///
  /// * [DateTime] endDateTo:
  ///
  /// * [int] minPlayersRequired:
  ///
  /// * [int] maxPlayersRequired:
  ///
  /// * [bool] playerCanJoin:
  ///
  /// * [bool] finished:
  ///
  /// * [bool] cancelled:
  ///
  /// * [int] minSpotsAvailable:
  ///
  /// * [int] maxSpotsAvailable:
  ///
  /// * [int] pageNumber:
  ///
  /// * [int] pageSize:
  Future<Response> matchByFiltersGetWithHttpInfo({ int? organizerId, int? fieldId, int? countryId, int? cityId, DateTime? startDateFrom, DateTime? startDateTo, DateTime? endDateFrom, DateTime? endDateTo, int? minPlayersRequired, int? maxPlayersRequired, bool? playerCanJoin, bool? finished, bool? cancelled, int? minSpotsAvailable, int? maxSpotsAvailable, int? pageNumber, int? pageSize, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Match/by-filters';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (organizerId != null) {
      queryParams.addAll(_queryParams('', 'OrganizerId', organizerId));
    }
    if (fieldId != null) {
      queryParams.addAll(_queryParams('', 'FieldId', fieldId));
    }
    if (countryId != null) {
      queryParams.addAll(_queryParams('', 'CountryId', countryId));
    }
    if (cityId != null) {
      queryParams.addAll(_queryParams('', 'CityId', cityId));
    }
    if (startDateFrom != null) {
      queryParams.addAll(_queryParams('', 'StartDateFrom', startDateFrom));
    }
    if (startDateTo != null) {
      queryParams.addAll(_queryParams('', 'StartDateTo', startDateTo));
    }
    if (endDateFrom != null) {
      queryParams.addAll(_queryParams('', 'EndDateFrom', endDateFrom));
    }
    if (endDateTo != null) {
      queryParams.addAll(_queryParams('', 'EndDateTo', endDateTo));
    }
    if (minPlayersRequired != null) {
      queryParams.addAll(_queryParams('', 'MinPlayersRequired', minPlayersRequired));
    }
    if (maxPlayersRequired != null) {
      queryParams.addAll(_queryParams('', 'MaxPlayersRequired', maxPlayersRequired));
    }
    if (playerCanJoin != null) {
      queryParams.addAll(_queryParams('', 'PlayerCanJoin', playerCanJoin));
    }
    if (finished != null) {
      queryParams.addAll(_queryParams('', 'Finished', finished));
    }
    if (cancelled != null) {
      queryParams.addAll(_queryParams('', 'Cancelled', cancelled));
    }
    if (minSpotsAvailable != null) {
      queryParams.addAll(_queryParams('', 'MinSpotsAvailable', minSpotsAvailable));
    }
    if (maxSpotsAvailable != null) {
      queryParams.addAll(_queryParams('', 'MaxSpotsAvailable', maxSpotsAvailable));
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
  /// * [int] organizerId:
  ///
  /// * [int] fieldId:
  ///
  /// * [int] countryId:
  ///
  /// * [int] cityId:
  ///
  /// * [DateTime] startDateFrom:
  ///
  /// * [DateTime] startDateTo:
  ///
  /// * [DateTime] endDateFrom:
  ///
  /// * [DateTime] endDateTo:
  ///
  /// * [int] minPlayersRequired:
  ///
  /// * [int] maxPlayersRequired:
  ///
  /// * [bool] playerCanJoin:
  ///
  /// * [bool] finished:
  ///
  /// * [bool] cancelled:
  ///
  /// * [int] minSpotsAvailable:
  ///
  /// * [int] maxSpotsAvailable:
  ///
  /// * [int] pageNumber:
  ///
  /// * [int] pageSize:
  Future<GameDetailsDTOPaginatedResponse?> matchByFiltersGet({ int? organizerId, int? fieldId, int? countryId, int? cityId, DateTime? startDateFrom, DateTime? startDateTo, DateTime? endDateFrom, DateTime? endDateTo, int? minPlayersRequired, int? maxPlayersRequired, bool? playerCanJoin, bool? finished, bool? cancelled, int? minSpotsAvailable, int? maxSpotsAvailable, int? pageNumber, int? pageSize, }) async {
    final response = await matchByFiltersGetWithHttpInfo( organizerId: organizerId, fieldId: fieldId, countryId: countryId, cityId: cityId, startDateFrom: startDateFrom, startDateTo: startDateTo, endDateFrom: endDateFrom, endDateTo: endDateTo, minPlayersRequired: minPlayersRequired, maxPlayersRequired: maxPlayersRequired, playerCanJoin: playerCanJoin, finished: finished, cancelled: cancelled, minSpotsAvailable: minSpotsAvailable, maxSpotsAvailable: maxSpotsAvailable, pageNumber: pageNumber, pageSize: pageSize, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GameDetailsDTOPaginatedResponse',) as GameDetailsDTOPaginatedResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /Match/by-id' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id:
  Future<Response> matchByIdGetWithHttpInfo({ int? id, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Match/by-id';

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
  Future<MatchDTO?> matchByIdGet({ int? id, }) async {
    final response = await matchByIdGetWithHttpInfo( id: id, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MatchDTO',) as MatchDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /Match/by-player' operation and returns the [Response].
  Future<Response> matchByPlayerGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/Match/by-player';

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

  Future<List<GameDetailsDTO>?> matchByPlayerGet() async {
    final response = await matchByPlayerGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<GameDetailsDTO>') as List)
        .cast<GameDetailsDTO>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'PUT /Match/cancel' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] matchId:
  ///
  /// * [String] cancelationReason:
  Future<Response> matchCancelPutWithHttpInfo({ int? matchId, String? cancelationReason, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Match/cancel';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (matchId != null) {
      queryParams.addAll(_queryParams('', 'matchId', matchId));
    }
    if (cancelationReason != null) {
      queryParams.addAll(_queryParams('', 'cancelationReason', cancelationReason));
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
  /// * [int] matchId:
  ///
  /// * [String] cancelationReason:
  Future<void> matchCancelPut({ int? matchId, String? cancelationReason, }) async {
    final response = await matchCancelPutWithHttpInfo( matchId: matchId, cancelationReason: cancelationReason, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /Match' operation and returns the [Response].
  Future<Response> matchGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/Match';

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

  Future<MatchDTO?> matchGet() async {
    final response = await matchGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MatchDTO',) as MatchDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /Match/get-all-active-by-game-type-paginator' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] pageNumber:
  ///
  /// * [int] pageSize:
  ///
  /// * [int] nrOfPlayers:
  Future<Response> matchGetAllActiveByGameTypePaginatorGetWithHttpInfo({ int? pageNumber, int? pageSize, int? nrOfPlayers, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Match/get-all-active-by-game-type-paginator';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (pageNumber != null) {
      queryParams.addAll(_queryParams('', 'pageNumber', pageNumber));
    }
    if (pageSize != null) {
      queryParams.addAll(_queryParams('', 'pageSize', pageSize));
    }
    if (nrOfPlayers != null) {
      queryParams.addAll(_queryParams('', 'nrOfPlayers', nrOfPlayers));
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
  /// * [int] pageNumber:
  ///
  /// * [int] pageSize:
  ///
  /// * [int] nrOfPlayers:
  Future<GameDetailsDTOPaginatedResponse?> matchGetAllActiveByGameTypePaginatorGet({ int? pageNumber, int? pageSize, int? nrOfPlayers, }) async {
    final response = await matchGetAllActiveByGameTypePaginatorGetWithHttpInfo( pageNumber: pageNumber, pageSize: pageSize, nrOfPlayers: nrOfPlayers, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GameDetailsDTOPaginatedResponse',) as GameDetailsDTOPaginatedResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /Match/get-all-active-by-start-time-paginator' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] pageNumber:
  ///
  /// * [int] pageSize:
  Future<Response> matchGetAllActiveByStartTimePaginatorGetWithHttpInfo({ int? pageNumber, int? pageSize, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Match/get-all-active-by-start-time-paginator';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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
  /// * [int] pageNumber:
  ///
  /// * [int] pageSize:
  Future<GameDetailsDTOPaginatedResponse?> matchGetAllActiveByStartTimePaginatorGet({ int? pageNumber, int? pageSize, }) async {
    final response = await matchGetAllActiveByStartTimePaginatorGetWithHttpInfo( pageNumber: pageNumber, pageSize: pageSize, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GameDetailsDTOPaginatedResponse',) as GameDetailsDTOPaginatedResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /Match/get-all-by-game-type-paginator' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] pageNumber:
  ///
  /// * [int] pageSize:
  ///
  /// * [int] nrOfPlayers:
  Future<Response> matchGetAllByGameTypePaginatorGetWithHttpInfo({ int? pageNumber, int? pageSize, int? nrOfPlayers, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Match/get-all-by-game-type-paginator';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (pageNumber != null) {
      queryParams.addAll(_queryParams('', 'pageNumber', pageNumber));
    }
    if (pageSize != null) {
      queryParams.addAll(_queryParams('', 'pageSize', pageSize));
    }
    if (nrOfPlayers != null) {
      queryParams.addAll(_queryParams('', 'nrOfPlayers', nrOfPlayers));
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
  /// * [int] pageNumber:
  ///
  /// * [int] pageSize:
  ///
  /// * [int] nrOfPlayers:
  Future<GameDetailsDTOPaginatedResponse?> matchGetAllByGameTypePaginatorGet({ int? pageNumber, int? pageSize, int? nrOfPlayers, }) async {
    final response = await matchGetAllByGameTypePaginatorGetWithHttpInfo( pageNumber: pageNumber, pageSize: pageSize, nrOfPlayers: nrOfPlayers, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GameDetailsDTOPaginatedResponse',) as GameDetailsDTOPaginatedResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /Match/get-all-by-start-time-paginator' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] pageNumber:
  ///
  /// * [int] pageSize:
  Future<Response> matchGetAllByStartTimePaginatorGetWithHttpInfo({ int? pageNumber, int? pageSize, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Match/get-all-by-start-time-paginator';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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
  /// * [int] pageNumber:
  ///
  /// * [int] pageSize:
  Future<GameDetailsDTOPaginatedResponse?> matchGetAllByStartTimePaginatorGet({ int? pageNumber, int? pageSize, }) async {
    final response = await matchGetAllByStartTimePaginatorGetWithHttpInfo( pageNumber: pageNumber, pageSize: pageSize, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GameDetailsDTOPaginatedResponse',) as GameDetailsDTOPaginatedResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /Match/get-all-joinable-by-game-type-paginator' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] pageNumber:
  ///
  /// * [int] pageSize:
  ///
  /// * [int] nrOfPlayers:
  Future<Response> matchGetAllJoinableByGameTypePaginatorGetWithHttpInfo({ int? pageNumber, int? pageSize, int? nrOfPlayers, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Match/get-all-joinable-by-game-type-paginator';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (pageNumber != null) {
      queryParams.addAll(_queryParams('', 'pageNumber', pageNumber));
    }
    if (pageSize != null) {
      queryParams.addAll(_queryParams('', 'pageSize', pageSize));
    }
    if (nrOfPlayers != null) {
      queryParams.addAll(_queryParams('', 'nrOfPlayers', nrOfPlayers));
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
  /// * [int] pageNumber:
  ///
  /// * [int] pageSize:
  ///
  /// * [int] nrOfPlayers:
  Future<GameDetailsDTOPaginatedResponse?> matchGetAllJoinableByGameTypePaginatorGet({ int? pageNumber, int? pageSize, int? nrOfPlayers, }) async {
    final response = await matchGetAllJoinableByGameTypePaginatorGetWithHttpInfo( pageNumber: pageNumber, pageSize: pageSize, nrOfPlayers: nrOfPlayers, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GameDetailsDTOPaginatedResponse',) as GameDetailsDTOPaginatedResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /Match/get-all-joinable-by-start-time-paginator' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] pageNumber:
  ///
  /// * [int] pageSize:
  Future<Response> matchGetAllJoinableByStartTimePaginatorGetWithHttpInfo({ int? pageNumber, int? pageSize, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Match/get-all-joinable-by-start-time-paginator';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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
  /// * [int] pageNumber:
  ///
  /// * [int] pageSize:
  Future<GameDetailsDTOPaginatedResponse?> matchGetAllJoinableByStartTimePaginatorGet({ int? pageNumber, int? pageSize, }) async {
    final response = await matchGetAllJoinableByStartTimePaginatorGetWithHttpInfo( pageNumber: pageNumber, pageSize: pageSize, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GameDetailsDTOPaginatedResponse',) as GameDetailsDTOPaginatedResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /Match/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> matchIdDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/Match/{id}'
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
  Future<void> matchIdDelete(int id,) async {
    final response = await matchIdDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /Match/join/{matchId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] matchId (required):
  Future<Response> matchJoinMatchIdPutWithHttpInfo(int matchId,) async {
    // ignore: prefer_const_declarations
    final path = r'/Match/join/{matchId}'
      .replaceAll('{matchId}', matchId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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
  /// * [int] matchId (required):
  Future<void> matchJoinMatchIdPut(int matchId,) async {
    final response = await matchJoinMatchIdPutWithHttpInfo(matchId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /Match/leave' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] matchId:
  Future<Response> matchLeavePutWithHttpInfo({ int? matchId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Match/leave';

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
  /// * [int] matchId:
  Future<void> matchLeavePut({ int? matchId, }) async {
    final response = await matchLeavePutWithHttpInfo( matchId: matchId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /Match/match-details-by-id' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id:
  Future<Response> matchMatchDetailsByIdGetWithHttpInfo({ int? id, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Match/match-details-by-id';

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
  Future<GameDetailsDTO?> matchMatchDetailsByIdGet({ int? id, }) async {
    final response = await matchMatchDetailsByIdGetWithHttpInfo( id: id, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GameDetailsDTO',) as GameDetailsDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /Match' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [CreateMatchDTO] createMatchDTO:
  Future<Response> matchPostWithHttpInfo({ CreateMatchDTO? createMatchDTO, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Match';

    // ignore: prefer_final_locals
    Object? postBody = createMatchDTO;

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
  /// * [CreateMatchDTO] createMatchDTO:
  Future<void> matchPost({ CreateMatchDTO? createMatchDTO, }) async {
    final response = await matchPostWithHttpInfo( createMatchDTO: createMatchDTO, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /Match/refresh-db-job' operation and returns the [Response].
  Future<Response> matchRefreshDbJobGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/Match/refresh-db-job';

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

  Future<void> matchRefreshDbJobGet() async {
    final response = await matchRefreshDbJobGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /Match/update-by-id' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id:
  ///
  /// * [UpdateMatchDTO] updateMatchDTO:
  Future<Response> matchUpdateByIdPutWithHttpInfo({ int? id, UpdateMatchDTO? updateMatchDTO, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Match/update-by-id';

    // ignore: prefer_final_locals
    Object? postBody = updateMatchDTO;

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
  /// * [UpdateMatchDTO] updateMatchDTO:
  Future<MatchDTO?> matchUpdateByIdPut({ int? id, UpdateMatchDTO? updateMatchDTO, }) async {
    final response = await matchUpdateByIdPutWithHttpInfo( id: id, updateMatchDTO: updateMatchDTO, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MatchDTO',) as MatchDTO;
    
    }
    return null;
  }
}
