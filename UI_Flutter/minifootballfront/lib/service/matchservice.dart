import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:minifootballfront/matchfilters.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:minifootballfront/service/BearerAuthentication.dart';

class MatchService {
  MatchApi _api = MatchApi();

  MatchService({MatchApi? matchApi, required String jwt}) {
    BearerAuthentication auth = BearerAuthentication(jwt);
    ApiClient apiClient = ApiClient(authentication: auth);
    _api = matchApi ?? MatchApi(apiClient);
  }

  Future<int> postMatch(CreateMatchDTO? matchDTO) async {
    try {
      var resp = await _api.matchPostWithHttpInfo(createMatchDTO: matchDTO);
      return resp.statusCode;
    } catch (e) {
      if (kDebugMode) {
        print('Exception when calling MatchApi -> matchPostWithHttpInfo: $e');
      }
      rethrow;
    }
  }

  Future<int> postMatchGameDetails(GameDetailsDTO game) async {
    try {
      CreateMatchDTO dto = CreateMatchDTO();

      dto.fieldId = game.fieldId;
      dto.startHour = game.startHour;
      dto.startDay = game.day;
      dto.startMonth = game.month;
      dto.startYear = game.year;
      dto.endHour = game.endHour;
      dto.endDay = game.day;
      dto.endMonth = game.month;
      dto.endYear = game.year;
      dto.nrOfPlayersRequired = game.nrOfPlayersRequired;
      dto.playerCanJoin = true;
      dto.cancelled = game.isCancelled;
      dto.cancelledReason = "";
      dto.organizerId = 1;
      dto.pricePerPlayerUnits = game.pricePerPlayerUnits!;
      var resp = await _api.matchPostWithHttpInfo(createMatchDTO: dto);
      return resp.statusCode;
    } catch (e) {
      if (kDebugMode) {
        print('Exception when calling MatchApi -> matchPostWithHttpInfo: $e');
      }
      rethrow;
    }
  }

  Future<GameDetailsDTO?> getMatchDetailsById(int id) {
    try {
      var response = _api.matchMatchDetailsByIdGet(id: id);
      return response;
    } catch (e) {
      throw Exception("An error occured in MatchService!");
    }
  }

  Future<List<GameDetailsDTO>> getAllActiveMatches() async {
    var resp = await _api.matchActiveGetWithHttpInfo();
    if (resp.statusCode != 200) {
      throw Exception(
          "An error occured in MatchService!: " + resp.statusCode.toString());
    }
    Iterable l = json.decode(resp.body);

    List<GameDetailsDTO> matches = List<GameDetailsDTO>.from(
        l.map((model) => GameDetailsDTO.fromJson(model)));
    return matches;
  }

  Future<List<GameDetailsDTO>> getAllActiveMatchesByCityId(int cityId) async {
    var resp = await _api.matchActiveByCityGetWithHttpInfo(cityId: cityId);
    if (resp.statusCode != 200) {
      throw Exception(
          "An error occured in MatchService!: " + resp.statusCode.toString());
    }
    Iterable l = json.decode(resp.body);

    List<GameDetailsDTO> matches = List<GameDetailsDTO>.from(
        l.map((model) => GameDetailsDTO.fromJson(model)));
    return matches;
  }

  Future<List<GameDetailsDTO>> getAllActiveMatchesByFieldId(int fieldId) async {
    var resp = await _api.matchActiveByFieldGetWithHttpInfo(fieldId: fieldId);
    if (resp.statusCode != 200) {
      throw Exception(
          "An error occured in MatchService!: " + resp.statusCode.toString());
    }
    Iterable l = json.decode(resp.body);

    List<GameDetailsDTO> matches = List<GameDetailsDTO>.from(
        l.map((model) => GameDetailsDTO.fromJson(model)));
    return matches;
  }

  Future<Response> joinGame(int? id) async {
    var resp = await _api.matchJoinMatchIdPutWithHttpInfo(id!);
    return resp;
  }

  Future<List<GameDetailsDTO>> getMatchesByPlayer() async {
    var resp = await _api.matchByPlayerGetWithHttpInfo();
    Iterable l = json.decode(resp.body);

    List<GameDetailsDTO> matches = List<GameDetailsDTO>.from(
        l.map((model) => GameDetailsDTO.fromJson(model)));

    return matches;
  }

  Future<GameDetailsDTOPaginatedResponse?> getMatchesByFiltersPaginated(
      int pageNumber, int pageSize, MatchFilters filters) async {
    var resp = _api.matchByFiltersGet(
      organizerId: filters.organizerId,
      fieldId: filters.fieldId,
      countryId: filters.countryId,
      cityId: filters.cityId,
      startDateFrom: filters.startDateFrom,
      startDateTo: filters.startDateTo,
      endDateFrom: filters.endDateFrom,
      endDateTo: filters.endDateTo,
      minPlayersRequired: filters.minPlayersRequired,
      maxPlayersRequired: filters.maxPlayersRequired,
      playerCanJoin: filters.playerCanJoin,
      finished: filters.finished,
      cancelled: filters.cancelled,
      minSpotsAvailable: filters.minSpotsAvailable,
      maxSpotsAvailable: filters.maxSpotsAvailable,
      pageNumber: pageNumber,
      pageSize: pageSize,
    );

    return resp;
  }

  Future<GameDetailsDTOPaginatedResponse?> getActiveMatchesByPlayerPaginated(
      int pageNumber, int pageSize) async {
    var resp = await _api.matchActiveByPlayerGet(
        pageNumber: pageNumber, pageSize: pageSize);

    return resp;
  }

  Future<Response> cancelGame(int? id, String? cancelationReason) async {
    var reason = "Not specified";
    var resp = await _api.matchCancelPutWithHttpInfo(
        matchId: id, cancelationReason: reason);
    return resp;
  }

  Future<Response> leaveGame(int? id) async {
    var resp = await _api.matchLeavePutWithHttpInfo(matchId: id);
    return resp;
  }

  Future<GameDetailsDTOPaginatedResponse?>
      getFilteredAndSortedMatchesByPlayerPaginated(int currentPage,
          int pageSize, String filterType, String sortType) async {
    try {
      // Fetch all matches
      var response = await _api.matchByPlayerGetWithHttpInfo();
      if (response.statusCode != 200) {
        throw Exception("Failed to fetch matches. Please try again later.");
      }

      Iterable l = json.decode(response.body);
      List<GameDetailsDTO> matches = List<GameDetailsDTO>.from(
          l.map((model) => GameDetailsDTO.fromJson(model)));

      // Apply filtering
      List<GameDetailsDTO> filteredMatches = matches.where((match) {
        if (filterType == 'none') {
          return true;
        } else if (filterType == 'active') {
          return !(match.isCancelled ?? true) && !(match.finished ?? true);
        } else if (filterType == 'finished') {
          return match.finished ?? false;
        } else if (filterType == 'cancelled') {
          return match.isCancelled ?? false;
        }
        return true;
      }).toList();

      // Apply sorting
      filteredMatches.sort((a, b) {
        if (sortType == 'date') {
          DateTime aStart = DateTime(a.year!, a.month!, a.day!, a.startHour!);
          DateTime bStart = DateTime(b.year!, b.month!, b.day!, b.startHour!);
          return aStart.compareTo(bStart);
        } else if (sortType == 'name') {
          return (a.fieldName ?? "").compareTo(b.fieldName ?? "");
        }
        return 0;
      });

      // Paginate results
      int totalItems = filteredMatches.length;
      int totalPages = (totalItems / pageSize).ceil();
      List<GameDetailsDTO> paginatedMatches = filteredMatches
          .skip((currentPage - 1) * pageSize)
          .take(pageSize)
          .toList();

      return GameDetailsDTOPaginatedResponse(
        items: paginatedMatches,
        currentPage: currentPage,
        totalPages: totalPages,
      );
    } catch (e) {
      if (kDebugMode) {
        print(
            'Exception when calling MatchApi -> getFilteredAndSortedMatchesByPlayerPaginated: $e');
      }
      rethrow;
    }
  }
}
