import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:minifootballfront/matchfilters.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:minifootballfront/service/BearerAuthentication.dart';
import 'package:minifootballfront/service/tokenservice.dart';

class UserService {
  UserApi _userApi = UserApi();

  UserService({UserApi? userApi, required String jwt}) {
    BearerAuthentication auth = BearerAuthentication(jwt);
    ApiClient apiClient = ApiClient(authentication: auth);
    _userApi = userApi ?? UserApi(apiClient);
  }

  Future<AddressDTO> getUserAddressByJWT() async {
    try {

      AddressDTO? address = await _userApi.apiUserAddressByJwtGet();

      if (address == null) throw Exception("No address detected!");
      return address;
    } catch (e) {
      throw e;
    }
  }

  Future<UserEntityDTO?> getUserEntity() async {
    try {
      UserEntityDTO? result = await _userApi.apiUserByJwtGet();
      return result;
    } catch (e) {
      return null;
    }
  }

  Future<UserDetailsDTO?> getUserDetails() async {
    UserDetailsDTO? result = await _userApi.apiUserDetailsByJwtGet();
    return result;
  }

  Future<UserEntityDTOPaginatedResponse?> getUsersPaginated({
    int? currentPage,
    int? pageSize,
    int? id,
    int? countryId,
    int? cityId,
    bool? isBanned,
    String? name,
    String? email,
    int? dayOfBirth,
    int? monthOfBirth,
    int? yearOfBirth,
    bool? isAdmin,
    bool? orderByAgeAsc,
    bool? orderByCreationDateAsc,
  }) async {
    UserEntityDTOPaginatedResponse? result =
        await _userApi.apiUserUsersPaginatedGet(
            currentPage: currentPage,
            pageSize: pageSize,
            id: id,
            cityId: cityId,
            countryId: countryId,
            isBanned: isBanned,
            name: name,
            email: email,
            dayOfBirth: dayOfBirth,
            monthOfBirth: monthOfBirth,
            yearOfBirth: yearOfBirth,
            isAdmin: isAdmin,
            orderByAgeAsc: orderByAgeAsc,
            orderByCreationDateAsc: orderByCreationDateAsc);

    return result;
  }

  Future<UserEntityDTOUpdateRequestResponse?> updateUsernameAsync(
      {required String newUsername}) async {
    UserEntityDTOUpdateRequestResponse? response =
        await _userApi.apiUserUpdateUsernamePut(username: newUsername);
    if (response == null) throw Exception('Something went wrong');
    TokenService().storeToken(response.jwt!);
    return response;
  }

  Future<UserEntityDTOUpdateRequestResponse?> updateEmailAsync(
      {required String newEmail}) async {
    UserEntityDTOUpdateRequestResponse? response =
        await _userApi.apiUserUpdateEmailPut(email: newEmail);
    if (response == null) throw Exception('Something went wrong');
    TokenService().storeToken(response.jwt!);
    return response;
  }

  Future<UserEntityDTOUpdateRequestResponse?> updateBirthdateAsync(
      {required int day, required int month, required int year}) async {
    UserEntityDTOUpdateRequestResponse? response = await _userApi
        .apiUserUpdateBirthdatePut(day: day, month: month, year: year);
    if (response == null) throw Exception('Something went wrong');
    TokenService().storeToken(response.jwt!);
    return response;
  }

  Future<UserEntityDTOUpdateRequestResponse?> updatePhoneAsync(
      {required String phone}) async {
    UserEntityDTOUpdateRequestResponse? response =
        await _userApi.apiUserUpdatePhoneNumberPut(phoneNumber: phone);
    if (response == null) throw Exception('Something went wrong');
    TokenService().storeToken(response.jwt!);
    return response;
  }

  Future<UserEntityDTOUpdateRequestResponse?> updatePasswordAsync(
      {required String newPassword}) async {
    UserEntityDTOUpdateRequestResponse? response =
        await _userApi.apiUserUpdatePasswordPut(password: newPassword);
    if (response == null) throw Exception('Something went wrong');
    TokenService().storeToken(response.jwt!);
    return response;
  }

  UserApi? getApi() {
    return _userApi;
  }
}
