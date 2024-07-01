//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AddressDTO {
  /// Returns a new [AddressDTO] instance.
  AddressDTO({
    this.id,
    this.cityId,
    this.cityName,
    this.countryId,
    this.countryName,
    this.streetAndNo,
    this.latitude,
    this.longitude,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? cityId;

  String? cityName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? countryId;

  String? countryName;

  String? streetAndNo;

  double? latitude;

  double? longitude;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AddressDTO &&
    other.id == id &&
    other.cityId == cityId &&
    other.cityName == cityName &&
    other.countryId == countryId &&
    other.countryName == countryName &&
    other.streetAndNo == streetAndNo &&
    other.latitude == latitude &&
    other.longitude == longitude;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (cityId == null ? 0 : cityId!.hashCode) +
    (cityName == null ? 0 : cityName!.hashCode) +
    (countryId == null ? 0 : countryId!.hashCode) +
    (countryName == null ? 0 : countryName!.hashCode) +
    (streetAndNo == null ? 0 : streetAndNo!.hashCode) +
    (latitude == null ? 0 : latitude!.hashCode) +
    (longitude == null ? 0 : longitude!.hashCode);

  @override
  String toString() => 'AddressDTO[id=$id, cityId=$cityId, cityName=$cityName, countryId=$countryId, countryName=$countryName, streetAndNo=$streetAndNo, latitude=$latitude, longitude=$longitude]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.cityId != null) {
      json[r'cityId'] = this.cityId;
    } else {
      json[r'cityId'] = null;
    }
    if (this.cityName != null) {
      json[r'cityName'] = this.cityName;
    } else {
      json[r'cityName'] = null;
    }
    if (this.countryId != null) {
      json[r'countryId'] = this.countryId;
    } else {
      json[r'countryId'] = null;
    }
    if (this.countryName != null) {
      json[r'countryName'] = this.countryName;
    } else {
      json[r'countryName'] = null;
    }
    if (this.streetAndNo != null) {
      json[r'streetAndNo'] = this.streetAndNo;
    } else {
      json[r'streetAndNo'] = null;
    }
    if (this.latitude != null) {
      json[r'latitude'] = this.latitude;
    } else {
      json[r'latitude'] = null;
    }
    if (this.longitude != null) {
      json[r'longitude'] = this.longitude;
    } else {
      json[r'longitude'] = null;
    }
    return json;
  }

  /// Returns a new [AddressDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AddressDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AddressDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AddressDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AddressDTO(
        id: mapValueOfType<int>(json, r'id'),
        cityId: mapValueOfType<int>(json, r'cityId'),
        cityName: mapValueOfType<String>(json, r'cityName'),
        countryId: mapValueOfType<int>(json, r'countryId'),
        countryName: mapValueOfType<String>(json, r'countryName'),
        streetAndNo: mapValueOfType<String>(json, r'streetAndNo'),
        latitude: mapValueOfType<double>(json, r'latitude'),
        longitude: mapValueOfType<double>(json, r'longitude'),
      );
    }
    return null;
  }

  static List<AddressDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AddressDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AddressDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AddressDTO> mapFromJson(dynamic json) {
    final map = <String, AddressDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AddressDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AddressDTO-objects as value to a dart map
  static Map<String, List<AddressDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AddressDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AddressDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

