//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateMatchDTO {
  /// Returns a new [UpdateMatchDTO] instance.
  UpdateMatchDTO({
    this.fieldId,
    this.organizerId,
    this.startTime,
    this.endTime,
    this.nrOfPlayersRequired,
    this.playerCanJoin,
    this.finished,
    this.cancelled,
    this.cancelledReason,
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
  DateTime? startTime;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? endTime;

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
  bool? finished;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? cancelled;

  String? cancelledReason;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateMatchDTO &&
    other.fieldId == fieldId &&
    other.organizerId == organizerId &&
    other.startTime == startTime &&
    other.endTime == endTime &&
    other.nrOfPlayersRequired == nrOfPlayersRequired &&
    other.playerCanJoin == playerCanJoin &&
    other.finished == finished &&
    other.cancelled == cancelled &&
    other.cancelledReason == cancelledReason;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (fieldId == null ? 0 : fieldId!.hashCode) +
    (organizerId == null ? 0 : organizerId!.hashCode) +
    (startTime == null ? 0 : startTime!.hashCode) +
    (endTime == null ? 0 : endTime!.hashCode) +
    (nrOfPlayersRequired == null ? 0 : nrOfPlayersRequired!.hashCode) +
    (playerCanJoin == null ? 0 : playerCanJoin!.hashCode) +
    (finished == null ? 0 : finished!.hashCode) +
    (cancelled == null ? 0 : cancelled!.hashCode) +
    (cancelledReason == null ? 0 : cancelledReason!.hashCode);

  @override
  String toString() => 'UpdateMatchDTO[fieldId=$fieldId, organizerId=$organizerId, startTime=$startTime, endTime=$endTime, nrOfPlayersRequired=$nrOfPlayersRequired, playerCanJoin=$playerCanJoin, finished=$finished, cancelled=$cancelled, cancelledReason=$cancelledReason]';

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
    if (this.startTime != null) {
      json[r'startTime'] = this.startTime!.toUtc().toIso8601String();
    } else {
      json[r'startTime'] = null;
    }
    if (this.endTime != null) {
      json[r'endTime'] = this.endTime!.toUtc().toIso8601String();
    } else {
      json[r'endTime'] = null;
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
    if (this.finished != null) {
      json[r'finished'] = this.finished;
    } else {
      json[r'finished'] = null;
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
    return json;
  }

  /// Returns a new [UpdateMatchDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateMatchDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UpdateMatchDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UpdateMatchDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateMatchDTO(
        fieldId: mapValueOfType<int>(json, r'fieldId'),
        organizerId: mapValueOfType<int>(json, r'organizerId'),
        startTime: mapDateTime(json, r'startTime', r''),
        endTime: mapDateTime(json, r'endTime', r''),
        nrOfPlayersRequired: mapValueOfType<int>(json, r'nrOfPlayersRequired'),
        playerCanJoin: mapValueOfType<bool>(json, r'playerCanJoin'),
        finished: mapValueOfType<bool>(json, r'finished'),
        cancelled: mapValueOfType<bool>(json, r'cancelled'),
        cancelledReason: mapValueOfType<String>(json, r'cancelledReason'),
      );
    }
    return null;
  }

  static List<UpdateMatchDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateMatchDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateMatchDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateMatchDTO> mapFromJson(dynamic json) {
    final map = <String, UpdateMatchDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateMatchDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateMatchDTO-objects as value to a dart map
  static Map<String, List<UpdateMatchDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdateMatchDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateMatchDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

