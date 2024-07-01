//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserDetailsDTO {
  /// Returns a new [UserDetailsDTO] instance.
  UserDetailsDTO({
    this.id,
    this.phone,
    this.birthdate,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  String? phone;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? birthdate;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserDetailsDTO &&
    other.id == id &&
    other.phone == phone &&
    other.birthdate == birthdate;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (phone == null ? 0 : phone!.hashCode) +
    (birthdate == null ? 0 : birthdate!.hashCode);

  @override
  String toString() => 'UserDetailsDTO[id=$id, phone=$phone, birthdate=$birthdate]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.phone != null) {
      json[r'phone'] = this.phone;
    } else {
      json[r'phone'] = null;
    }
    if (this.birthdate != null) {
      json[r'birthdate'] = _dateFormatter.format(this.birthdate!.toUtc());
    } else {
      json[r'birthdate'] = null;
    }
    return json;
  }

  /// Returns a new [UserDetailsDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserDetailsDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserDetailsDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserDetailsDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserDetailsDTO(
        id: mapValueOfType<int>(json, r'id'),
        phone: mapValueOfType<String>(json, r'phone'),
        birthdate: mapDateTime(json, r'birthdate', r''),
      );
    }
    return null;
  }

  static List<UserDetailsDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserDetailsDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserDetailsDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserDetailsDTO> mapFromJson(dynamic json) {
    final map = <String, UserDetailsDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserDetailsDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserDetailsDTO-objects as value to a dart map
  static Map<String, List<UserDetailsDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserDetailsDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UserDetailsDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

