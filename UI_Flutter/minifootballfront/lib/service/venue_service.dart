import 'dart:convert';

import 'package:http/http.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';

class VenueService {
  final FieldApi _venueApi = FieldApi();

  Future<List<FieldDTO>?> getVenuesByCityId(int cityId) async {
    try {
      var venues = await _venueApi.apiFieldGetByCityIdGet(cityId);
      return venues;
    } catch (e) {
      print('Exception when calling _venueApi.apiFieldGetByCityIdGet: $e');
      rethrow;
    }
  }

  Future<FieldDTO> getVenueById(int id) async {
    try {
      var response = await _venueApi.apiFieldGetIdGet(id);
      return response!;
    } catch (e) {
      print('Exception when calling FieldApi -> apiVenueGetById: $e');
      rethrow;
    }
  }

  Future<VenueDetailsDTO> getVenueDetailsById(int id) async {
    try {
      var response = await _venueApi.apiFieldVenueDetailsByidGet(id: id);
      return response!;
    } catch (e) {
      print('Exception when calling FieldApi -> apiVenueGetById: $e');
      rethrow;
    }
  }

  Future<List<VenueDetailsDTO>> getVenuesDetailsByCityId(int cityId) async {
    try {
      List<VenueDetailsDTO>? allVenues =
          await _venueApi.apiFieldVenueDetailsByCityIdGet(id: cityId);

      if (allVenues == null) throw Exception("No venues registered!");
      return allVenues;
    } catch (e) {
      throw e;
    }
  }

  Future<List<int>> getAvailableHoursByDay(
      int day, int month, int year, int venueId) async {
    try {
      Response resp = await FieldApi().apiFieldAvailableHoursGetWithHttpInfo(
          day: day, month: month, year: year, fieldId: venueId);

      Iterable l = json.decode(resp.body);

      List<String> responseTimes = List<String>.from(json.decode(resp.body));

      List<int> allHours = responseTimes.map((timeString) {
        List<String> parts = timeString.split(':');
        int hour = int.parse(parts[0]);
        return hour;
      }).toList();

      return allHours;
    } catch (e) {
      print(
          'Exception when calling FieldApi -> apiFieldAvailableHoursGetWithHttpInfo: $e');
      rethrow;
    }
  }

  Future<void> deleteVenue(int id) async {
    try {
      await _venueApi.apiFieldDeleteIdDelete(id);
    } catch (e) {
      print('Exception when calling FieldApi -> deleteVenue: $e');
      rethrow;
    }
  }

  Future<VenueDetailsDTOPaginatedResponse?> getVenuesByCityIdPaginated(
      int cityId, int pageNumber, int pageSize) async {
    try {
      var venues = await _venueApi.apiFieldGetByCityPaginatedGet(
          cityId: cityId, pageNumber: pageNumber, pageSize: pageSize);
      return venues;
    } catch (e) {
      print('Exception when calling _venueApi.apiFieldGetByCityIdGet: $e');
      rethrow;
    }
  }

  Future<VenueDetailsDTOPaginatedResponse?> getVenuesByCityIdPaginatedSorted(
      int cityId, int currentPage, int pageSize, String sortType) async {
    try {
      var response = await _venueApi.apiFieldGetByCityPaginatedGet(
          cityId: cityId, pageNumber: currentPage, pageSize: pageSize);

      if (response == null || response.items == null) {
        return null;
      }

      List<VenueDetailsDTO> venues = response.items!;

      if (sortType == 'name') {
        venues.sort((a, b) => a.name!.compareTo(b.name!));
      }

      var sortedResponse = VenueDetailsDTOPaginatedResponse(
        items: venues,
        currentPage: response.currentPage,
        totalPages: response.totalPages,
      );

      return sortedResponse;
    } catch (e) {
      print(
          'Exception when calling _venueApi.apiFieldGetByCityPaginatedSorted: $e');
      rethrow;
    }
  }
}
