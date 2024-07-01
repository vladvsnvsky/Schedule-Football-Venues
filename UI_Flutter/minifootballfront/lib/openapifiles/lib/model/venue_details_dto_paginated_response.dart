//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VenueDetailsDTOPaginatedResponse {
  /// Returns a new [VenueDetailsDTOPaginatedResponse] instance.
  VenueDetailsDTOPaginatedResponse({
    this.currentPage,
    this.totalPages,
    this.items = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? currentPage;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? totalPages;

  List<VenueDetailsDTO>? items;

  @override
  bool operator ==(Object other) => identical(this, other) || other is VenueDetailsDTOPaginatedResponse &&
    other.currentPage == currentPage &&
    other.totalPages == totalPages &&
    _deepEquality.equals(other.items, items);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (currentPage == null ? 0 : currentPage!.hashCode) +
    (totalPages == null ? 0 : totalPages!.hashCode) +
    (items == null ? 0 : items!.hashCode);

  @override
  String toString() => 'VenueDetailsDTOPaginatedResponse[currentPage=$currentPage, totalPages=$totalPages, items=$items]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.currentPage != null) {
      json[r'currentPage'] = this.currentPage;
    } else {
      json[r'currentPage'] = null;
    }
    if (this.totalPages != null) {
      json[r'totalPages'] = this.totalPages;
    } else {
      json[r'totalPages'] = null;
    }
    if (this.items != null) {
      json[r'items'] = this.items;
    } else {
      json[r'items'] = null;
    }
    return json;
  }

  /// Returns a new [VenueDetailsDTOPaginatedResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VenueDetailsDTOPaginatedResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "VenueDetailsDTOPaginatedResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "VenueDetailsDTOPaginatedResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return VenueDetailsDTOPaginatedResponse(
        currentPage: mapValueOfType<int>(json, r'currentPage'),
        totalPages: mapValueOfType<int>(json, r'totalPages'),
        items: VenueDetailsDTO.listFromJson(json[r'items']),
      );
    }
    return null;
  }

  static List<VenueDetailsDTOPaginatedResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <VenueDetailsDTOPaginatedResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VenueDetailsDTOPaginatedResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VenueDetailsDTOPaginatedResponse> mapFromJson(dynamic json) {
    final map = <String, VenueDetailsDTOPaginatedResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VenueDetailsDTOPaginatedResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VenueDetailsDTOPaginatedResponse-objects as value to a dart map
  static Map<String, List<VenueDetailsDTOPaginatedResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<VenueDetailsDTOPaginatedResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VenueDetailsDTOPaginatedResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

