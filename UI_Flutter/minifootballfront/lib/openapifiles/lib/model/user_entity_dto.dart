//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserEntityDTO {
  /// Returns a new [UserEntityDTO] instance.
  UserEntityDTO({
    this.id,
    this.username,
    this.email,
    this.token,
    this.addressId,
    this.userDetailsId,
    this.isBanned,
    this.createdAt,
    this.budgetUnits,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  String? username;

  String? email;

  String? token;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? addressId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? userDetailsId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isBanned;

  DateTime? createdAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? budgetUnits;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserEntityDTO &&
    other.id == id &&
    other.username == username &&
    other.email == email &&
    other.token == token &&
    other.addressId == addressId &&
    other.userDetailsId == userDetailsId &&
    other.isBanned == isBanned &&
    other.createdAt == createdAt &&
    other.budgetUnits == budgetUnits;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (username == null ? 0 : username!.hashCode) +
    (email == null ? 0 : email!.hashCode) +
    (token == null ? 0 : token!.hashCode) +
    (addressId == null ? 0 : addressId!.hashCode) +
    (userDetailsId == null ? 0 : userDetailsId!.hashCode) +
    (isBanned == null ? 0 : isBanned!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (budgetUnits == null ? 0 : budgetUnits!.hashCode);

  @override
  String toString() => 'UserEntityDTO[id=$id, username=$username, email=$email, token=$token, addressId=$addressId, userDetailsId=$userDetailsId, isBanned=$isBanned, createdAt=$createdAt, budgetUnits=$budgetUnits]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
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
    if (this.token != null) {
      json[r'token'] = this.token;
    } else {
      json[r'token'] = null;
    }
    if (this.addressId != null) {
      json[r'addressId'] = this.addressId;
    } else {
      json[r'addressId'] = null;
    }
    if (this.userDetailsId != null) {
      json[r'userDetailsId'] = this.userDetailsId;
    } else {
      json[r'userDetailsId'] = null;
    }
    if (this.isBanned != null) {
      json[r'isBanned'] = this.isBanned;
    } else {
      json[r'isBanned'] = null;
    }
    if (this.createdAt != null) {
      json[r'createdAt'] = this.createdAt!.toUtc().toIso8601String();
    } else {
      json[r'createdAt'] = null;
    }
    if (this.budgetUnits != null) {
      json[r'budgetUnits'] = this.budgetUnits;
    } else {
      json[r'budgetUnits'] = null;
    }
    return json;
  }

  /// Returns a new [UserEntityDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserEntityDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserEntityDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserEntityDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserEntityDTO(
        id: mapValueOfType<int>(json, r'id'),
        username: mapValueOfType<String>(json, r'username'),
        email: mapValueOfType<String>(json, r'email'),
        token: mapValueOfType<String>(json, r'token'),
        addressId: mapValueOfType<int>(json, r'addressId'),
        userDetailsId: mapValueOfType<int>(json, r'userDetailsId'),
        isBanned: mapValueOfType<bool>(json, r'isBanned'),
        createdAt: mapDateTime(json, r'createdAt', r''),
        budgetUnits: mapValueOfType<int>(json, r'budgetUnits'),
      );
    }
    return null;
  }

  static List<UserEntityDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserEntityDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserEntityDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserEntityDTO> mapFromJson(dynamic json) {
    final map = <String, UserEntityDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserEntityDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserEntityDTO-objects as value to a dart map
  static Map<String, List<UserEntityDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserEntityDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UserEntityDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

