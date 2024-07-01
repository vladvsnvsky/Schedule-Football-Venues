//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateFieldDTO {
  /// Returns a new [CreateFieldDTO] instance.
  CreateFieldDTO({
    this.name,
    this.description,
    this.capacity,
    this.width,
    this.length,
    this.pricePerHourUnits,
    this.phone,
    this.email,
    this.cityId,
    this.streetAndNo,
    this.googleMapsLatitude,
    this.googleMapsLongitude,
  });

  String? name;

  String? description;

  int? capacity;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? width;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? length;

  int? pricePerHourUnits;

  String? phone;

  String? email;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? cityId;

  String? streetAndNo;

  double? googleMapsLatitude;

  double? googleMapsLongitude;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateFieldDTO &&
    other.name == name &&
    other.description == description &&
    other.capacity == capacity &&
    other.width == width &&
    other.length == length &&
    other.pricePerHourUnits == pricePerHourUnits &&
    other.phone == phone &&
    other.email == email &&
    other.cityId == cityId &&
    other.streetAndNo == streetAndNo &&
    other.googleMapsLatitude == googleMapsLatitude &&
    other.googleMapsLongitude == googleMapsLongitude;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name == null ? 0 : name!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (capacity == null ? 0 : capacity!.hashCode) +
    (width == null ? 0 : width!.hashCode) +
    (length == null ? 0 : length!.hashCode) +
    (pricePerHourUnits == null ? 0 : pricePerHourUnits!.hashCode) +
    (phone == null ? 0 : phone!.hashCode) +
    (email == null ? 0 : email!.hashCode) +
    (cityId == null ? 0 : cityId!.hashCode) +
    (streetAndNo == null ? 0 : streetAndNo!.hashCode) +
    (googleMapsLatitude == null ? 0 : googleMapsLatitude!.hashCode) +
    (googleMapsLongitude == null ? 0 : googleMapsLongitude!.hashCode);

  @override
  String toString() => 'CreateFieldDTO[name=$name, description=$description, capacity=$capacity, width=$width, length=$length, pricePerHourUnits=$pricePerHourUnits, phone=$phone, email=$email, cityId=$cityId, streetAndNo=$streetAndNo, googleMapsLatitude=$googleMapsLatitude, googleMapsLongitude=$googleMapsLongitude]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.capacity != null) {
      json[r'capacity'] = this.capacity;
    } else {
      json[r'capacity'] = null;
    }
    if (this.width != null) {
      json[r'width'] = this.width;
    } else {
      json[r'width'] = null;
    }
    if (this.length != null) {
      json[r'length'] = this.length;
    } else {
      json[r'length'] = null;
    }
    if (this.pricePerHourUnits != null) {
      json[r'pricePerHourUnits'] = this.pricePerHourUnits;
    } else {
      json[r'pricePerHourUnits'] = null;
    }
    if (this.phone != null) {
      json[r'phone'] = this.phone;
    } else {
      json[r'phone'] = null;
    }
    if (this.email != null) {
      json[r'email'] = this.email;
    } else {
      json[r'email'] = null;
    }
    if (this.cityId != null) {
      json[r'cityId'] = this.cityId;
    } else {
      json[r'cityId'] = null;
    }
    if (this.streetAndNo != null) {
      json[r'streetAndNo'] = this.streetAndNo;
    } else {
      json[r'streetAndNo'] = null;
    }
    if (this.googleMapsLatitude != null) {
      json[r'googleMapsLatitude'] = this.googleMapsLatitude;
    } else {
      json[r'googleMapsLatitude'] = null;
    }
    if (this.googleMapsLongitude != null) {
      json[r'googleMapsLongitude'] = this.googleMapsLongitude;
    } else {
      json[r'googleMapsLongitude'] = null;
    }
    return json;
  }

  /// Returns a new [CreateFieldDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateFieldDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateFieldDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateFieldDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateFieldDTO(
        name: mapValueOfType<String>(json, r'name'),
        description: mapValueOfType<String>(json, r'description'),
        capacity: mapValueOfType<int>(json, r'capacity'),
        width: mapValueOfType<double>(json, r'width'),
        length: mapValueOfType<double>(json, r'length'),
        pricePerHourUnits: mapValueOfType<int>(json, r'pricePerHourUnits'),
        phone: mapValueOfType<String>(json, r'phone'),
        email: mapValueOfType<String>(json, r'email'),
        cityId: mapValueOfType<int>(json, r'cityId'),
        streetAndNo: mapValueOfType<String>(json, r'streetAndNo'),
        googleMapsLatitude: mapValueOfType<double>(json, r'googleMapsLatitude'),
        googleMapsLongitude: mapValueOfType<double>(json, r'googleMapsLongitude'),
      );
    }
    return null;
  }

  static List<CreateFieldDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateFieldDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateFieldDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateFieldDTO> mapFromJson(dynamic json) {
    final map = <String, CreateFieldDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateFieldDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateFieldDTO-objects as value to a dart map
  static Map<String, List<CreateFieldDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateFieldDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateFieldDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

