//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldDTOUpdateRequestResponse {
  /// Returns a new [FieldDTOUpdateRequestResponse] instance.
  FieldDTOUpdateRequestResponse({
    this.value,
    this.message,
    this.isOk,
    this.jwt,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  FieldDTO? value;

  String? message;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isOk;

  String? jwt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldDTOUpdateRequestResponse &&
    other.value == value &&
    other.message == message &&
    other.isOk == isOk &&
    other.jwt == jwt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (value == null ? 0 : value!.hashCode) +
    (message == null ? 0 : message!.hashCode) +
    (isOk == null ? 0 : isOk!.hashCode) +
    (jwt == null ? 0 : jwt!.hashCode);

  @override
  String toString() => 'FieldDTOUpdateRequestResponse[value=$value, message=$message, isOk=$isOk, jwt=$jwt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.value != null) {
      json[r'value'] = this.value;
    } else {
      json[r'value'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    if (this.isOk != null) {
      json[r'isOk'] = this.isOk;
    } else {
      json[r'isOk'] = null;
    }
    if (this.jwt != null) {
      json[r'jwt'] = this.jwt;
    } else {
      json[r'jwt'] = null;
    }
    return json;
  }

  /// Returns a new [FieldDTOUpdateRequestResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldDTOUpdateRequestResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "FieldDTOUpdateRequestResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "FieldDTOUpdateRequestResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FieldDTOUpdateRequestResponse(
        value: FieldDTO.fromJson(json[r'value']),
        message: mapValueOfType<String>(json, r'message'),
        isOk: mapValueOfType<bool>(json, r'isOk'),
        jwt: mapValueOfType<String>(json, r'jwt'),
      );
    }
    return null;
  }

  static List<FieldDTOUpdateRequestResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldDTOUpdateRequestResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldDTOUpdateRequestResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldDTOUpdateRequestResponse> mapFromJson(dynamic json) {
    final map = <String, FieldDTOUpdateRequestResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldDTOUpdateRequestResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldDTOUpdateRequestResponse-objects as value to a dart map
  static Map<String, List<FieldDTOUpdateRequestResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldDTOUpdateRequestResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldDTOUpdateRequestResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

