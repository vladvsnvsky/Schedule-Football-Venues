//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateUserDetailsDTO {
  /// Returns a new [CreateUserDetailsDTO] instance.
  CreateUserDetailsDTO({
    this.phone,
    this.birthDay,
    this.birthMonth,
    this.birthYear,
  });

  String? phone;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? birthDay;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? birthMonth;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? birthYear;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateUserDetailsDTO &&
    other.phone == phone &&
    other.birthDay == birthDay &&
    other.birthMonth == birthMonth &&
    other.birthYear == birthYear;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (phone == null ? 0 : phone!.hashCode) +
    (birthDay == null ? 0 : birthDay!.hashCode) +
    (birthMonth == null ? 0 : birthMonth!.hashCode) +
    (birthYear == null ? 0 : birthYear!.hashCode);

  @override
  String toString() => 'CreateUserDetailsDTO[phone=$phone, birthDay=$birthDay, birthMonth=$birthMonth, birthYear=$birthYear]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.phone != null) {
      json[r'phone'] = this.phone;
    } else {
      json[r'phone'] = null;
    }
    if (this.birthDay != null) {
      json[r'birthDay'] = this.birthDay;
    } else {
      json[r'birthDay'] = null;
    }
    if (this.birthMonth != null) {
      json[r'birthMonth'] = this.birthMonth;
    } else {
      json[r'birthMonth'] = null;
    }
    if (this.birthYear != null) {
      json[r'birthYear'] = this.birthYear;
    } else {
      json[r'birthYear'] = null;
    }
    return json;
  }

  /// Returns a new [CreateUserDetailsDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateUserDetailsDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateUserDetailsDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateUserDetailsDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateUserDetailsDTO(
        phone: mapValueOfType<String>(json, r'phone'),
        birthDay: mapValueOfType<int>(json, r'birthDay'),
        birthMonth: mapValueOfType<int>(json, r'birthMonth'),
        birthYear: mapValueOfType<int>(json, r'birthYear'),
      );
    }
    return null;
  }

  static List<CreateUserDetailsDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateUserDetailsDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateUserDetailsDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateUserDetailsDTO> mapFromJson(dynamic json) {
    final map = <String, CreateUserDetailsDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateUserDetailsDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateUserDetailsDTO-objects as value to a dart map
  static Map<String, List<CreateUserDetailsDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateUserDetailsDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateUserDetailsDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

