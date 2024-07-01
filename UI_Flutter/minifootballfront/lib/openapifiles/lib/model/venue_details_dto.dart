//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VenueDetailsDTO {
  /// Returns a new [VenueDetailsDTO] instance.
  VenueDetailsDTO({
    this.venueId,
    this.cityId,
    this.countryId,
    this.name,
    this.email,
    this.phone,
    this.description,
    this.streetAndNo,
    this.cityName,
    this.countryName,
    this.width,
    this.length,
    this.capacity,
    this.latitude,
    this.longitude,
    this.pricePerHourUnits,
    this.isActive,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? venueId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? cityId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? countryId;

  String? name;

  String? email;

  String? phone;

  String? description;

  String? streetAndNo;

  String? cityName;

  String? countryName;

  int? width;

  int? length;

  int? capacity;

  double? latitude;

  double? longitude;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? pricePerHourUnits;

  bool? isActive;

  @override
  bool operator ==(Object other) => identical(this, other) || other is VenueDetailsDTO &&
    other.venueId == venueId &&
    other.cityId == cityId &&
    other.countryId == countryId &&
    other.name == name &&
    other.email == email &&
    other.phone == phone &&
    other.description == description &&
    other.streetAndNo == streetAndNo &&
    other.cityName == cityName &&
    other.countryName == countryName &&
    other.width == width &&
    other.length == length &&
    other.capacity == capacity &&
    other.latitude == latitude &&
    other.longitude == longitude &&
    other.pricePerHourUnits == pricePerHourUnits &&
    other.isActive == isActive;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (venueId == null ? 0 : venueId!.hashCode) +
    (cityId == null ? 0 : cityId!.hashCode) +
    (countryId == null ? 0 : countryId!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (email == null ? 0 : email!.hashCode) +
    (phone == null ? 0 : phone!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (streetAndNo == null ? 0 : streetAndNo!.hashCode) +
    (cityName == null ? 0 : cityName!.hashCode) +
    (countryName == null ? 0 : countryName!.hashCode) +
    (width == null ? 0 : width!.hashCode) +
    (length == null ? 0 : length!.hashCode) +
    (capacity == null ? 0 : capacity!.hashCode) +
    (latitude == null ? 0 : latitude!.hashCode) +
    (longitude == null ? 0 : longitude!.hashCode) +
    (pricePerHourUnits == null ? 0 : pricePerHourUnits!.hashCode) +
    (isActive == null ? 0 : isActive!.hashCode);

  @override
  String toString() => 'VenueDetailsDTO[venueId=$venueId, cityId=$cityId, countryId=$countryId, name=$name, email=$email, phone=$phone, description=$description, streetAndNo=$streetAndNo, cityName=$cityName, countryName=$countryName, width=$width, length=$length, capacity=$capacity, latitude=$latitude, longitude=$longitude, pricePerHourUnits=$pricePerHourUnits, isActive=$isActive]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.venueId != null) {
      json[r'venueId'] = this.venueId;
    } else {
      json[r'venueId'] = null;
    }
    if (this.cityId != null) {
      json[r'cityId'] = this.cityId;
    } else {
      json[r'cityId'] = null;
    }
    if (this.countryId != null) {
      json[r'countryId'] = this.countryId;
    } else {
      json[r'countryId'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.email != null) {
      json[r'email'] = this.email;
    } else {
      json[r'email'] = null;
    }
    if (this.phone != null) {
      json[r'phone'] = this.phone;
    } else {
      json[r'phone'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.streetAndNo != null) {
      json[r'streetAndNo'] = this.streetAndNo;
    } else {
      json[r'streetAndNo'] = null;
    }
    if (this.cityName != null) {
      json[r'cityName'] = this.cityName;
    } else {
      json[r'cityName'] = null;
    }
    if (this.countryName != null) {
      json[r'countryName'] = this.countryName;
    } else {
      json[r'countryName'] = null;
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
    if (this.capacity != null) {
      json[r'capacity'] = this.capacity;
    } else {
      json[r'capacity'] = null;
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
    if (this.pricePerHourUnits != null) {
      json[r'pricePerHourUnits'] = this.pricePerHourUnits;
    } else {
      json[r'pricePerHourUnits'] = null;
    }
    if (this.isActive != null) {
      json[r'isActive'] = this.isActive;
    } else {
      json[r'isActive'] = null;
    }
    return json;
  }

  /// Returns a new [VenueDetailsDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VenueDetailsDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "VenueDetailsDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "VenueDetailsDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return VenueDetailsDTO(
        venueId: mapValueOfType<int>(json, r'venueId'),
        cityId: mapValueOfType<int>(json, r'cityId'),
        countryId: mapValueOfType<int>(json, r'countryId'),
        name: mapValueOfType<String>(json, r'name'),
        email: mapValueOfType<String>(json, r'email'),
        phone: mapValueOfType<String>(json, r'phone'),
        description: mapValueOfType<String>(json, r'description'),
        streetAndNo: mapValueOfType<String>(json, r'streetAndNo'),
        cityName: mapValueOfType<String>(json, r'cityName'),
        countryName: mapValueOfType<String>(json, r'countryName'),
        width: mapValueOfType<int>(json, r'width'),
        length: mapValueOfType<int>(json, r'length'),
        capacity: mapValueOfType<int>(json, r'capacity'),
        latitude: mapValueOfType<double>(json, r'latitude'),
        longitude: mapValueOfType<double>(json, r'longitude'),
        pricePerHourUnits: mapValueOfType<int>(json, r'pricePerHourUnits'),
        isActive: mapValueOfType<bool>(json, r'isActive'),
      );
    }
    return null;
  }

  static List<VenueDetailsDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <VenueDetailsDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VenueDetailsDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VenueDetailsDTO> mapFromJson(dynamic json) {
    final map = <String, VenueDetailsDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VenueDetailsDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VenueDetailsDTO-objects as value to a dart map
  static Map<String, List<VenueDetailsDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<VenueDetailsDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VenueDetailsDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

