//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/address_api.dart';
part 'api/auth_api.dart';
part 'api/city_api.dart';
part 'api/country_api.dart';
part 'api/field_api.dart';
part 'api/match_api.dart';
part 'api/sign_up_api.dart';
part 'api/user_api.dart';

part 'model/address_dto.dart';
part 'model/city_dto.dart';
part 'model/country_dto.dart';
part 'model/create_address_dto.dart';
part 'model/create_city_dto.dart';
part 'model/create_country_dto.dart';
part 'model/create_field_dto.dart';
part 'model/create_match_dto.dart';
part 'model/create_user_details_dto.dart';
part 'model/create_user_entity_dto.dart';
part 'model/email_request_dio.dart';
part 'model/field_dto.dart';
part 'model/field_dto_update_request_response.dart';
part 'model/game_details_dto.dart';
part 'model/game_details_dto_paginated_response.dart';
part 'model/match_dto.dart';
part 'model/time_span.dart';
part 'model/update_address_dto.dart';
part 'model/update_match_dto.dart';
part 'model/update_user_details_dto.dart';
part 'model/update_user_entity_dto.dart';
part 'model/user_details_dto.dart';
part 'model/user_entity_dto.dart';
part 'model/user_entity_dto_paginated_response.dart';
part 'model/user_entity_dto_update_request_response.dart';
part 'model/user_sign_in.dart';
part 'model/venue_details_dto.dart';
part 'model/venue_details_dto_paginated_response.dart';


/// An [ApiClient] instance that uses the default values obtained from
/// the OpenAPI specification file.
var defaultApiClient = ApiClient();

const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
const _deepEquality = DeepCollectionEquality();
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

bool _isEpochMarker(String? pattern) => pattern == _dateEpochMarker || pattern == '/$_dateEpochMarker/';
