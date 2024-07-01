import 'dart:convert';

import 'package:http/http.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';

class AddressService {
  final AddressApi _addressApi;

  AddressService({AddressApi? addressApi})
      : _addressApi = addressApi ?? AddressApi();

  Future<List<AddressDTO>?> getAddresses() async {
    try {
      List<AddressDTO>? localList = await _addressApi.apiAddressGetAllGet();
      if (localList != null) return localList;
      return [];
    } catch (e) {
      print(
          'Exception when calling AddressApi -> apiAddressGetWithHttpInfo: $e');
      throw e;
    }
  }

  Future<AddressDTO?> createAddress(CreateAddressDTO createAddressDTO) async {
    try {
      AddressDTO? response = await _addressApi.apiAddressCreateAddressPost(
          createAddressDTO: createAddressDTO);
      return response;
    } catch (e) {
      print('Exception when calling AddressApi -> createAddress: $e');
      throw e;
    }
  }

  Future<AddressDTO?> updateAddress(
      int id, CreateAddressDTO createAddressDTO) async {
    try {
      final response = await _addressApi.apiAddressUpdatePut(
          id: id, createAddressDTO: createAddressDTO);
      return response;
    } catch (e) {
      print('Exception when calling AddressApi -> updateAddress: $e');
      throw e;
    }
  }

  Future<void> deleteAddress(int id) async {
    try {
      await _addressApi.apiAddressDeleteDelete(id: id);
    } catch (e) {
      print('Exception when calling AddressApi -> deleteAddress: $e');
      throw e;
    }
  }
}
