import 'dart:convert';

import 'package:http/http.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';

class CityService {
  final CityApi _cityApi = CityApi();

  Future<List<CityDTO>> getCities() async {
    try {
      Response resp = await _cityApi.apiCityGetWithHttpInfo();
      Iterable l = json.decode(resp.body);
      List<CityDTO> cities =
          List<CityDTO>.from(l.map((model) => CreateCityDTO.fromJson(model)));
      return cities;
    } catch (e) {
      print('Exception when calling CityApi -> apiCityGetWithHttpInfo: $e');
      rethrow;
    }
  }

  Future<List<CityDTO>> getCitiesByCountryId(int countryId) async {
    try {
      Response resp = await _cityApi.apiCityGetWithHttpInfo();
      Iterable l = json.decode(resp.body);
      List<CityDTO> allCities =
          List<CityDTO>.from(l.map((model) => CityDTO.fromJson(model)));

      List<CityDTO> cities =
          allCities.where((city) => city.countryId == countryId).toList();

      return cities;
    } catch (e) {
      print('Exception when calling CityApi -> apiCityGetWithHttpInfo: $e');
      rethrow;
    }
  }

  Future<CityDTO?> createCity(CreateCityDTO createCityDTO) async {
    try {
      final response =
          await _cityApi.apiCityCreatePost(createCityDTO: createCityDTO);
      return response;
    } catch (e) {
      print('Exception when calling CityApi -> createCity: $e');
      rethrow;
    }
  }

  Future<CityDTO?> updateCity(int id, CreateCityDTO createCityDTO) async {
    try {
      final response =
          await _cityApi.apiCityUpdatePut(id: id, createCityDTO: createCityDTO);
      return response;
    } catch (e) {
      print('Exception when calling CityApi -> updateCity: $e');
      rethrow;
    }
  }

  Future<void> deleteCity(int id) async {
    try {
      await _cityApi.apiCityDeleteDelete(id: id);
    } catch (e) {
      print('Exception when calling CityApi -> deleteCity: $e');
      rethrow;
    }
  }
}
