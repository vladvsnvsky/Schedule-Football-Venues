//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateMatchDTO {
  /// Returns a new [CreateMatchDTO] instance.
  CreateMatchDTO({
    this.fieldId,
    this.organizerId,
    this.startHour,
    this.startDay,
    this.startMonth,
    this.startYear,
    this.endHour,
    this.endDay,
    this.endMonth,
    this.endYear,
    this.nrOfPlayersRequired,
    this.playerCanJoin,
    this.cancelled,
    this.cancelledReason,
    this.pricePerPlayerUnits,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? fieldId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? organizerId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? startHour;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? startDay;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? startMonth;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? startYear;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? endHour;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? endDay;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? endMonth;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? endYear;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? nrOfPlayersRequired;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? playerCanJoin;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? cancelled;

  String? cancelledReason;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? pricePerPlayerUnits;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateMatchDTO &&
    other.fieldId == fieldId &&
    other.organizerId == organizerId &&
    other.startHour == startHour &&
    other.startDay == startDay &&
    other.startMonth == startMonth &&
    other.startYear == startYear &&
    other.endHour == endHour &&
    other.endDay == endDay &&
    other.endMonth == endMonth &&
    other.endYear == endYear &&
    other.nrOfPlayersRequired == nrOfPlayersRequired &&
    other.playerCanJoin == playerCanJoin &&
    other.cancelled == cancelled &&
    other.cancelledReason == cancelledReason &&
    other.pricePerPlayerUnits == pricePerPlayerUnits;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (fieldId == null ? 0 : fieldId!.hashCode) +
    (organizerId == null ? 0 : organizerId!.hashCode) +
    (startHour == null ? 0 : startHour!.hashCode) +
    (startDay == null ? 0 : startDay!.hashCode) +
    (startMonth == null ? 0 : startMonth!.hashCode) +
    (startYear == null ? 0 : startYear!.hashCode) +
    (endHour == null ? 0 : endHour!.hashCode) +
    (endDay == null ? 0 : endDay!.hashCode) +
    (endMonth == null ? 0 : endMonth!.hashCode) +
    (endYear == null ? 0 : endYear!.hashCode) +
    (nrOfPlayersRequired == null ? 0 : nrOfPlayersRequired!.hashCode) +
    (playerCanJoin == null ? 0 : playerCanJoin!.hashCode) +
    (cancelled == null ? 0 : cancelled!.hashCode) +
    (cancelledReason == null ? 0 : cancelledReason!.hashCode) +
    (pricePerPlayerUnits == null ? 0 : pricePerPlayerUnits!.hashCode);

  @override
  String toString() => 'CreateMatchDTO[fieldId=$fieldId, organizerId=$organizerId, startHour=$startHour, startDay=$startDay, startMonth=$startMonth, startYear=$startYear, endHour=$endHour, endDay=$endDay, endMonth=$endMonth, endYear=$endYear, nrOfPlayersRequired=$nrOfPlayersRequired, playerCanJoin=$playerCanJoin, cancelled=$cancelled, cancelledReason=$cancelledReason, pricePerPlayerUnits=$pricePerPlayerUnits]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.fieldId != null) {
      json[r'fieldId'] = this.fieldId;
    } else {
      json[r'fieldId'] = null;
    }
    if (this.organizerId != null) {
      json[r'organizerId'] = this.organizerId;
    } else {
      json[r'organizerId'] = null;
    }
    if (this.startHour != null) {
      json[r'startHour'] = this.startHour;
    } else {
      json[r'startHour'] = null;
    }
    if (this.startDay != null) {
      json[r'startDay'] = this.startDay;
    } else {
      json[r'startDay'] = null;
    }
    if (this.startMonth != null) {
      json[r'startMonth'] = this.startMonth;
    } else {
      json[r'startMonth'] = null;
    }
    if (this.startYear != null) {
      json[r'startYear'] = this.startYear;
    } else {
      json[r'startYear'] = null;
    }
    if (this.endHour != null) {
      json[r'endHour'] = this.endHour;
    } else {
      json[r'endHour'] = null;
    }
    if (this.endDay != null) {
      json[r'endDay'] = this.endDay;
    } else {
      json[r'endDay'] = null;
    }
    if (this.endMonth != null) {
      json[r'endMonth'] = this.endMonth;
    } else {
      json[r'endMonth'] = null;
    }
    if (this.endYear != null) {
      json[r'endYear'] = this.endYear;
    } else {
      json[r'endYear'] = null;
    }
    if (this.nrOfPlayersRequired != null) {
      json[r'nrOfPlayersRequired'] = this.nrOfPlayersRequired;
    } else {
      json[r'nrOfPlayersRequired'] = null;
    }
    if (this.playerCanJoin != null) {
      json[r'playerCanJoin'] = this.playerCanJoin;
    } else {
      json[r'playerCanJoin'] = null;
    }
    if (this.cancelled != null) {
      json[r'cancelled'] = this.cancelled;
    } else {
      json[r'cancelled'] = null;
    }
    if (this.cancelledReason != null) {
      json[r'cancelledReason'] = this.cancelledReason;
    } else {
      json[r'cancelledReason'] = null;
    }
    if (this.pricePerPlayerUnits != null) {
      json[r'pricePerPlayerUnits'] = this.pricePerPlayerUnits;
    } else {
      json[r'pricePerPlayerUnits'] = null;
    }
    return json;
  }

  /// Returns a new [CreateMatchDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateMatchDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateMatchDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateMatchDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateMatchDTO(
        fieldId: mapValueOfType<int>(json, r'fieldId'),
        organizerId: mapValueOfType<int>(json, r'organizerId'),
        startHour: mapValueOfType<int>(json, r'startHour'),
        startDay: mapValueOfType<int>(json, r'startDay'),
        startMonth: mapValueOfType<int>(json, r'startMonth'),
        startYear: mapValueOfType<int>(json, r'startYear'),
        endHour: mapValueOfType<int>(json, r'endHour'),
        endDay: mapValueOfType<int>(json, r'endDay'),
        endMonth: mapValueOfType<int>(json, r'endMonth'),
        endYear: mapValueOfType<int>(json, r'endYear'),
        nrOfPlayersRequired: mapValueOfType<int>(json, r'nrOfPlayersRequired'),
        playerCanJoin: mapValueOfType<bool>(json, r'playerCanJoin'),
        cancelled: mapValueOfType<bool>(json, r'cancelled'),
        cancelledReason: mapValueOfType<String>(json, r'cancelledReason'),
        pricePerPlayerUnits: mapValueOfType<int>(json, r'pricePerPlayerUnits'),
      );
    }
    return null;
  }

  static List<CreateMatchDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateMatchDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateMatchDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateMatchDTO> mapFromJson(dynamic json) {
    final map = <String, CreateMatchDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateMatchDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateMatchDTO-objects as value to a dart map
  static Map<String, List<CreateMatchDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateMatchDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateMatchDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

