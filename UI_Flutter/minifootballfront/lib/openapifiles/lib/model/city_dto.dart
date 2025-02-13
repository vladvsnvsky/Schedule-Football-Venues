//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CityDTO {
  /// Returns a new [CityDTO] instance.
  CityDTO({
    this.id,
    this.name,
    this.countryId,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? countryId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CityDTO &&
    other.id == id &&
    other.name == name &&
    other.countryId == countryId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (countryId == null ? 0 : countryId!.hashCode);

  @override
  String toString() => 'CityDTO[id=$id, name=$name, countryId=$countryId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.countryId != null) {
      json[r'countryId'] = this.countryId;
    } else {
      json[r'countryId'] = null;
    }
    return json;
  }

  /// Returns a new [CityDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CityDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CityDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CityDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CityDTO(
        id: mapValueOfType<int>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
        countryId: mapValueOfType<int>(json, r'countryId'),
      );
    }
    return null;
  }

  static List<CityDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CityDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CityDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CityDTO> mapFromJson(dynamic json) {
    final map = <String, CityDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CityDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CityDTO-objects as value to a dart map
  static Map<String, List<CityDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CityDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CityDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

