//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateUserEntityDTO {
  /// Returns a new [CreateUserEntityDTO] instance.
  CreateUserEntityDTO({
    this.username,
    this.email,
    this.password,
    this.address,
    this.userDetails,
  });

  String? username;

  String? email;

  String? password;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CreateAddressDTO? address;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CreateUserDetailsDTO? userDetails;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateUserEntityDTO &&
    other.username == username &&
    other.email == email &&
    other.password == password &&
    other.address == address &&
    other.userDetails == userDetails;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (username == null ? 0 : username!.hashCode) +
    (email == null ? 0 : email!.hashCode) +
    (password == null ? 0 : password!.hashCode) +
    (address == null ? 0 : address!.hashCode) +
    (userDetails == null ? 0 : userDetails!.hashCode);

  @override
  String toString() => 'CreateUserEntityDTO[username=$username, email=$email, password=$password, address=$address, userDetails=$userDetails]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.username != null) {
      json[r'username'] = this.username;
    } else {
      json[r'username'] = null;
    }
    if (this.email != null) {
      json[r'email'] = this.email;
    } else {
      json[r'email'] = null;
    }
    if (this.password != null) {
      json[r'password'] = this.password;
    } else {
      json[r'password'] = null;
    }
    if (this.address != null) {
      json[r'address'] = this.address;
    } else {
      json[r'address'] = null;
    }
    if (this.userDetails != null) {
      json[r'userDetails'] = this.userDetails;
    } else {
      json[r'userDetails'] = null;
    }
    return json;
  }

  /// Returns a new [CreateUserEntityDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateUserEntityDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateUserEntityDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateUserEntityDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateUserEntityDTO(
        username: mapValueOfType<String>(json, r'username'),
        email: mapValueOfType<String>(json, r'email'),
        password: mapValueOfType<String>(json, r'password'),
        address: CreateAddressDTO.fromJson(json[r'address']),
        userDetails: CreateUserDetailsDTO.fromJson(json[r'userDetails']),
      );
    }
    return null;
  }

  static List<CreateUserEntityDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateUserEntityDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateUserEntityDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateUserEntityDTO> mapFromJson(dynamic json) {
    final map = <String, CreateUserEntityDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateUserEntityDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateUserEntityDTO-objects as value to a dart map
  static Map<String, List<CreateUserEntityDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateUserEntityDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateUserEntityDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

