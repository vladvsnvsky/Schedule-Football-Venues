import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';

class CountryService {
  final CountryApi _countryApi;

  // Add a constructor that accepts CountryApi
  CountryService({CountryApi? countryApi})
      : _countryApi = countryApi ?? CountryApi();

  Future<List<CountryDTO>> getCountries() async {
    try {
      Response resp = await _countryApi.apiCountryGetWithHttpInfo();
      Iterable l = json.decode(resp.body);
      List<CountryDTO> countries =
          List<CountryDTO>.from(l.map((model) => CountryDTO.fromJson(model)));
      return countries;
    } catch (e) {
      print(
          'Exception when calling CountryApi -> apiCountryGetWithHttpInfo: $e');
      rethrow;
    }
  }

  Future<CountryDTO?> createCountry(CreateCountryDTO createCountryDTO) async {
    try {
      final response = await _countryApi.apiCountryCreatePost(
          createCountryDTO: createCountryDTO);
      return response;
    } catch (e) {
      print('Exception when calling CountryApi -> createCountry: $e');
      throw e;
    }
  }

  Future<CountryDTO?> updateCountry(
      int id, CreateCountryDTO createCountryDTO) async {
    try {
      final response = await _countryApi.apiCountryUpdateIdPut(id,
          createCountryDTO: createCountryDTO);
      return response;
    } catch (e) {
      print('Exception when calling CountryApi -> updateCountry: $e');
      throw e;
    }
  }

  Future<void> deleteCountry(int id) async {
    try {
      await _countryApi.apiCountryDeleteIdDelete(id);
    } catch (e) {
      if (kDebugMode) {
        print('Exception when calling CountryApi -> deleteCountry: $e');
      }
      rethrow;
    }
  }
}
